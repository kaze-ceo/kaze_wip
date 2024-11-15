// main_menu.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/music.dart';
import 'package:flutter_application_1/meditation.dart';
import 'package:flutter_application_1/notes.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _streak = 0;

  void _incrementStreak() {
    setState(() {
      _streak++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicPlayer()),
                );
              },
              child: Text('Radio'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeditationPage()),
                );
              },
              child: Text('Meditation'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ToDoNotesList()),
                );
              },
              child: Text('Notes'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 100),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Streak: $_streak days',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: _incrementStreak,
              child: Text('Increment Streak'),
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