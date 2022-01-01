import 'package:chatapplication/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Users');

//get users stream

  Stream<List<User>> getUsers() {
    return collection.snapshots().map(usersListFromSnapshots);
  }

  //users list from snapshots

  List<User> usersListFromSnapshots(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((e) => User(id: e.get('id') ?? '', email: e.get('email') ?? ''))
        .toList();
  }

  // Future<List<User>> getUsers() async {
  //   var hhh = await collection.doc().snapshots();
  //   print(hhh.toString());
  //   print('ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');

  //   return hhh
  //       .map((e) => User(id: e.get('id'), email: e.get('email')))
  //       .toList();
  // }

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
