import 'dart:convert';

import 'package:emotions_notes/src/model/note_m.dart';

class Note {
  static final List<Note> _notes = [];

  static int _idCounter = 0;
  final int id;
  final Emotion emotion;
  final String trigger;
  final String solveWay;
  final DateTime date;

  Note(this.emotion, this.solveWay, this.trigger)
      : id = _idCounter++,
        date = DateTime.now() {
    _notes.add(this);
  }

  void delete() => _notes.removeWhere((note) => note == this);

  String get toJSON =>
      jsonEncode({
        "id": id,
        "emotion": Emotion.values.indexOf(emotion),
        "trigger": trigger,
        "solveWay": solveWay,
        "date": date.toString()
      });

  static List<Note> get allNotes => List<Note>.from(_notes);

}

enum Emotion {
  none,
  fear,
  shame,
  guilt
  //TODO: Make more emotions
}
