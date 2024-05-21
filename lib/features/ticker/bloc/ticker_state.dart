part of 'ticker_bloc.dart';

sealed class TickerState extends Equatable {
  const TickerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TickerInitial extends TickerState {
  const TickerInitial(super.duration);

  @override
  String toString() => 'TickerInitial { duration: $duration }';
}

final class TickerRunPause extends TickerState {
  const TickerRunPause(super.duration);

  @override
  String toString() => 'TickerRunPause { duration: $duration }';
}

final class TickerRunInProgress extends TickerState {
  const TickerRunInProgress(super.duration);

  @override
  String toString() => 'TickerRunInProgress { duration: $duration }';
}

final class TickerRunComplete extends TickerState {
  const TickerRunComplete() : super(0);
}
