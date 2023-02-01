Future<int> fetchStudentScore() => Future.delayed(
  const Duration(seconds: 2),
  () => 99,
);

void createScoreMessage(void Function(String) callbackFunction){
  var score =fetchStudentScore();
  score.then((value){
    callbackFunction('Your score is: $value');
  });
}

void main(List<String> args) {
  void Function(String) printMyMessage = (String message){
    print(message);
  };
  print('Fetching student score...');
  createScoreMessage(printMyMessage);
}