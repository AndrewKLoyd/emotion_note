import 'package:emotions_notes/src/view/add_note_v.dart';
import 'package:emotions_notes/src/viewmodel/note_vm.dart';
import "package:flutter/material.dart";
import './note_list_v.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final NoteVM noteVM = NoteVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
        title: const Text("Notes"),
      ),
      body: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.9,
          child: Column(
            children: [
              NoteList(),
            ],
          )),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.add_circle_rounded,
          size: 64,

        ),
        padding: const EdgeInsets.all(0),

        color: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddNote(),
          );
        },
      ),
    );
  }
}
