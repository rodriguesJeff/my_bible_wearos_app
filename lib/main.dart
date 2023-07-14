import 'package:flutter/material.dart';
import 'package:my_first_wear_os_app/data/datasources/datasource.dart';
import 'package:my_first_wear_os_app/data/models/verse_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataSourceAPI dataSource = DataSourceAPI();
  String currentVerse = "";

  getRandomVerse() async {
    final result = await dataSource.getRandomVerse();
    result.fold(
      (l) {
        setState(() {
          currentVerse = l;
        });
      },
      (r) {
        setState(() {
          currentVerse = r.text ?? "";
        });
      },
    );
  }

  @override
  void initState() {
    getRandomVerse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: <Widget>[
              child: Text(
                currentVerse,
              ),
              // ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRandomVerse,
        tooltip: 'Increment',
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
