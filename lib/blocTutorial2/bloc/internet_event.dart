part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}
// We cannot use abstract event

class NumberAddedEvent extends InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
