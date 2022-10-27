import 'package:bloc_app/blocTutorial2/bloc/internet_bloc.dart';
import 'package:bloc_app/blocTutorial2/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
