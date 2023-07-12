import "package:emotions_notes/src/view/note_card_v.dart";
import "package:emotions_notes/src/viewmodel/note_vm.dart";
import "package:flutter/material.dart";

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final NoteVM noteVM = NoteVM();

  List<Widget> get notes {
    if (noteVM.notes.isEmpty) return <Widget>[const Text("Empty")];
    return noteVM.notes
        .map((e) => NoteCard(e)
            //Card(
            //   child: Container(
            //     width: double.infinity,
            //     margin: const EdgeInsets.all(10),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(e.trigger),
            //         Text(e.solveWay),
            //         Text(e.date.toString()),
            //         Text(e.emotion.toString())
            //       ],
            //     ),
            //   ),
            // ),
            )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListenableBuilder(
        listenable: noteVM,
        builder: (BuildContext context, Widget? child) => ListView(
          children: notes,
        ),
      ),
    );
  }
}
