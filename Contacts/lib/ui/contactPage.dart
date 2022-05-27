import 'package:contacts/bloc/messageBloc.dart';
import 'package:contacts/events/messageEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contactBloc.dart';
import '../events/contactEvent.dart';
import '../model/requestState.dart';
import '../state/contactState.dart';

class ContactsPage extends StatelessWidget {
  ContactEvent? contactEvent;

  ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
          Row(
            children: const [Icon(Icons.chat,color: Colors.white),
              SizedBox(width: 10,),
              Text("Contacts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25))
            ],
          ),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadAllContactsEvent();
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(elevation: 0,
                          primary: context.read<ContactBloc>().lastLoad == "all"
                              ? Colors.green
                              : Colors.lightGreen),
                      child: const Text("All",style: TextStyle(color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadContactsByGroupEvent("BDCC");
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(elevation: 0,
                          primary:
                              context.read<ContactBloc>().lastLoad == "BDCC"
                                  ? Colors.green
                                  : Colors.lightGreen),
                      child: const Text("BDCC",style: TextStyle(color: Colors.white),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        contactEvent = LoadContactsByGroupEvent("GLSID");
                        context.read<ContactBloc>().add(contactEvent!);
                      },
                      style: ElevatedButton.styleFrom(elevation: 0,
                          primary:
                              context.read<ContactBloc>().lastLoad == "GLSID"
                                  ? Colors.green
                                  : Colors.lightGreen),
                      child: const Text("GLSID",style: TextStyle(color: Colors.white)),
                ),
              )
              )],
          ),
          Expanded(child:
              BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state.requestState == RequestState.Loading) {
              return const Center(
                  child: SizedBox(
                      child:
                      LinearProgressIndicator(color: Colors.lightGreen),
                      height: 10.0,
                      width: 200.0));
            }
            if (state.requestState == RequestState.Loaded) {
              return ListView.builder(
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          child:
                              Text(state.contacts[index].name.substring(0, 1)),foregroundColor: Colors.white),
                      title: Text(state.contacts[index].name),
                      subtitle: Row(
                        children: [Text(
                            state.contacts[index].lastMessage.isNotEmpty
                                ? "Last message : " +
                                state.contacts[index].lastMessage
                                : ""),Text(
                            state.contacts[index].lastMessageDate.isNotEmpty
                                ? ", Date : " +
                                state.contacts[index].lastMessageDate
                                : "")],
                      ),
                      trailing: Text("Groupe : " + state.contacts[index].group),
                      onTap: (){
                        context.read<MessageBloc>().add(ContactMessageEvent(contact: state.contacts[index]));
                        Navigator.pushNamed(context, "/messages",arguments:state.contacts[index] );
                      },
                    );
                  });
            }
            if (state.requestState == RequestState.Error) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Title(
                      color: Colors.redAccent,
                      child:
                          const Icon(Icons.wifi_tethering_error_sharp, size: 70, color: Colors.redAccent)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 17.0),
                    child: Center(
                        child: Title(
                            color: Colors.redAccent,
                            child: Text(state.errorMessage,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w100,
                                )))),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ContactBloc>().add(contactEvent!);
                      }, child:const Text("refresh",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(elevation: 0,primary: Colors.redAccent),
                  )
                ],
              ));
            }
            return const Center(
                child: Text("NOTHING TO SHOW !!",style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 25),));
          }))
        ],
      ),
    );
  }
}
