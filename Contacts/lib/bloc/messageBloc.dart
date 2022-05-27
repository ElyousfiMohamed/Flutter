import 'package:bloc/bloc.dart';
import 'package:contacts/state/messageState.dart';
import 'package:contacts/events/messageEvent.dart';
import 'package:contacts/model/requestState.dart';
import 'package:contacts/model/message.dart';
import 'package:contacts/repository/messageRepository.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;

  MessageBloc(
      {required MessageState initialState, required this.messageRepository})
      : super(initialState) {
    on<ContactMessageEvent>((event, emit) async {
      emit(MessageState(
          messages: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        List<Message> messages =
        await messageRepository.messagesByContact(event.contact.id);
        emit(MessageState(
            messages: messages,
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(MessageState(
            messages: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });

    // on send message
    on<SendMessageEvent>((event, emit) async {
      emit(MessageState(
          messages: [],
          requestState: RequestState.Loading,
          currentEvent: event));
      try {
        messageRepository.sendMessage(event.message,event.id);
        emit(MessageState(
            messages: await messageRepository.messagesByContact(event.id),
            requestState: RequestState.Loaded,
            currentEvent: event));
      } catch (e) {
        emit(MessageState(
            messages: [],
            requestState: RequestState.Error,
            errorMessage: e.toString(),
            currentEvent: event));
      }
    });
  }
}