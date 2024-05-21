import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_timer_event.dart';
part 'app_timer_state.dart';

class AppTimerBloc extends Bloc<AppTimerEvent, AppTimerState> {
  AppTimerBloc() : super(AppTimerInitial()) {
    on<CreateAppTimerRequested>(_createAppTimer);
    on<MarkCompleteRequested>(_markComplete);
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

  void _markComplete(
    MarkCompleteRequested event,
    Emitter<AppTimerState> emit,
  ) {
    List<AppTimer> appTimers = [];
    if (state is AppTimerLoaded) {
      appTimers = (state as AppTimerLoaded).appTimers;
      int index = appTimers.indexOf(event.appTimer);
      AppTimer completedTimer = event.appTimer.copyWith(isComplete: true);
      appTimers[index] = completedTimer;
    }
    emit(AppTimerLoaded(appTimers: appTimers));
  }
}
