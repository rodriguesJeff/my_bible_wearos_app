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
  String error = "";
  VerseModel? currentVerse;
  bool isLoading = false;

  getRandomVerse() async {
    setState(() {
      isLoading = true;
    });
    final result = await dataSource.getRandomVerse();
    result.fold(
      (l) {
        setState(() {
          error = l;
        });
      },
      (r) {
        setState(() {
          currentVerse = r;
        });
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getRandomVerse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Builder(
            builder: (c) {
              if (isLoading) {
                return const CircularProgressIndicator();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (currentVerse != null)
                        Text(
                          "${currentVerse!.book!.name!} - ${currentVerse!.chapter!}:${currentVerse!.number}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      Text(
                        currentVerse?.text ?? error,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getRandomVerse,
        tooltip: 'Buscar novamente',
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
