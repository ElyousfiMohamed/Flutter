import 'package:contacts/repository/contactRepository.dart';
import 'package:contacts/state/contactState.dart';
import 'package:contacts/ui/contactPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contactBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ContactBloc( ContactInitialState(), ContactRepository())  )
        ],
        child: MaterialApp(
          title: 'Contact app',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          routes: {
            "/contacts": (context) => ContactsPage()
          },
          initialRoute: "/contacts",
        )
    );
  }
}