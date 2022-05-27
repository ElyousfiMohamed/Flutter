import 'package:contacts/events/messageEvent.dart';
import 'package:contacts/model/message.dart';

import '../model/contact.dart';
import '../model/requestState.dart';

class MessageState{
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  MessageState({required this.messages, this.requestState=RequestState.None, this.errorMessage="",required this.currentEvent});
}

class MessageInitialState extends MessageState {

  MessageInitialState() : super(messages: [],requestState: RequestState.None, errorMessage: "",currentEvent:ContactMessageEvent(contact: Contact(id: 0, email: "", group: "", lastMessage: "", lastMessageDate: "", name: "", profile: "")));

}
