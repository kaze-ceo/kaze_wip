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
  final List<String> _musicList = [
    'music/FATESKY & Aftermarket - Redemption.mp3',
    'music/Hamdi & Princess Superstar - Counting (Simula Remix).mp3',
    'music/Midnight CVLT - Better Days.mp3',
  ];
  String _currentMusic = '';
  int _timer = 0;
  // ignore: unused_field
  bool _isPlaying = false;

  void _playMusic() async {
    _currentMusic = _musicList[Random().nextInt(_musicList.length)];
    await _audioPlayer.play(_currentMusic);
    _isPlaying = true;
  }

  void _stopMusic() async {
    await _audioPlayer.stop();
    _isPlaying = false;
  }

  void _startTimer() {
    _timer = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timer++;
      });
    });
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
        title: Text('Meditation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_timer seconds',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _stopMusic();
                Navigator.pop(context);
              },
              child: Text('End Meditation'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}