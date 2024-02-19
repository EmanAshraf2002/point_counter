import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_counter/cubits/counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit():super(CounterAState());

  int teamAPoints=0;

  int teamBPoints=0;

  void teamAIncrement(int buttonNumber){
    teamAPoints+=buttonNumber;
    emit(CounterAState());

  }

  void teamBIncrement(int buttonNumber){
    teamBPoints+=buttonNumber;
    emit(CounterBState());

  }

  void resetCounter(){
    teamAPoints=0;
    teamBPoints=0;
    emit(ResetState());
  }

}