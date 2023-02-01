Future<void> showCurrentTime() {
  return Future.delayed(const Duration(seconds: 1),
  () => print("Current Time Test ${DateTime.now()}"));
}
void main() async {
  int count = 0;
  while (true) {
    await showCurrentTime();
    count++;
    // print('round: ${count}');
  }
}