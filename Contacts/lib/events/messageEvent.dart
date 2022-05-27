import 'package:contacts/model/contact.dart';
import 'package:contacts/model/message.dart';

abstract class MessageEvent{}

class ContactMessageEvent extends MessageEvent{
  Contact contact;
  ContactMessageEvent({required this.contact});
}

class SendMessageEvent extends MessageEvent{
  String message;
  int id;
  SendMessageEvent({required this.message, required this.id});
}