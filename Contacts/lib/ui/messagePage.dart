import 'package:contacts/bloc/messageBloc.dart';
import 'package:contacts/events/messageEvent.dart';
import 'package:contacts/model/contact.dart';
import 'package:contacts/state/messageState.dart';
import 'package:contacts/model/requestState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    final _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Messages",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25))),
      body: Center(
        child:
            BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
          if (state.requestState == RequestState.Loading) {
            return const CircularProgressIndicator();
          } else if (state.requestState == RequestState.Loaded) {
            return Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                                left: state.messages[index].sent ? 5.0 : 50.0,
                                right: state.messages[index].sent ? 50.0 : 5.0),
                            child: ListTile(
                              tileColor: state.messages[index].sent
                                  ? Color(0xff8BC34A)
                                  : Color(0xffBBBBBB),
                              minVerticalPadding: 20,
                              title: Text(state.messages[index].content),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter message',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          BlocProvider.of<MessageBloc>(context)
                              .add(SendMessageEvent(
                            message: _controller.text,
                            id: contact.id,
                          ));
                          _controller.clear();
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                  color: Colors.redAccent,
                  child: const Icon(Icons.error,
                      size: 70, color: Colors.lightGreen)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 17.0),
                child: Center(
                    child: Title(
                        color: Colors.redAccent,
                        child: Text(state.errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 30,
                              fontWeight: FontWeight.w100,
                            )))),
              ),
              IconButton(
                  onPressed: () {
                    MessageBloc messageBloc = context.read<MessageBloc>();
                    context.read<MessageBloc>().add(state.currentEvent);
                  },
                  icon: const Icon(Icons.refresh),
                  color: Colors.lightGreen,
                  iconSize: 28)
            ],
          ));
        }),
      ),
    );
  }
}
