import 'dart:io';
import 'output_color.dart';
import 'MyMethods.dart';

void main() {
  bool running = true;
  while (running) {
    print('\n------------- Bank Simulation --------------');
    print('1. Login');
    print('2. Exit');
    stdout.write('Choose option: ');
    String? option = stdin.readLineSync();

    if (option == '2') {
      printInfo('Goodbye!');
      exit(0);
    }

    if (option != '1') {
      printError('Invalid option.');
      continue;
    }
    
    bool loggedIn = false;
    while (!loggedIn) {
      stdout.write('Username: ');
      String? username = stdin.readLineSync()?.trim();
      stdout.write('Password: ');
      String? password = stdin.readLineSync();

      if (username == null || !userCredentials.containsKey(username)) {
        printError('User not found!');
        continue;
      }

      if (userCredentials[username] != password) {
        printError('Invalid credential!');
        continue;
      }

      printSuccess('Login successfully, Welcome, $username');
      loggedIn = true;
      showMenu(username);
    }
  }
}
