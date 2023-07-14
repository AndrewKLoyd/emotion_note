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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
        child: Text(
          note.emotion.toString().split('.').last.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );

  Widget getTriggerWidget(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: Text(note.trigger),
    );
  }

  Widget getSolveWayWidget(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: Text(note.solveWay),
    );
  }

  Widget getDateString(BuildContext context) =>
      Text(DateFormat("HH:mm dd:MM:yy").format(note.date));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 5,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                // Left part (Content)
                Flexible(
                  flex: 10,
                  child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getEmotionString(context),
                          getTriggerWidget(context),
                          getSolveWayWidget(context),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: getDateString(context),
                          ),
                        ],
                      )),
                ),
              ],
            )
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [

            //   ],
            // ),
            ),
      ),
    );
  }
}
