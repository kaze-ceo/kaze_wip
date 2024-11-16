import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  // ignore: unused_field
  final String _currentSong = 'assets/music/123.mp3';
  bool _isPlaying = false;

  void _playSong() {
    _audioPlayer.setSource(AssetSource(_currentSong!));
    _audioPlayer.resume();    
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
        title: const Text('Radio Lo-Fi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _playSong,
              child: Image.asset('assets/photos/play.mp3'),
            ),
            ElevatedButton(
              onPressed: _pauseSong,
              child: Image.asset('assets/photos/play.mp3'),
            ),
            ElevatedButton(
              onPressed: _stopSong,
              child: Image.asset('assets/photos/play.mp3'),
            ),
            Text(_isPlaying ? 'Playing' : 'Not Playing'),
          ],
        ),
      ),
    );
  }
}