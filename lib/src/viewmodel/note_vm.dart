import './../model/note_m.dart';
import "package:flutter/material.dart";

class NoteVM with ChangeNotifier {

  // Using just like singleton
  factory NoteVM() => _this ??= NoteVM._();
  NoteVM._();
  static NoteVM? _this;

  /// Adding new note
  void addNote(
      {Emotion emotion = Emotion.none,
      String solveWay = "",
      String trigger = ""}) {
    Note(emotion = emotion, solveWay = solveWay, trigger = trigger);
    notifyListeners(); // Notify listeners about new notes
  }

  void removeNote(Note note) {
    note.delete();
    notifyListeners();
  }

  void removeNoteById(int id){
    removeNote(Note.allNotes.where((element) => element.id == id).first);


  }

  List<Note> get notes => Note.allNotes;
}
