// Naming this class Timer can cause conflicts with the dart:async Timer class
import 'package:apexive_assignment/core/models/project.dart';
import 'package:apexive_assignment/core/models/task.dart';

class AppTimer {
  final Project project;
  final Task task;
  final String description;
  final bool isFavourite;
  final bool isComplete;
  final DateTime createdOn;
  const AppTimer({
    required this.project,
    required this.task,
    required this.description,
    required this.isFavourite,
    this.isComplete = false,
    required this.createdOn,
  });

  AppTimer copyWith({
    Project? project,
    Task? task,
    String? description,
    bool? isFavourite,
    bool? isComplete,
    DateTime? createdOn,
  }) {
    return AppTimer(
      project: project ?? this.project,
      task: task ?? this.task,
      description: description ?? this.description,
      isFavourite: isFavourite ?? this.isFavourite,
      isComplete: isComplete ?? this.isComplete,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}
