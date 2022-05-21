import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'スライドパズル',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () => showPuzzlePage(context),
                child: const Text('スタート'))
          ],
        ),
      ),
    );
  }

  void showPuzzlePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PuzzlePage()),
    );
  }
}

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<int> tileNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 0];

  @override
  Widget build(BuildContext conntext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スライドパズル'),
        actions: [
          // 保存したタイルの状態を読み込むボタン
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.play_arrow),
          ),
          // 現在のタイル状態を保存するボタン
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                // タイル一覧
                child: TilesView(
                  // データを渡す
                  numbers: tileNumbers,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.shuffle),
                label: const Text('シャッフル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TilesView extends StatelessWidget {
  final List<int> numbers;

  const TilesView({
    Key? key,
    // データを受け取る
    required this.numbers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: numbers.map((number) {
        if (number == 0) {
          return Container();
        }
        return TileView(
          number: number,
          color: Colors.blue,
          onPressed: () => {},
        );
      }).toList(),
    );
  }
}

class TileView extends StatelessWidget {
  final int number;
  final Color color;
  final void Function() onPressed;

  const TileView({
    Key? key,
    required this.number,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color, textStyle: const TextStyle(fontSize: 32)),
      child: Center(child: Text(number.toString())),
    );
  }
}
