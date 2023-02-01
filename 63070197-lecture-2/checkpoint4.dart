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
  if (int_score > 100){
    return print('$name is cheat');
  }
  List<int> grade = [80,70,60,50,0];
  List<String> strgrade = ['A','B','C','D','E'];
  for (int i=0;i<5;i++){
    if (int_score >= grade[i]){
      return print('$name has $score which is '+strgrade[i]);
    }
  }
}