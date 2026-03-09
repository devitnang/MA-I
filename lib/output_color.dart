void printSuccess(String msg) {
  // Green background, white bold text
  print('\x1B[42m\x1B[1m\x1B[37m $msg \x1B[0m');
}

void printError(String msg) {
  // Red background, white bold text
  print('\x1B[41m\x1B[1m\x1B[37m $msg \x1B[0m');
}

void printInfo(String msg) {
  print('\x1B[1m$msg\x1B[0m'); // Bold text, default color
}