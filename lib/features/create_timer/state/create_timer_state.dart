part of 'create_timer_cubit.dart';

class CreateTimerState {
  final String? description;
  final Project? project;
  final Task? task;
  final bool isFavourite;

  CreateTimerState({
    this.description,
    this.project,
    this.task,
    this.isFavourite = false,
  });

  CreateTimerState copyWith({
    String? description,
    Project? project,
    Task? task,
    bool? isFavourite,
  }) {
    return CreateTimerState(
      description: description ?? this.description,
      project: project ?? this.project,
      task: task ?? this.task,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
