import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  // get ccollection notes
  final CollectionReference notes = 
    FirebaseFirestore.instance.collection('notes');

  //Create new note
  Future<void> addNote(String note) {
    return notes.add({
      'note' : note,
      'timestamp' : Timestamp.now()
      });
  }

  //get notes from database
  Stream<QuerySnapshot> getNotes(){
    final notesStream =
      notes.orderBy('timestamp' , descending: true).snapshots();
    return notesStream;
  }
}