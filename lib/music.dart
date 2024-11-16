import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  // ignore: unused_field
  final String _currentSong = '';
  bool _isPlaying = false;

  void _playSong() {
    _audioPlayer.play('assets/music/Bensley - Burn It Up.mp3' as Source);
    setState(() {
      _isPlaying = true;
    });
  }

  void _pauseSong() {
    _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _stopSong() {
    _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
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
              onPressed: _playSong,
              child: Text('Play'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pauseSong,
              child: Text('Pause'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _stopSong,
              child: Text('Stop'),
            ),
            SizedBox(height: 20),
            Text(_isPlaying ? 'Playing' : 'Not Playing'),
          ],
        ),
      ),
    );
  }
}