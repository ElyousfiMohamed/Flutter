import 'dart:math';

import 'package:contacts/model/message.dart';


class MessageRepository {
  List<Message> messages = [
    Message(id: 1, content: "Hello sir", idContact: 2, sent: true),
    Message(id: 2, content: "Hi, who is this !!?", idContact: 2, sent: false),
    Message(id: 3, content: "Its me Mohamed", idContact: 2, sent: true),
    Message(id: 4, content: "Oh ! How are you ?", idContact: 2, sent: false),
  ];

  Future<List<Message>> messagesByContact(int idContact) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if (rand > 1) {
      return messages
          .where((element) => element.idContact == idContact)
          .toList();
    } else {
      throw Exception("ERROR !");
    }
  }

  // send message to contact
  Future<Message> sendMessage(String message,int id) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if (rand > 1) {
      messages.add(Message(
          id: messages.length + 1,
          content: message,
          idContact: id,
          sent: true));
      return messages.last;
    } else {
      throw Exception("ERROR !");
    }
  }
}