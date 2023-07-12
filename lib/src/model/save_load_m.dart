import 'dart:convert';
import './note_m.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SaveLoad {
  static const String _fileName = "notes.json";

  static String? _savesPath;

  static List<Note> loadNotes() {
    List<Note> notes = [];
    _savesPath ??= "${Directory.current}/$_fileName";

    File file = File(_savesPath ??= "");

    if(!file.existsSync()) file.create();

  }
}
