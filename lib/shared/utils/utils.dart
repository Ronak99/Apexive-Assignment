import 'package:apexive_assignment/shared/constants/styles.dart';
import 'package:flutter/material.dart';

enum SnackbarLevel {
  info,
  success,
  error,
}

class Utils {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar({
    required String message,
    SnackbarLevel level = SnackbarLevel.info,
  }) {
    Color? backgroundColor;

    BuildContext context = scaffoldMessengerKey.currentState!.context;

    switch (level) {
      case SnackbarLevel.success:
        backgroundColor = Colors.green;
        break;
      case SnackbarLevel.error:
        backgroundColor = Theme.of(context).colorScheme.error;
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.onPrimaryContainer;
        break;
    }

    final snackbar = SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
      ),
      backgroundColor: backgroundColor,
    );
    scaffoldMessengerKey.currentState!.showSnackBar(snackbar);
  }

  static bool doesExceedsMaxLines({
    required BuildContext context,
    required String text,
    required int maxLines,
    required TextStyle textStyle,
  }) {
    final span = TextSpan(
      text: text,
      style: textStyle,
    );

    final tp = TextPainter(
      text: span,
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: MediaQuery.of(context).size.width - 64);
    if (tp.didExceedMaxLines) return true;

    return false;
  }

  static String formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = (duration.inSeconds) - (minutes * 60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
  }
}
