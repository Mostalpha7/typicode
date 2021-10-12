import 'package:flutter/material.dart';
import 'package:homefort/commons/color_definations.dart';

errorSnackBar(
    {required String? message,
    required context,
    required bool isError,
    SnackBarAction? snackBarAction,
    Duration? duration}) {
  duration = duration ?? Duration(seconds: 5);
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            message!,
            softWrap: true,
            overflow: TextOverflow.visible,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ],
    ),
    backgroundColor:
        isError ? ColorDefination.errorColor : ColorDefination.successColor,
    padding: EdgeInsets.only(left: 16, right: 16),
    duration: duration,
    behavior: SnackBarBehavior.floating,
    action: snackBarAction,
  );
}
