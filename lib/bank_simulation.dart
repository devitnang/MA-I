import 'dart:io';

void main() {
  // ─── User credentials & balances ───────────────────────────────────────────
  Map<String, String> userCredentials = {
    "Dev": "123",
    "Sey": "123",
    "Sulinh": "123",
  };

  Map<String, double> userBalances = {
    "Dev": 700.00,
    "Sey": 1500.00,
    "Sulinh": 0.00,
  };

  Map<String, List<String>> userHistory = {
    "Dev": [],
    "Sey": [],
    "Sulinh": [],
  };

  // ─── Outer loop: keeps app running after logout ────────────────────────────
  bool appRunning = true;
  while (appRunning) {
    // ── Main screen ──────────────────────────────────────────────────────────
    print('\n-------------- Bank Simulation --------------');
    print('1. Login');
    print('2. Exit');
    stdout.write('Choose option: ');
    String? menuChoice = stdin.readLineSync();

    if (menuChoice == '2') {
      print('Goodbye!');
      break;
    }

    if (menuChoice != '1') {
      print('Invalid option. Please try again.');
      continue;
    }

    // ── Login loop (follows your credential-check pattern) ───────────────────
    bool loginProcess = true;
    String? loggedInUser;

    while (loginProcess) {
      stdout.write('Username: ');
      String? username = stdin.readLineSync();
      stdout.write('Password: ');
      String? password = stdin.readLineSync();

      String? checkedPassword = userCredentials[username];

      if (checkedPassword == null) {
        print('User not found!');
      } else {
        if (checkedPassword == password) {
          print('\nLogin successfully, Welcome, $username!');
          loggedInUser = username;
          loginProcess = false;
        } else {
          print('Invalid credential!');
        }
      }
    }

    // ── Menu loop ─────────────────────────────────────────────────────────────
    bool menuRunning = true;
    while (menuRunning) {
      print('\n-------------- Menu ($loggedInUser) --------------');
      print('1. Deposit');
      print('2. Withdraw');
      print('3. Check Balance');
      print('4. Transaction History');
      print('5. Logout');
      print('6. Exit');
      stdout.write('Choose option: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        // ── Deposit ──────────────────────────────────────────────────────────
        case '1':
          stdout.write('Deposit amount: \$');
          String? input = stdin.readLineSync();
          double? amount = double.tryParse(input ?? '');

          if (amount == null || amount <= 0) {
            print('Invalid amount. Please enter a positive number.');
          } else {
            userBalances[loggedInUser!] = userBalances[loggedInUser]! + amount;
            double newBalance = userBalances[loggedInUser]!;
            userHistory[loggedInUser]!.add(
              'Deposited: +\$${amount.toStringAsFixed(2)} | Balance: \$${newBalance.toStringAsFixed(2)}',
            );
            print('Deposit successful. New balance: \$${newBalance.toStringAsFixed(2)}');
          }
          break;

        // ── Withdraw ─────────────────────────────────────────────────────────
        case '2':
          stdout.write('Withdraw amount: \$');
          String? input = stdin.readLineSync();
          double? amount = double.tryParse(input ?? '');

          if (amount == null || amount <= 0) {
            print('Invalid amount. Please enter a positive number.');
          } else if (amount > userBalances[loggedInUser!]!) {
            print(
              'Insufficient funds! Your balance is \$${userBalances[loggedInUser]!.toStringAsFixed(2)}',
            );
          } else {
            userBalances[loggedInUser] = userBalances[loggedInUser]! - amount;
            double newBalance = userBalances[loggedInUser]!;
            userHistory[loggedInUser]!.add(
              'Withdrew:  -\$${amount.toStringAsFixed(2)} | Balance: \$${newBalance.toStringAsFixed(2)}',
            );
            print('Withdraw successful. New balance: \$${newBalance.toStringAsFixed(2)}');
          }
          break;

        // ── Check Balance ─────────────────────────────────────────────────────
        case '3':
          print(
            '\nCurrent balance: \$${userBalances[loggedInUser!]!.toStringAsFixed(2)}',
          );
          break;

        // ── Transaction History ───────────────────────────────────────────────
        case '4':
          print('\n-------------- Transaction History --------------');
          List<String> history = userHistory[loggedInUser!]!;
          if (history.isEmpty) {
            print('No transactions yet.');
          } else {
            for (int i = 0; i < history.length; i++) {
              print('${i + 1}. ${history[i]}');
            }
          }
          break;

        // ── Logout ────────────────────────────────────────────────────────────
        case '5':
          print('\nLogged out successfully. Goodbye, $loggedInUser!');
          loggedInUser = null;
          menuRunning = false;
          break;

        // ── Exit ──────────────────────────────────────────────────────────────
        case '6':
          print('\nThank you for using our bank. Goodbye!');
          menuRunning = false;
          appRunning = false;
          break;

        default:
          print('\nInvalid option. Please choose 1–6.');
      }
    }
  }
}