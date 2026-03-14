import 'dart:io';
import 'output_color.dart';

Map<String, String> userCredentials = {
  'User_A': '123',
  'User_B': '123',
  'User_C': '123',
};

Map<String, double> balances = {
  'User_A': 700.0,
  'User_B': 500.0,
  'User_C': 300.0,
};

Map<String, List<Map<String, dynamic>>> transactionHistory = {
  'User_A': [],
  'User_B': [],
  'User_C': [],
};

String now() {
  final d = DateTime.now();
  return '${d.year}-${_pad(d.month)}-${_pad(d.day)} '
      '${_pad(d.hour)}:${_pad(d.minute)}:${_pad(d.second)}';
}

String _pad(int n) => n.toString().padLeft(2, '0');

void addHistory(String user, String type, double amount, String note) {
  transactionHistory[user]!.add({
    'type': type,
    'amount': amount,
    'date': now(),
    'note': note,
  });
}

void deposit(String user) {
  stdout.write('Deposit amount: \$');
  double? amount = double.tryParse(stdin.readLineSync() ?? '');
  if (amount == null || amount <= 0) {
    printError('Invalid amount.');
    return;
  }
  balances[user] = balances[user]! + amount;
  addHistory(user, 'Deposit', amount, 'Self deposit');
  printSuccess(
    'Deposit successful. New balance: \$${balances[user]!.toStringAsFixed(2)}',
  );
}

void withdraw(String user) {
  stdout.write('Withdraw amount: \$');
  double? amount = double.tryParse(stdin.readLineSync() ?? '');
  if (amount == null || amount <= 0) {
    printError('Invalid amount.');
    return;
  }
  if (amount > balances[user]!) {
    printError('Insufficient balance.');
    return;
  }
  balances[user] = balances[user]! - amount;
  addHistory(user, 'Withdraw', amount, 'Self withdrawal');
  printSuccess(
    'Withdraw successful. New balance: \$${balances[user]!.toStringAsFixed(2)}',
  );
}

void checkBalance(String user) {
  double bal = balances[user]!;
  if (bal >= 0) {
    printSuccess('Current balance: \$${bal.toStringAsFixed(2)}');
  } else {
    printError('Current balance: \$${bal.toStringAsFixed(2)}');
  }
}

void viewTransactionHistory(String user) {
  print('\nAvailable accounts: ${balances.keys.join(', ')}');
  stdout.write('Choose account to view history: ');
  String? target = stdin.readLineSync()?.trim();

  if (target != user) {
    printError('Access denied. You can only view your own history.');
    return;
  }

  List<Map<String, dynamic>> history = transactionHistory[user]!;
  if (history.isEmpty) {
    printError('No transactions found.');
    return;
  }

  printInfo('\n--- Transaction History for $user ---');
  for (var tx in history) {
    String sign = (tx['type'] == 'Deposit' || tx['type'] == 'Transfer In')
        ? '+'
        : '-';
    double amt = tx['amount'];
    String line =
        '[${tx['date']}] ${tx['type']}: $sign\$${amt.toStringAsFixed(2)}  (${tx['note']})';
    if (sign == '+') {
      printSuccess(line);
    } else {
      printError(line);
    }
  }
}

void showMenu(String user) {
  bool inMenu = true;
  while (inMenu) {
    print('\n-------------- Menu ($user) --------------------');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Transaction History');
    print('5. Logout');
    print('6. Exit');
    stdout.write('Choose option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        deposit(user);
        break;
      case '2':
        withdraw(user);
        break;
      case '3':
        checkBalance(user);
        break;
      case '4':
        viewTransactionHistory(user);
        break;
      case '5':
        printInfo('Logged out. Goodbye, $user!');
        inMenu = false;
        break;
      case '6':
        printInfo('Exiting... Goodbye!');
        exit(0);
      default:
        printError('Invalid option. Please choose 1-6.');
    }
  }
}
