int sum(List<int> score){
  int total = 0;
  for (int i in score){
    total += i;
  }
  return total;
}
void main() {
  List<int> score = [8,30,17,18];
  int total = sum(score);
  print('Alexander Mohamad\'s total score is $total');
}
