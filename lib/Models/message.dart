import 'package:chatapplication/Models/user.dart';

import 'user.dart';

class Message {
  String id;
  String content;
  DateTime date;
  User mesageTo;

  Message(this.id, this.content, this.date, this.mesageTo);
}
