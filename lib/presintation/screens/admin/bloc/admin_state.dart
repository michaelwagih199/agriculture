part of 'admin_bloc.dart';

@immutable
abstract class AdminState {}

class AdminInitial extends AdminState {}
class LoadingState extends AdminState {}
class ErrorState extends AdminState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
class SuccessState extends AdminState {}
