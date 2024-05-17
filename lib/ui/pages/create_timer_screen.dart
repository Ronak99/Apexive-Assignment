import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/constants/colors.dart';
import 'package:apexive_assignment/ui/widgets/appbar/custom_appbar.dart';
import 'package:apexive_assignment/ui/widgets/buttons/action_button.dart';
import 'package:apexive_assignment/ui/widgets/scaffold/app_scaffold.dart';

class CreateTimerScreen extends StatelessWidget {
  const CreateTimerScreen({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const CreateTimerScreen());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      appbar: CustomAppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            Assets.back,
            height: 48,
            width: 48,
          ),
        ),
        title: Expanded(
          child: Center(
            child: Text(
              'Create Timer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        actions: const [SizedBox(height: 48, width: 48)],
      ),
      footer: ActionButton(text: 'Create Timer', onTap: () => {}),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const CustomDropdownMenu(
              entries: [
                DropdownMenuEntry(
                  value: 'project1',
                  label: 'Project',
                )
              ],
            ),
            const CustomDropdownMenu(
              entries: [
                DropdownMenuEntry(
                  value: 'task',
                  label: 'Task',
                )
              ],
            ),
            const SizedBox(
              height: 84,
              child: TextField(
                decoration: InputDecoration(
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
                const SizedBox(width: 4),
                SvgPicture.asset(Assets.down),
                const SizedBox(width: 8),
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

class CustomDropdownMenu extends StatelessWidget {
  final List<DropdownMenuEntry> entries;

  const CustomDropdownMenu({
    super.key,
    required this.entries,
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
        enableSearch: false,
        enableFilter: false,
        expandedInsets: EdgeInsets.zero,
        textStyle: Theme.of(context).textTheme.labelLarge,
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
