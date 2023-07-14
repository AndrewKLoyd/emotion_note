import './../model/note_m.dart';
import "package:flutter/material.dart";
import "./../model/save_load_m.dart";

class NoteVM with ChangeNotifier {
  // Using just like singleton
  factory NoteVM() => _this ??= NoteVM._();

  NoteVM._() {
    SaveLoad.loadNotes(() {
      notifyListeners();
    });
  }

  static NoteVM? _this;

  /// Adding new note
  void addNote(
      {Emotion emotion = Emotion.none,
      String solveWay = "",
      String trigger = ""}) {
    Note(emotion = emotion, solveWay = solveWay, trigger = trigger);

    SaveLoad.saveNotes();
    notifyListeners(); // Notify listeners about new notes
  }

  void removeNote(Note note) {
    note.delete();
    notifyListeners();
  }

  void removeNoteById(int id) {
    removeNote(Note.allNotes.where((element) => element.id == id).first);
  }

  List<Note> get notes => Note.allNotes;
}
