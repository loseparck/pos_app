import 'package:flutter/material.dart';

class PosDialogAction<T> {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const PosDialogAction({
    required this.label,
    this.onPressed,
    this.icon,
  });
}

Future<T?> showPosActionDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  List<PosDialogAction<T>> actions = const [],
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return _PosDialog<T>(
        title: title,
        content: content,
        actions: actions,
      );
    },
  );
}

class _PosDialog<T> extends StatelessWidget {
  final String title;
  final String? content;
  final List<PosDialogAction<T>> actions;

  const _PosDialog({
    required this.title,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      content: content == null
          ? null
          : Text(
              content!,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
      actions: [
        for (final action in actions)
          _buildAction(
            context,
            action,
          ),
      ],
    );
  }

  Widget _buildAction(
    BuildContext context,
    PosDialogAction<T> action,
  ) {
    final onPressed = action.onPressed;

    if (action.icon != null) {
      return TextButton.icon(
        onPressed: () {
          if(onPressed != null){
            onPressed();
          }
          Navigator.of(context).pop();
        },
        icon: Icon(action.icon),
        label: Text(action.label),
      );
    }

    return TextButton(
      onPressed: () {
          if(onPressed != null){
            onPressed();
          }
          Navigator.of(context).pop();
      },
      child: Text(action.label),
    );
  }
}