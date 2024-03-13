import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> wordsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            const Center(
              child: Icon(
                Icons.ac_unit,
                size: 200.0,
              ), // Add the desired icon here
            ),
            const SizedBox(height: 16),
            // Titulo e Text Input
            Row(
              children: [
                Text(
                  'Titulo:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _textEditingController.clear();
                    });
                  },
                  child: const Text('LIMPAR'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wordsList.add(_textEditingController.text);
                      _textEditingController.clear();
                    });
                  },
                  child: const Text('ADICIONAR'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Words List
            Expanded(
              child: ListView.builder(
                itemCount: wordsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Center(
                      child: Text(wordsList[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
