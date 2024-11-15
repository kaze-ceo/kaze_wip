import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  List<String> _selfLoveSongs = [
    'music/Bensley - Burn It Up.mp3',
    'song2.mp3',
    'song3.mp3',
  ];
  List<String> _selfLossSongs = [
    'song4.mp3',
    'song5.mp3',
    'song6.mp3', 
  ];
  late String _currentSong;

  void _playSelfLoveSong() {
    _currentSong = _selfLoveSongs[Random().nextInt(_selfLoveSongs.length)];
    _audioPlayer.play(_currentSong as Source, isLocal: true);
  }

  void _playSelfLossSong() {
    _currentSong = _selfLossSongs[Random().nextInt(_selfLossSongs.length)];
    _audioPlayer.play(_currentSong as Source, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _playSelfLoveSong,
              child: Text('Self Love'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playSelfLossSong,
              child: Text('Self Loss'),
            ),
          ],
        ),
      ),
    );
  }
}