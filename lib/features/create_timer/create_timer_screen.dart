import 'package:apexive_assignment/core/mock/project_data.dart';
import 'package:apexive_assignment/core/models/app_timer.dart';
import 'package:apexive_assignment/core/models/project.dart';
import 'package:apexive_assignment/core/models/task.dart';
import 'package:apexive_assignment/features/create_timer/cubit/create_timer_cubit.dart';
import 'package:apexive_assignment/features/timesheets/bloc/app_timer_bloc.dart';
import 'package:apexive_assignment/shared/utils/custom_exception.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/shared/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/shared/widgets/buttons/action_button.dart';
import 'package:apexive_assignment/shared/widgets/scaffold/app_scaffold.dart';

class CreateTimerScreen extends StatelessWidget {
  const CreateTimerScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const CreateTimerScreen());

  @override
  Widget build(BuildContext context) {
    final createTimerCubit = context.read<CreateTimerCubit>();

    return AppScaffold(
      appbar: CustomAppBar(
        title: Expanded(
          child: Center(
            child: Text(
              'Create Timer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ),
      footer: ActionButton(
        text: 'Create Timer',
        onTap: () {
          try {
            AppTimer timer = createTimerCubit.initializeTimer();

            context
                .read<AppTimerBloc>()
                .add(CreateAppTimerRequested(appTimer: timer));

            Navigator.pop(context);
          } on CustomException catch (e) {
            Utils.showSnackbar(
              message: e.message,
              level: SnackbarLevel.error,
            );
          }
        },
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            CustomDropdownMenu<Project>(
              entries: projectList
                  .map(
                    (e) => DropdownMenuEntry<Project>(
                      value: e,
                      label: e.name,
                    ),
                  )
                  .toList(),
              onChange: createTimerCubit.setProject,
              initialSelection: createTimerCubit.state.project,
            ),
            CustomDropdownMenu<Task>(
              entries: taskList
                  .map(
                    (e) => DropdownMenuEntry<Task>(
                      value: e,
                      label: e.name,
                    ),
                  )
                  .toList(),
              onChange: createTimerCubit.setTask,
              initialSelection: createTimerCubit.state.task,
            ),
            SizedBox(
              height: 84,
              child: TextField(
                controller: createTimerCubit.descriptionFieldController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                BlocBuilder<CreateTimerCubit, CreateTimerState>(
                  builder: (context, state) {
                    return CupertinoCheckbox(
                      value: state.isFavourite,
                      checkColor: lightThemePrimaryGradient.last,
                      focusColor: white,
                      activeColor: white,
                      inactiveColor: white.withOpacity(.5),
                      onChanged: createTimerCubit.setIsFavourite,
                    );
                  },
                ),
                Text(
                  'Make Favourite',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownMenu<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> entries;
  final Function(T?) onChange;
  final T? initialSelection;

  const CustomDropdownMenu({
    super.key,
    required this.entries,
    required this.onChange,
    required this.initialSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      height: 56,
      child: DropdownMenu(
        trailingIcon: SvgPicture.asset(Assets.down),
        selectedTrailingIcon: RotatedBox(
          quarterTurns: 2,
          child: SvgPicture.asset(Assets.down),
        ),
        onSelected: onChange,
        enableSearch: false,
        enableFilter: false,
        expandedInsets: EdgeInsets.zero,
        textStyle: Theme.of(context).textTheme.labelLarge,
        initialSelection: initialSelection,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: white.withOpacity(.16),
              width: 2,
            ),
          ),
        ),
        dropdownMenuEntries: entries,
      ),
    );
  }
}