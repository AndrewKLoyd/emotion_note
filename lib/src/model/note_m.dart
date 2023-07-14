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

  Note.fromJSON(Map<String, dynamic> loadedMap)
      : id = loadedMap["id"],
        emotion = Emotion.values[loadedMap["emotion"]],
        trigger = loadedMap["trigger"],
        solveWay = loadedMap["solveWay"],
        date = DateTime.parse(loadedMap["date"]) {
    _idCounter++;
    _notes.add(this);
  }

  void delete() => _notes.removeWhere((note) => note == this);

  Map<String, dynamic> get jsonMap => {
        "id": id,
        "emotion": Emotion.values.indexOf(emotion),
        "trigger": trigger,
        "solveWay": solveWay,
        "date": date.toString()
      };

  static void cleanNotes() => _notes.clear();

  static List<Note> get allNotes => List<Note>.from(_notes);
}

enum Emotion {

  none,

  // Anger
  grumpy,
  frustrated,
  annoyed,
  impatient,
  disgusted,
  offended,
  // Sad
  disappointed,
  regretful,
  paralyzed,
  depressed,
  pessimistic,
  tearful,
  // Hurt
  afraid,
  stressed,
  confused,
  skeptical,
  aggrieved, // Обиженный
  nervous,
  // Happy
  relaxed,
  comfortable,
  relieved,
  confident,
}
