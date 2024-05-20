part of 'app_timer_bloc.dart';

@immutable
sealed class AppTimerState {}

final class AppTimerInitial extends AppTimerState {}

final class AppTimerLoaded extends AppTimerState {
  final List<AppTimer> appTimers;

  AppTimerLoaded({
    required this.appTimers,
  });

  AppTimerLoaded copyWith({
    List<AppTimer>? appTimers,
  }) {
    return AppTimerLoaded(
      appTimers: appTimers ?? this.appTimers,
    );
  }
}
