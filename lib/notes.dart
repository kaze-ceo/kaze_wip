import 'package:flutter/material.dart';

class ToDoNotesList extends StatefulWidget {
  @override
  _ToDoNotesListState createState() => _ToDoNotesListState();
}

class _ToDoNotesListState extends State<ToDoNotesList> {
  final List<Note> _notes = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do Notes List'),
      ),
      body: Column(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _notes.add(Note(_textController.text));
            _textController.clear();
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