import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Users');

//get document snapshot
  Stream<QuerySnapshot> getUsers() {
    return collection.snapshots();
  }

//add user to Users collection
  Future<void> addUser(userId, {email}) {
    return collection.doc(userId).set({'id': userId, 'email': email});
  }

  // void updateUser(pet) async {
  //   await collection.doc(pet.referenceId).update(pet.toJson());
  // }

  // void deleteUser(pet) async {
  //   await collection.doc(pet.referenceId).delete();
  // }
}
