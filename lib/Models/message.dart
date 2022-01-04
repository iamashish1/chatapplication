class Message {
  String senderId;
  String receiverId;
  String message;
  String sentAt;

  Message(
      {required this.senderId,
      required this.receiverId,
      required this.message,
      required this.sentAt});
}
