import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _selfLoveSongs = [
  'music/FATESKY & Aftermarket - Redemption.mp3',
     'music/Hamdi & Princess Superstar - Counting (Simula Remix).mp3',
     'music/Midnight CVLT - Better Days.mp3',
  ];
  final List<String> _selfLossSongs = [
  'music/FATESKY & Aftermarket - Redemption.mp3',
   'music/Hamdi & Princess Superstar - Counting (Simula Remix).mp3',
   'music/Midnight CVLT - Better Days.mp3',
  ];
  late String _currentSong;

  void _playSelfLoveSong() {
    _currentSong = _selfLoveSongs[Random().nextInt(_selfLoveSongs.length)];
   _audioPlayer.setSource(_currentSong as Source);
   _audioPlayer.resume();
  }

  void _playSelfLossSong() {
    _currentSong = _selfLossSongs[Random().nextInt(_selfLossSongs.length)];
    _audioPlayer.setSource(_currentSong as Source);
    _audioPlayer.resume();
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
