import 'package:apexive_assignment/core/models/app_timer.dart';

List<Project> projectList = [
  Project(
    id: 'S0056',
    name: "Booquio V2",
    deadline: DateTime(2024, 06, 10),
  ),
  Project(
    id: 'S0057',
    name: "Booquio V3",
    deadline: DateTime(2024, 06, 10),
  ),
  Project(
    id: 'S0058',
    name: "Booquio V4",
    deadline: DateTime(2024, 06, 10),
  ),
  Project(
    id: 'S0059',
    name: "Booquio V5",
    deadline: DateTime(2024, 06, 10),
  ),
];

List<Task> taskList = [
  Task(
      id: 'TS0056',
      name: "Task Booquio V2",
      duration: const Duration(seconds: 45)),
  Task(
      id: 'TS0057',
      name: "Task Booquio V3",
      duration: const Duration(seconds: 45)),
  Task(
      id: 'TS0058',
      name: "Task Booquio V4",
      duration: const Duration(seconds: 45)),
  Task(
      id: 'TS0059',
      name: "Task Booquio V5",
      duration: const Duration(seconds: 45)),
];
