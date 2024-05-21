import 'package:apexive_assignment/core/models/project.dart';
import 'package:apexive_assignment/core/models/task.dart';

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
    name: "12 Second Task",
    duration: const Duration(seconds: 12),
  ),
  Task(
    id: 'TS0057',
    name: "60 Second Task",
    duration: const Duration(seconds: 60),
  ),
  Task(
    id: 'TS0058',
    name: "30 Second Task",
    duration: const Duration(seconds: 30),
  ),
  Task(
    id: 'TS0059',
    name: "200 Second Task",
    duration: const Duration(seconds: 200),
  ),
];
