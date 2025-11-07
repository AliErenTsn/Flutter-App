import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // Yeni kullanıcı ekleme
  Future<void> addUser(String username, String password) {
    return users.add({
      'username': username,
      'password': password,
      'createdAt': Timestamp.now(),
    });
  }

  Future<bool> checkUser(String username, String password) async {
  final querySnapshot = await users
      .where('username', isEqualTo: username)
      .where('password', isEqualTo: password)
      .get();

  return querySnapshot.docs.isNotEmpty; 
}

}
