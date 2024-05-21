import 'package:apexive_assignment/mock/project_data.dart';
import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/core/models/project.dart';
import 'package:apexive_assignment/core/models/task.dart';
import 'package:apexive_assignment/shared/utils/custom_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'create_timer_state.dart';

class CreateTimerCubit extends Cubit<CreateTimerState> {
  CreateTimerCubit()
      : super(
          CreateTimerState(
            project: projectList.first,
            task: taskList.first,
          ),
        );

  final TextEditingController descriptionFieldController =
      TextEditingController();

  void setProject(Project? project) {
    emit(state.copyWith(project: project));
  }

  void setTask(Task? task) {
    emit(state.copyWith(task: task));
  }

  void setIsFavourite(bool? isFavourite) {
    emit(state.copyWith(isFavourite: isFavourite));
  }

  AppTimer initializeTimer() {
    if (state.project == null) {
      throw const CustomException(message: 'Please select a project');
    }
    if (state.task == null) {
      throw const CustomException(message: 'Please select a task');
    }
    if (descriptionFieldController.text.trim().isEmpty) {
      throw throw const CustomException(
          message: 'Please provide a description');
    }
    String description = descriptionFieldController.text.trim();
    descriptionFieldController.clear();
    return AppTimer(
      project: state.project!,
      task: state.task!,
      description: description,
      isFavourite: state.isFavourite,
      createdOn: DateTime.now(),
    );
  }
}
