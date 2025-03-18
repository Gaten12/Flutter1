import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _score = 0;
  double _circleX = 100, _circleY = 100;
  final double _circleSize = 50;
  final Random _random = Random();
  int _colorIndex = 0;
  int _speed = 1500; // Awal 1.5 detik per lingkaran
  Timer? _gameTimer;
  List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startGame();
    });
  }

  void _startGame() {
    _moveCircle(); // Munculkan pertama kali
    _gameTimer = Timer.periodic(Duration(milliseconds: _speed), (timer) {
      _moveCircle();
    });
  }

  void _moveCircle() {
    if (!mounted) return;

    setState(() {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      _circleX = _random.nextDouble() * (screenWidth - _circleSize);
      _circleY = _random.nextDouble() * (screenHeight - _circleSize - 100);
      _colorIndex = (_colorIndex + 1) % _colors.length;
    });
  }

  void _increaseScore() {
    setState(() {
      _score++;

      // Semakin tinggi skor, semakin cepat
      if (_score % 5 == 0 && _speed > 400) {
        _speed -= 200;
        _gameTimer?.cancel();
        _startGame();
      }
    });
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradasi
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [_colors[_colorIndex], _colors[(_colorIndex + 3) % _colors.length]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Tulisan Selamat Datang
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selamat Datang!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Skor: $_score",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Lingkaran yang bisa ditap
          Positioned(
            left: _circleX,
            top: _circleY,
            child: GestureDetector(
              onTap: () {
                _increaseScore();
                _moveCircle();
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _circleSize,
                height: _circleSize,
                decoration: BoxDecoration(
                  color: _colors[_colorIndex],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
