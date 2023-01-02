part of 'home_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class ChangeNumberState extends CounterState {
  final int number;

  ChangeNumberState(this.number);
}

class OpenHomeScreenState extends CounterState {}
class OpenAdminScreenState extends CounterState {}
