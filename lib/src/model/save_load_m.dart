import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import './note_m.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLoad {
  static File? _file;

  static Future<void> load(Function onLoaded) async {}

  static Future<void> loadNotes(Function onLoaded) async {

    // Performing check if android system was innited
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();

    Set<String> noteKeys = prefs.getKeys();

    List<String> vals = [];

    for (String key in noteKeys) {
      String? val = prefs.getString(key);
      if (val != null) Note.fromJSON(jsonDecode(val));
    }

    onLoaded();
  }

  static Future<void> saveNotes() async {

    // Performing check if android system was innited
    WidgetsFlutterBinding.ensureInitialized();

    final prefs = await SharedPreferences.getInstance();

    List<Note> notes = Note.allNotes;
    for (Note note in Note.allNotes) {
      prefs.setString(note.id.toString(), jsonEncode(note.jsonMap));
    }
  }
}
