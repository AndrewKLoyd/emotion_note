import 'package:emotions_notes/src/model/note_m.dart';
import 'package:emotions_notes/src/viewmodel/note_vm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteCard extends StatelessWidget {
  NoteCard(this.note, {super.key});
  final Note note;
  final NoteVM noteVM = NoteVM();

  Widget getEmotionString(BuildContext context) =>
      // Cause Emotion is an enum => split it by '.'
      // and take the last part of it
      Text(
        note.emotion.toString().split('.').last.toUpperCase(),
        style: Theme.of(context).textTheme.titleLarge,
      );

  Widget getDateString(BuildContext context) =>
      Text(DateFormat("HH:mm dd:MM:yy").format(note.date));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getEmotionString(context),
              Text(note.trigger),
              Text(note.solveWay),
              getDateString(context),
              Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: () => noteVM.removeNote(note),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
