import 'io.dart';

Future<int> fetchStudentScore() => Future.delayed(
  const Duration(seconds: 2),
  () => 99,
);

Future<String> createScoreMessage() async{
  var score = await fetchStudentScore();
  return 'your score is: $score';
}

void main() async{
  print('Fetching student score...');
  print(await createScoreMessage());
}