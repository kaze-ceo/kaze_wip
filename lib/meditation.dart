// meditation.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MeditationPage extends StatefulWidget {
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> get _musicList => [
    'music/123.mp3',
    'music/123.mp3',
    'music/123.mp3',
  ];
  int _timer = 0;
  // ignore: unused_field
  bool _isPlaying = false;

  AudioPlayer _currentPlayer = AudioPlayer();
  String? _currentMusic;

  void _playMusic() async {
    final newMusic = _musicList[Random().nextInt(_musicList.length)];
    if (_currentMusic == newMusic) return;
    _currentMusic = newMusic;
    await _currentPlayer.stop();
    await _currentPlayer.setSource(AssetSource(_currentMusic!));
    await _currentPlayer.resume();
  }

  void _stopMusic() async {
    _audioPlayer.stop();
    _isPlaying = false;
  }

  Timer? _timerInstance;

  void _startTimer() {
    _timerInstance = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _timer = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      });
    });
  }

  @override
  void dispose() {
    _timerInstance?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _playMusic();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditation'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$_timer seconds',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _stopMusic();
                Navigator.maybePop(context);
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              child: const Text('End Meditation'),
            ),
          ],
        ),
      ),
    );
  }

}