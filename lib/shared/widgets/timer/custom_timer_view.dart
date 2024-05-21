import 'package:apexive_assignment/features/ticker/bloc/ticker_bloc.dart';
import 'package:apexive_assignment/shared/widgets/timer/expanded_timer_view.dart';
import 'package:apexive_assignment/shared/widgets/timer/mini_timer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTimerView extends StatelessWidget {
  final Duration duration;
  final bool showExpandedView;
  final VoidCallback onStop;

  const CustomTimerView({
    super.key,
    required this.duration,
    required this.onStop,
    required this.showExpandedView,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TickerBloc, TickerState>(
      builder: (context, state) {
        final tickerBloc = BlocProvider.of<TickerBloc>(context);

        if (showExpandedView) {
          return ExpandedTimerView(
            isRunning: tickerBloc.isRunning,
            onPlay: () =>
                tickerBloc.add(TickerStarted(duration: duration.inSeconds)),
            onPause: () => tickerBloc.add(const TickerPaused()),
            onStop: () {
              tickerBloc.add(const TickerReset());
              onStop();
            },
            duration: Duration(seconds: state.duration),
          );
        } else {
          return MiniTimerView(
            isRunning: tickerBloc.isRunning,
            onPlay: () =>
                tickerBloc.add(TickerStarted(duration: duration.inSeconds)),
            onPause: () => tickerBloc.add(const TickerPaused()),
            duration: Duration(seconds: state.duration),
          );
        }
      },
    );
  }
}
