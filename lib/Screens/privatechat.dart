import 'package:chatapplication/FireStroreRepo/datarepository.dart';
import 'package:chatapplication/Models/message.dart';
import 'package:chatapplication/Models/user.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivateChat extends StatefulWidget {
  final User user;
  const PrivateChat({Key? key, required this.user}) : super(key: key);

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  final TextEditingController _myMessage = TextEditingController();
  bool isSender = false;

  List<String> msg = [];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Message>>(
      create: (context) => DataRepository().getMessages(),
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
          title: Text(widget.user.email.toString()),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(EvaIcons.arrowIosBackOutline)),
        ),
        body: Builder(builder: (context) {
          var _messages = Provider.of<List<Message>>(context);
          var _thisMessage = _messages
              .where((element) =>
                  (element.receiverId == widget.user.id &&
                      element.senderId ==
                          fire.FirebaseAuth.instance.currentUser!.uid) ||
                  element.senderId == widget.user.id)
              .toList();
          print(_thisMessage);

          return Column(
            children: [
              Expanded(
                child: _thisMessage.isEmpty
                    ? Center(
                        child: Text(
                            'say hi to' + widget.user.email.toString() + ' ..'),
                      )
                    : ListView.builder(
                        reverse: true,
                        itemCount: _thisMessage.length,
                        itemBuilder: (context, index) {
                          print(_thisMessage[index].message);
                          if (_thisMessage[index].senderId ==
                              fire.FirebaseAuth.instance.currentUser!.uid) {
                            isSender = true;
                            print('true');
                          } else {
                            isSender = false;
                            print('false');
                          }
                          return Row(
                            mainAxisAlignment: isSender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 10, right: 10),
                                child: Text(
                                  _thisMessage[index].message,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              Container(
                height: 75,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: _myMessage,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          EvaIcons.paperPlane,
                          color: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (_myMessage.text.trim().isNotEmpty) {
                            DataRepository().addMessage(Message(
                                senderId:
                                    fire.FirebaseAuth.instance.currentUser!.uid,
                                receiverId: widget.user.id!,
                                message: _myMessage.text,
                                sentAt: DateTime.now().toString()));
                            _myMessage.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
