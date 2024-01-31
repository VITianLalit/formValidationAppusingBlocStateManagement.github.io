import 'package:flutter/material.dart';
import 'package:form_validation_app/bloc/auth_bloc.dart';
import 'package:form_validation_app/pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Pallete.backgroundColor,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
