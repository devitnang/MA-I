void stuInfo() {
  int id = 1;
  String name = 'Sok Sopheak';
  String dateOfBirth = '01-01-2003';
  int age = 21;
  String address = 'Steung Mean Chey, Phnom Penh, Cambodia';
  String subject = 'Mobile Application - I';
  double score = 85.5;

  String grade;
  String gradeMessage;

  if (score >= 90) {
    grade = 'A';
    gradeMessage = 'Excellent';
  } else if (score >= 80) {
    grade = 'B';
    gradeMessage = 'Very Good';
  } else if (score >= 70) {
    grade = 'C';
    gradeMessage = 'Good';
  } else if (score >= 60) {
    grade = 'D';
    gradeMessage = 'Pass';
  } else if (score >= 50) {
    grade = 'E';
    gradeMessage = 'Medium';
  } else {
    grade = 'F';
    gradeMessage = 'Fail';
  }

  print("==================== SETEC INSTITUTE ====================\n");
  print('ID: $id');
  print('Name: $name');
  print('Date of Birth: $dateOfBirth');
  print('Age: $age');
  print('Address: $address');
  print('Subject: $subject');
  print('Score: $score');

  switch (grade) {
    case 'A':
      print('\x1B[1;37;42mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
    case 'B':
      print('\x1B[1;37;44mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
    case 'C':
      print('\x1B[1;30;43mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
    case 'D':
      print('\x1B[1;37;45mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
    case 'E':
      print('\x1B[1;33;46mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
    case 'F':
      print('\x1B[1;37;41mGrade: $grade ($gradeMessage)\x1B[0m');
      break;
  }
  print("\n========================================================");
}