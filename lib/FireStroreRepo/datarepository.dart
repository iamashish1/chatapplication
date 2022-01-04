import 'package:chatapplication/Models/message.dart';
import 'package:chatapplication/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('Users');

  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection('Messages');

//get users stream

  Stream<List<User>> getUsers() {
    return collection.snapshots().map(usersListFromSnapshots);
  }

  //users list from snapshots

  List<User> usersListFromSnapshots(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map(
          (e) => User(
            id: e.get('id') ?? '',
            email: e.get('email') ?? '',
            name: e.get('name') ?? '',
          ),
        )
        .toList();
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

  //add messages to message collection
  Future<void> addMessage(Message message) {
    return messageCollection.doc().set({
      'senderId': message.senderId,
      'receiverId': message.receiverId,
      "message": message.message,
      "sentAT": message.sentAt
    });
  }

  //get users stream

  Stream<List<Message>> getMessages() {
    return messageCollection
        .orderBy('sentAT', descending: true)
        .snapshots()
        .map(messagesListFromSnapshots);
  }

  //message list from snapshots

  List<Message> messagesListFromSnapshots(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map(
          (e) => Message(
            receiverId: e.get('receiverId') ?? '',
            senderId: e.get('senderId') ?? '',
            message: e.get('message') ?? '',
            sentAt: e.get('sentAT') ?? '',
          ),
        )
        .toList();
  }
}
