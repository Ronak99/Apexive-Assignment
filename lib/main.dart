import 'package:apexive_assignment/core/theme/data/app_theme.dart';
import 'package:apexive_assignment/features/create_timer/cubit/create_timer_cubit.dart';
import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/features/ticker/ticker.dart';
import 'package:apexive_assignment/features/timesheets/bloc/app_timer_bloc.dart';
import 'package:apexive_assignment/features/timesheets/presentation/pages/view/view_all_timers_screen.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppTimerBloc>(
          create: (BuildContext context) => AppTimerBloc(),
        ),
        BlocProvider<CreateTimerCubit>(
          create: (BuildContext context) => CreateTimerCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Utils.scaffoldMessengerKey,
        theme: AppTheme.lightTheme,
        home: const ViewAllTimersScreen(),
      ),
    );
  }
}
