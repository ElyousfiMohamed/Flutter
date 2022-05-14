import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/contactEvent.dart';
import '../repository/contactRepository.dart';
import '../state/contactState.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  ContactRepository contactRepository ;
  String lastLoad= "";

  ContactBloc( ContactState contactState, this.contactRepository) : super(ContactInitialState()) {

    on<LoadAllContactsEvent>((event, emit) async {
      lastLoad = "all";
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getAllContacts()
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

    on<LoadContactsByGroupEvent>((event, emit) async {
      lastLoad= event.groupe;
      emit( ContactState(requestState: RequestState.Loading, contacts: [], errorMessage: ""));
      await contactRepository.getContactsByGroup( event.groupe )
          .then((value) => emit(ContactState(contacts: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(ContactState(contacts: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

  }
}