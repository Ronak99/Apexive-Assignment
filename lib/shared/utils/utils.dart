import 'package:apexive_assignment/shared/constants/colors.dart';
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

    switch (level) {
      case SnackbarLevel.success:
        backgroundColor = Colors.green;
        break;
      case SnackbarLevel.error:
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }

    final snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: white,
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
}
