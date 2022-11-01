part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class NumberAddedState extends InternetState {
  final int num;
  NumberAddedState(this.num);
}

class InternetInitial extends InternetState {}

class InternetLostState extends InternetState {}

class InternetGainedState extends InternetState {}
