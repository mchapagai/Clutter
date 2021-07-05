import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final dialogContainerNegativeButton = Key('dialogContainerNegativeButton');
final dialogContainerPositiveButton = Key('dialogContainerPositiveButton');
final dialogContainer = Key('dialogContainer');

void showDialogWithPositiveButton(BuildContext context, String title,
    String message, String actionText, final onTap) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
          content: Text(message, style: TextStyle(fontSize: 18)),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
                onTap();
              },
              child: Center(
                child: Text(
                  actionText,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Text(message),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(actionText),
              onPressed: () {
                Navigator.pop(context);
                onTap();
              },
            ),
          ],
        );
      },
    );
  }
}

void showDialogWithPositiveNegativeButton(
    {BuildContext? context,
    String? title,
    String? message,
    String? negativeActionText,
    String? positiveActionText,
    Function? onPressedNegativeButton,
    Function? onPressPositiveButton}) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          key: dialogContainer,
          title: Text(title != null ? title : "",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          content: Text(message != null ? message : "",
              style: TextStyle(fontSize: 18)),
          actions: [
            Container(
              key: dialogContainerPositiveButton,
              child: CupertinoButton(
                  child: Center(
                    child: Text(
                      positiveActionText!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    if (onPressPositiveButton != null) {
                      onPressPositiveButton();
                    }
                  }),
            ),
            Container(
              key: dialogContainerNegativeButton,
              child: CupertinoButton(
                child: Center(
                  child: Text(
                    negativeActionText!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  if (onPressedNegativeButton != null) {
                    onPressedNegativeButton();
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }
  if (Platform.isAndroid) {
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          key: dialogContainer,
          title: Center(
              child: Text(title != null ? title : "",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Text(message != null ? message : ""),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              key: dialogContainerPositiveButton,
              child: Text(positiveActionText!),
              onPressed: () {
                if (onPressPositiveButton != null) {
                  onPressPositiveButton();
                }
              },
            ),
            TextButton(
              key: dialogContainerNegativeButton,
              child: Text(negativeActionText!),
              onPressed: () {
                if (onPressedNegativeButton != null) {
                  onPressedNegativeButton();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
