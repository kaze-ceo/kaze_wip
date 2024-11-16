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
    await _audioPlayer.stop();
    _isPlaying = false;
  }

  void _startTimer() {
    _timer = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(''),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_timer seconds',
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _stopMusic();
                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Text('End Meditation'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}