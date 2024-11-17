import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ToDoNotesList extends StatefulWidget {
  @override
  _ToDoNotesListState createState() => _ToDoNotesListState();
}

class _ToDoNotesListState extends State<ToDoNotesList> {
  List<Note> _notes = [];
  final TextEditingController _textController = TextEditingController();
  final String _fileName = 'notes.txt';

  Future<void> _loadNotes() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$_fileName');
    if (await file.exists()) {
      final contents = await file.readAsString();
      setState(() {
        _notes = contents.split('\n').map((text) => Note(text)).toList();
      });
    }
  }

  Future<void> _saveNotes() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$_fileName');
    await file.writeAsString(_notes.map((note) => note.text).join('\n'));
  }

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Notes List'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photos/background_photo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Add a new note',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_notes[index].text),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _notes.add(Note(_textController.text));
            _textController.clear();
            _saveNotes();
          });
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Note {
  String text;

  Note(this.text);
}