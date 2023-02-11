import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cold_funcutions_event.dart';
part 'cold_funcutions_state.dart';

class ColdFuncutionsBloc extends Bloc<ColdFuncutionsEvent, ColdFuncutionsState> {
  ColdFuncutionsBloc() : super(ColdFuncutionsInitial()) {
    on<ColdFuncutionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
