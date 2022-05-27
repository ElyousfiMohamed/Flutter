import 'dart:math';
import '../model/contact.dart';

class ContactRepository {

  List<Contact> contacts = [
    Contact(id: 1, name: "Mohamed", group: "BDCC", profile: "simo", email: "simo@gmail.com", lastMessage: "hey", lastMessageDate: "14/05/2022"),
    Contact(id: 2, name: "Oussama", group: "GLSID", profile: "Oussama", email: "Oussama@gmail.com", lastMessage: "Bjr", lastMessageDate: "13/05/2022"),
    Contact(id: 3, name: "Tariq", group: "BDCC", profile: "Tariq", email: "Tariq@gmail.com", lastMessage: "cv", lastMessageDate: "15/05/2022"),
    Contact(id: 4, name: "Anass", group: "BDCC", profile: "Anass", email: "Anass@gmail.com", lastMessage: "Bjr", lastMessageDate: "12/05/2022"),
    Contact(id: 5, name: "Hassan", group: "GLSID", profile: "Hassan", email: "Hassan@gmail.com", lastMessage: "cv", lastMessageDate: "10/05/2022"),
    Contact(id: 6, name: "Jamila", group: "GLSID", profile: "Jamila", email: "Jamila@gmail.com", lastMessage: "Bjr", lastMessageDate: "11/05/2022"),
  ];

  Future<List<Contact>> getAllContacts() async {
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    return contacts;
  }

  Future<List<Contact>> getContactsByGroup( String group) async{
    var future = await Future.delayed(const Duration(seconds: 2));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    var groupeContacts = contacts.where((element) => element.group==group).toList();
    return groupeContacts;
  }

}