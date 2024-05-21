import 'dart:async';

import 'package:apexive_assignment/features/ticker/ticker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  TickerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TickerInitial(ticker.duration.inSeconds)) {
    on<TickerStarted>(_onStarted);
    on<TickerPaused>(_onPaused);
    on<TickerResumed>(_onResumed);
    on<TickerReset>(_onReset);
    on<_TickerTicked>(_onTicked);
  }

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  bool get isRunning => state is TickerRunInProgress;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TickerStarted event, Emitter<TickerState> emit) {
    if (state is TickerRunPause) {
      add(const TickerResumed());
    } else {
      emit(TickerRunInProgress(event.duration));
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(_TickerTicked(duration: duration)));
    }
  }

  void _onPaused(TickerPaused event, Emitter<TickerState> emit) {
    if (state is TickerRunInProgress) {
      _tickerSubscription?.pause();
      emit(TickerRunPause(state.duration));
    }
  }

  void _onResumed(TickerResumed resume, Emitter<TickerState> emit) {
    if (state is TickerRunPause) {
      _tickerSubscription?.resume();
      emit(TickerRunInProgress(state.duration));
    }
  }

  void _onReset(TickerReset event, Emitter<TickerState> emit) {
    _tickerSubscription?.cancel();
    emit(TickerInitial(_ticker.duration.inSeconds));
  }

  void _onTicked(_TickerTicked event, Emitter<TickerState> emit) {
    emit(
      event.duration > 0
          ? TickerRunInProgress(event.duration)
          : const TickerRunComplete(),
    );
  }
}
