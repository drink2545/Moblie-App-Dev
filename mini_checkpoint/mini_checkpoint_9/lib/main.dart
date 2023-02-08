import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mini checkpoint 8'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) -3.33,
                  height: 50,
                  child: TextButton(
                    onPressed: () => debugPrint('here'),
                    child: Text('APPS')),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) -3.33,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => debugPrint('2here'),
                    child: Text('MOVIES'),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width / 3) -3.33,
                  height: 50,
                  child: TextButton(
                    onPressed: () => debugPrint('here'),
                    child: Text('Start course')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
