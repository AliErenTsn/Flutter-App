import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/services/firestore.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationState();
}
  // FİREBASE BAĞLAMADA KALDIN VİDEO DK : 9.00
  class _EducationState extends State<EducationPage> {

    final FirestoreService firestoreService = FirestoreService();

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
              onPressed: () {
                firestoreService.addNote(textController.text);

                textController.clear();

                Navigator.pop(context);
              }, 
              child: Text('Add'))
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
            stream: firestoreService.getNotes(),
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

                    return ListTile(
                      title: Text(noteText),
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