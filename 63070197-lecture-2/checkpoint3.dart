import 'dart:io';
void main() {
  print('Please answer the questions below:\n1. What is student name?');
  String? name = stdin.readLineSync();
  print('2.How many score does he/she have?');
  String? score = stdin.readLineSync();
  int int_score;
  if (score?.isEmpty ?? true){
    int_score = 0;
  }else{
    int_score = int.parse(score ?? '0');
  }
  print('$name has $score scores');
}