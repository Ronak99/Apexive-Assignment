// Naming this class Timer can cause conflicts with the dart:async Timer class
import 'dart:async';

import 'package:flutter/material.dart';

class AppTimer {
  final Project project;
  final Task task;
  final String description;
  final bool isFavourite;
  const AppTimer({
    required this.project,
    required this.task,
    required this.description,
    required this.isFavourite,
  });
}

class Project {
  final String id;
  final String name;
  final DateTime deadline;
  const Project({
    required this.id,
    required this.name,
    required this.deadline,
  });
}

class Task {
  String id;
  String name;
  Duration duration;
  Timer? _timer;
  Task({
    required this.id,
    required this.name,
    this.duration = Duration.zero,
  });

  void startTimer({required VoidCallback onTick}) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = duration - const Duration(seconds: 1);
      onTick();
    });
  }

  stopTimer() async {
    _timer!.cancel();
  }
}
