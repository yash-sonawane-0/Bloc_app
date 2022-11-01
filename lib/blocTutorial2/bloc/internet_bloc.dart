import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/blocTutorial1/emplyee.dart';
import 'package:connectivity/connectivity.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  // ignore: prefer_final_fields
  Connectivity _connectivity = Connectivity();

  List<int> blocNumbers = numbers;

  // Bloc gets closed as soon as we close the page where the bloc is used.
  // But listen does not, therefore closing the listen too.
  StreamSubscription? connectivitySubsricption;
  @override
  Future<void> close() {
    connectivitySubsricption?.cancel();
    return super.close();
  }

  InternetBloc() : super(InternetInitial()) {
    // super initializes this bloc with the extended class

    // On this events return the respective states

    on<NumberAddedEvent>((event, emit) {
      emit(NumberAddedState(numbers[numbers.length - 1]));
    });

    // on<InternetLostEvent>((event, emit) {
    //   emit(InternetLostState());
    // });
    // on<InternetGainedEvent>((event, emit) {
    //   emit(InternetGainedState());
    // });

    // _connectivity.onConnectivityChanged.listen((result) {
    //   if (result == ConnectivityResult.mobile ||
    //       result == ConnectivityResult.wifi) {
    //     add(InternetGainedEvent()); // add this event to the bloc
    //   } else {
    //     add(InternetLostEvent());
    //   }
    // });
  }
}
