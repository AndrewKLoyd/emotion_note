import "package:emotions_notes/src/model/note_m.dart";
import "package:emotions_notes/src/viewmodel/note_vm.dart";
import "package:flutter/material.dart";

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final NoteVM noteVM = NoteVM();

  String trigger = "";
  String solveWays = "";
  Emotion emotion = Emotion.none;

  List<DropdownMenuItem<Emotion>> emotions = Emotion.values
      .map((e) => DropdownMenuItem<Emotion>(
            value: e,
            child: Text(e.toString().split('.').last),
          ))
      .toList();

  /// Controllers used to handle input data
  TextEditingController triggerController = TextEditingController();
  TextEditingController solveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emotions dropdown
          DropdownButton<Emotion>(
              value: emotion,
              items: emotions,
              onChanged: (Emotion? e) {
                setState(() {
                  emotion = e ??= Emotion.none;
                });
              }),

          // trigger input
          TextField(
            controller: triggerController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme),
            onChanged: (_) {
              setState(() {
                trigger = triggerController.text;
              });
            },
          ),
          TextField(
            controller: solveController,
            minLines: 1,
            maxLines: 10,
            decoration: const InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme),
            onChanged: (_) {
              setState(() {
                solveWays = solveController.text;
              });
            },
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    noteVM.addNote(
                        solveWay: solveWays,
                        emotion: emotion,
                        trigger: trigger);
                  });
                  // Closing modal sheets
                  Navigator.pop(context);
                },
                child: const Text("Add emotion")),
          ),
        ],
      ),
    );
  }
}
