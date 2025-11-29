import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/services/firestore.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationState();
}
  // FİREBASE BAĞLAMADA KALDIN VİDEO DK : 9.00
  class _EducationState extends State<EducationPage> {

    final FirestoreService firestoreNotes = FirestoreService();
    bool _isExpanded = false;
    final TextEditingController textController = TextEditingController();

    void openNoteBox() {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(

          content: TextField(
            controller: textController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
               await firestoreNotes.addNote(textController.text);

                textController.clear();

                Navigator.pop(context);
              }, 
              child: Text('Add')
              ),
          ],
        ),
      );
    }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Deneme Firebase'),),
        backgroundColor: Colors.blueGrey[100],
        floatingActionButton: FloatingActionButton(
          onPressed: openNoteBox,
            child: const Icon(Icons.add),  
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: firestoreNotes.getNotes(),
            builder: (context , snapshot) {
              if(snapshot.hasData) {
                List notesList = snapshot.data!.docs;

                return ListView.builder(
                  
                  itemCount: notesList.length,
                  itemBuilder: (context , index) {
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;

                    Map<String , dynamic> data =
                      document.data() as Map<String , dynamic>;
                    String noteText = data['note'];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child:GestureDetector(
                          onTap: () => setState(() => _isExpanded = !_isExpanded),
                          child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          height: _isExpanded ? 150 : 50,
                          child: Card(
                            elevation: 4, // gölge
                            color: Colors.blue[100],
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.note_alt, color: Colors.blue),
                              title: Text(
                                noteText,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        )
                      )
                    );
                  }
                ); 
              }
              else {
                return const Text('No notes');
              }
            }
          )
        );
      }
  }