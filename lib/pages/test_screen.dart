import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/fire_store.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final FireStoreService fireStoreService = FireStoreService();

  //text controller
  final TextEditingController textEditingController = TextEditingController();

  void openNoteBox() {
    // Dialog box to add note
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          // Button to save
          ElevatedButton(
            onPressed: () {
              fireStoreService.addNote(textEditingController.text);
              textEditingController.clear();
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getNotesStream(),
        builder: (context, snapshot) {
//if we have data , return the data
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

//display as a list
            return ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
//get each individual data
                  DocumentSnapshot document = notesList[index];
                  String docId = document.id;

//get note from each data
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String noteText = data['note'];

//display as a list title
                  return ListTile(
                    title: Text(noteText),
                  );
                });
          } else {
            return const Text('No notes...');
          }
        },
      ),
    );
  }
}
