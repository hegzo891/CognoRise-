import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_model.dart';

class noteprovider extends ChangeNotifier
{
  late final List<note_model> _notes = [


  ];
  List<note_model> get notes => _notes;
  void addnote(note_model n)
  {
    _notes.add(n);
    setnote();
    notifyListeners();
  }

  Future<void> setnote() async {
    final prefs = await SharedPreferences.getInstance();
    final notes_text = jsonEncode(_notes);
    prefs.setString("notes", notes_text);
  }

  void deletenote(int index)
  {
    _notes.removeAt(index);
    notifyListeners();
  }

  void editnote(int index, note_model note)
  {
    _notes[index] = note;
    setnote();
    notifyListeners();
  }

  List<note_model> searchnotes(String query)

  {
    return _notes.where((note) =>
        note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.content.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

}