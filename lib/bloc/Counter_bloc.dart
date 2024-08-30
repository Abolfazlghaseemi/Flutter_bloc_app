import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_application/bloc/Counter_Event.dart';
import 'package:flutter_bloc_application/bloc/Counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 100;
  CounterBloc() : super(CounterInit(100)) {
    on<DecreamentPressed>((event, emit) {
      emit(UpdatedCounter(--counter));
    });

    on<IncreaementPressed>((event, emit) {
      emit(UpdatedCounter(++counter));
    });

    on<ResetPressed>((event, emit) {
      counter = 0;
      emit(UpdatedCounter(counter));
    });
  }
}
