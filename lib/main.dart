import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter and Image Toggle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterImageReset(),
    );
  }
}

class CounterImageReset extends StatefulWidget {
  const CounterImageReset({super.key});

  @override
  _CounterImageResetState createState() => _CounterImageResetState();
}

class _CounterImageResetState extends State<CounterImageReset> {
  int _counter = 0;
  bool _isFirstImage = true;
  final String _image1 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf-0vqmmKK46GCDK7TMx_f4mNfqXdiP2nUkg&s';
  final String _image2 =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm2eKI0ckJAJ_lZ8ruBsPm3ylg4j5_87kYng&s';
  double _opacity = 1.0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _opacity = 0.0; // Fade out effect
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isFirstImage = !_isFirstImage;
        _opacity = 1.0; // Fade in effect
      });
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _isFirstImage = true;
      _opacity = 1.0; // Ensure opacity resets
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CW1'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Task 1: Increment',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Counter: $_counter',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Task 2: Image Toggle',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _opacity,
                    child: Image.network(
                      _isFirstImage ? _image1 : _image2,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Image not found',
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _toggleImage,
                    child: const Text('Toggle Image'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Task 3: Reset',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _reset,
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
