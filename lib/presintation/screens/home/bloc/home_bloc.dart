import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class CounterBloc extends Bloc<HomeEvent, CounterState> {
  int counter = 0;

  CounterBloc() : super(CounterInitial()) {
    increment();
    decrement();
    goToHome();
    goToAdmin();
  }

  void increment() {
    on<IncrementEvent>(
      (event, emit) {
        counter++;
        emit(ChangeNumberState(counter));
      },
    );
  }

  void decrement() {
    on<DecrementEvent>((event, emit) {
      counter--;
      emit(ChangeNumberState(counter));
    });
  }

  void goToHome() {
    on<GotoHomeScreenEvent>((event, emit) {
      emit(OpenHomeScreenState());
    });
  }

  void goToAdmin() {
    on<GotoAdminScreenEvent>((event, emit) {
      emit(OpenAdminScreenState());
    });
  }

}
