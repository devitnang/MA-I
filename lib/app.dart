int calculate() {
  return 6 * 7;
}

void declaration() {
  late String email;
  const passScore = 50;
  final expireDate = DateTime.now();

  dynamic ten = 10;
  ten = 'Ten';

  int number = 412;

  if (number % 2 == 0) {
    print('Even');
  } else {
    print('Odd');
  }

  bool isEven = number % 2 == 0 ? true : false;
  print(isEven);
}

void startApp() {
  print("App is starting...");
}

void studentInfo() {
  int id = 1;
  String name = 'Nang Devit';
  String dateOfBirth = '01/01/2000';
  int age = 24;
  String address = 'STEUNG MEAN CHEY, PHNOM PENH, CAMBODIA';
  String subject = 'MA - I';
  double score = 85.5;

  // Score from 90 to 100: A
  // Score from 80 to 89: B
  // Score from 70 to 79: C
  // Score from 60 to 69: D
  // Score below 60: F

  // set output style (color and text style)
  // Grade = A => output student inti with green background color, white text color and set  date to text bold
  String backgroundColor = '';
  String textColor = '';
  String textStyle = '';

  // String grade;
  // if (score >= 90) {
  //   grade = 'A';
  //   backgroundColor = '42'; // Green background
  //   textColor = '37'; // White text
  //   textStyle = '1'; // Bold text
  // } else if (score >= 80) {
  //   grade = 'B';
  // } else if (score >= 70) {
  //   grade = 'C';
  //   print('\x1B[44m\x1B[37m'); // Blue background, white text
  // } else if (score >= 60) {
  //   grade = 'D';
  //   print('\x1B[45m\x1B[37m'); // Magenta background, white text
  // } else {
  //   grade = 'F';
  //   print('\x1B[41m\x1B[37m'); // Red background, white text
  // }

  // String grade = 'A';
  // switch (grade) {
  //   case 'A';
  //     print('Excellent');
  //     break;
  //   case 'B';
  //     print('Good');
  //     break;
  //   case 'C';
  //     print('Average');
  //     break;
  //   defualt;
  //     print(Needs more effort);
  // }

  print("====================SETEC INSTITUTE====================\n");
  print('''
\x1B[$textStyle,$textColor,${backgroundColor}m]
id: $id
name: $name
dateOfBirth: $dateOfBirth
age: $age
address: $address
subject: $subject
score: $score
''');
  print("=======================================================\n");
}

void outputColor() {
  // Text color
  print('\x1B[31mThis is RED!\x1B[0m');
  print('\x1B[32mThis is GREEN!\x1B[0m');
  print('\x1B[33mThis is YELLOW!\x1B[0m');
  print('\x1B[34mThis is BLUE!\x1B[0m');
  print('\x1B[35mThis is MAGENTA!\x1B[0m');
  print('\x1B[36mThis is CYAN!\x1B[0m');
  print('\x1B[37mThis is WHITE!\x1B[0m');

  // Background color
  print('\x1B[41mThis is RED!\x1B[0m');
  print('\x1B[42mThis is GREEN!\x1B[0m');
  print('\x1B[43mThis is YELLOW!\x1B[0m');
  print('\x1B[44mThis is BLUE!\x1B[0m');
  print('\x1B[45mThis is MAGENTA!\x1B[0m');
  print('\x1B[46mThis is CYAN!\x1B[0m');
  print('\x1B[47mThis is WHITE!\x1B[0m');

  // Bold Text
  print('\x1B[1mThis is BOLD!\x1B[0m');

  // Bold + background + Text color
  print('\x1B[1;41;37mHello SV8.16\x1B[0m');
}
