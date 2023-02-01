import 'dart:io';
void main(List<String> args) {
  print('1. what is student name');
  String? studetname = stdin.readLineSync();

  print('2.How many score does he/she have?');
  String? studentscore = stdin.readLineSync();

  // check null
  int score;
  // if null return score = 0
  if (studentscore?.isEmpty ?? true){
    score = 0;
  }
  else{
    score = int.parse(studentscore ?? '0');
  }
  print('$studetname has $score scores');
}