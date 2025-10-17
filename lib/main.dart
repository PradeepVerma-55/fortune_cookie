import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Print uncaught Flutter errors to console (helpful when emulator hangs on launch)
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    // Also print to stdout so `flutter run` / IDE logs show it clearly
    print('FlutterError: ${details.exceptionAsString()}');
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter First Demo Home Page",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Make MyHomePage const to avoid unnecessary rebuilds
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
  // Provide an initial instruction string so the card isn't empty
  String _currentFortune = "Tap \"Get Fortune\" to reveal your fortune.";
  final _fortuneList = [
    "You will have a great day!",
    "Success is on the horizon.",
    "Happiness is a choice.",
    "Adventure awaits you.",
    "Believe in yourself.",
  ];

  void _randomizeFortune() {
    var random = Random();
    int fortuneIndex = random.nextInt(_fortuneList.length);

    setState(() {
      _currentFortune = _fortuneList[fortuneIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Flutter First Demo Fortune App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/fortune-cookie.png",
              width: 200,
              height: 200,
              // If the asset is missing or fails to load, show a placeholder and print the error
              errorBuilder: (context, error, stackTrace) {
                print('Image load error: $error');
                return const SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(child: Icon(Icons.broken_image, size: 80)),
                );
              },
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _currentFortune,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _randomizeFortune,
              child: Text("Get Fortune"),
            ),
          ],
        ),
      ),
    );
  }
}
