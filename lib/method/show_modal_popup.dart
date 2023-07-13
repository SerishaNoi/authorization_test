import 'package:flutter/cupertino.dart';

showDialog(String message, GlobalKey key) {
  showCupertinoDialog(
    context: key.currentContext!,
    builder: (context) => CupertinoAlertDialog(
      title: Text(message),
      actions: [
        CupertinoDialogAction(child: const Text('Close'), onPressed: () => Navigator.pop(context)),
      ],
    ),
  );
}
