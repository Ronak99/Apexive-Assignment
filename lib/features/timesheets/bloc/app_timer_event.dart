part of 'app_timer_bloc.dart';

@immutable
sealed class AppTimerEvent {}

final class CreateAppTimerRequested extends AppTimerEvent {
  final AppTimer appTimer;
  CreateAppTimerRequested({
    required this.appTimer,
  });
}

final class StartTimerRequested extends AppTimerEvent {
  final AppTimer appTimer;
  StartTimerRequested({
    required this.appTimer,
  });
}
