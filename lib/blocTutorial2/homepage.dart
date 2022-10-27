import 'package:bloc_app/blocTutorial2/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Builder to change the state
        // Listener to add snackbar and other things which arent on any pages
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: prefer_const_constructors
                SnackBar(
                  content: const Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: prefer_const_constructors
                SnackBar(
                  content: const Text("Internet Lost"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            // if(state == ) == used to check value
            // "is" to check data type
            // double a = 2; if(a is int)
            if (state is InternetGainedState) {
              return const Icon(
                Icons.verified_user,
                size: 40,
                color: Colors.green,
              );
            } else if (state is InternetLostState) {
              return const Icon(
                Icons.close,
                size: 40,
                color: Colors.red,
              );
            } else {
              return const CircularProgressIndicator(
                color: Colors.black,
              );
            }
          },
        ),
      ),
    );
  }
}
