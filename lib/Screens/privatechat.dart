import 'package:chatapplication/Models/user.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivateChat extends StatefulWidget {
  final User user;
  const PrivateChat({Key? key, required this.user}) : super(key: key);

  @override
  State<PrivateChat> createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  final TextEditingController _myMessage = TextEditingController();

  List<String> msg = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Expanded(
            child: msg.isEmpty
                ? Center(
                    child: Text(
                        'say Hi to ' + widget.user.email.toString() + ' ..'),
                  )
                : ListView.builder(
                    reverse: true,
                    itemCount: msg.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 10),
                            child: Text(
                              msg[index],
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
                        setState(() {
                          msg.insert(0, _myMessage.text.trim());
                        });
                        _myMessage.clear();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
