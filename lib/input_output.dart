import 'dart:io';

void inputOutput() {
  Map<String, String> userCredential = {
    "admin": "12345",
    "sale": 'sal@123',
    "accountant": "Accountant@2025",
    // key : Value
  };

  bool process = true;
  while (process) {
    print('<<<<<<<<<<<<<<<< Login >>>>>>>>>>>>>>>>>');
    // User input incoorect user than response User not found!
    // User input incoorect password then response Invalid credential!
    // response Login successsfully, Welcome, $user
    stdout.write('Enter username: ');
    String? username = stdin.readLineSync();
    stdout.write('Enter password: ');
    String? password = stdin.readLineSync();

    String? checkedPassword = userCredential[username];
    if (checkedPassword == null) {
      print('User not found');
    } else {
      if (checkedPassword == password) {
        print('Login successfully, Welcome, $username');
        process = false;
      } else {
        print('Invalid credential');
      }
    }
  }
}


// print('Enter your name: ');
  // String name;
  // name = stdin.readLineSync() ?? ''; // stndin.readLineSync() returns a nullable String, so we use the null-aware operator to provide a default value of an empty string if it is null.
  // print('Hello, $name!');

  // print('Press any key: ');
  // int byte = stdin.readByteSync();
  // print('You pressed: $byte');

  //   stdout.write('Enter you age: \n'); // waits for user input on the same line
  //   print('Welcome to Dart!');
  // }


// void studentInfo() {
  //   String? name;
  //   String? gender;
  //   String? dateOfBirth;
  //   int? age;
  //   String? address;
  //   String? major;
  //   String? subjects;
  //   double? score;

  //   print('---------------------- Enter your Information---------------------- ');

  //   stdout.write('Enter your name: ');
  //   name = stdin.readLineSync();

  //   stdout.write('Enter your gender: ');
  //   gender = stdin.readLineSync();

  //   stdout.write('Enter your date of birth: ');
  //   dateOfBirth = stdin.readLineSync();

  //   stdout.write('Enter your age: ');
  //   // age = int.parse(stdin.readLineSync() ?? '0');
  //   age = int.tryParse(stdin.readLineSync() ?? '0');

  //   stdout.write('Enter your address: ');
  //   address = stdin.readLineSync();

  //   stdout.write('Enter your major: ');
  //   major = stdin.readLineSync();

  //   stdout.write('Enter your subjects: ');
  //   subjects = stdin.readLineSync();

  //   stdout.write('Enter your score: ');
  //   score = double.tryParse(stdin.readLineSync() ?? '0');

  //   print('---------------------- Student Information---------------------- ');
  //   print('''Name: $name
  // Gender: $gender
  // Date of Birth: $dateOfBirth
  // Age: $age
  // Address: $address
  // Major: $major
  // Subjects: $subjects
  // Score: $score
  // ''');

  // List<String> fruits = ['Mango', 'Apple', 'Grapes', 'Banana'];
  // // fruits = [];

  // // print(fruits[0]); // Mango
  // print(fruits.length); // output : 4
  // print(fruits.first); // output : Mango
  // print(fruits.last); // output : Banana
  // print(fruits.reversed.toList()); // output : [Banana, Grapes, Apple, Mango]
  // print(fruits.isEmpty); // output : false
  // print(fruits.isNotEmpty); // output : true
  // print(fruits.indexOf('Mango')); // output : 0
  // // print(fruits.take(5)); // output : (Mango, Apple, Grapes, Banana) - it will take the first 5 elements of the list, but since there are only 4 elements, it will return all of them.
  // fruits.add('Pear'); // adds 'Pear' to the end of the list
  // fruits.insert(
  //   0,
  //   'element',
  // ); // inserts 'element' at index 10, but since the list currently has only 5 elements (after adding 'Pear'), it will add 'element' at the end of the list.
  // fruits.addAll([
  //   'Banana',
  //   'Orange',
  // ]); // adds multiple elements to the end of the list
  // fruits.insertAll(0, [
  //   'Star Fruits',
  //   'Blue Orange',
  // ]); // inserts multiple elements at a specific index in the list
  // print(fruits);

  // String fruitNames = '';
  // // for (var fruit in fruits) {
  // //   int index = fruits.indexOf(fruit);
  // //   fruitNames += fruit +  (index < fruit.length - 1 ? ', ' : '');
  // // }

  // for (var i = 0; i < fruits.length; i++) {
  //   fruitNames += fruits[i] + (i < fruits.length - 1 ? ', ' : '');
  // }
  // print(fruitNames)