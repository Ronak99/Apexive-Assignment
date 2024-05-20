import 'dart:async';

import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_timer_event.dart';
part 'app_timer_state.dart';

class AppTimerBloc extends Bloc<AppTimerEvent, AppTimerState> {
  AppTimerBloc() : super(AppTimerInitial()) {
    on<CreateAppTimerRequested>(_createAppTimer);
    on<StartTimerRequested>(_startTimer);
  }

  void _createAppTimer(
    CreateAppTimerRequested event,
    Emitter<AppTimerState> emit,
  ) {
    List<AppTimer> appTimers = [];
    if (state is AppTimerLoaded) {
      appTimers = (state as AppTimerLoaded).appTimers;
    }
    emit(AppTimerLoaded(appTimers: [...appTimers, event.appTimer]));
  }

  void _startTimer(
    StartTimerRequested event,
    Emitter<AppTimerState> emit,
  ) {
    List<AppTimer> appTimers = [];
    if (state is AppTimerLoaded) {
      appTimers = (state as AppTimerLoaded).appTimers;
      int index = appTimers.indexOf(event.appTimer);
      if (index > -1) {}
    }
  }
}
