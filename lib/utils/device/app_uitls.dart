import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  static showMessage({String? message, String? title,required BuildContext context}) {
    if (message!.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createInformation(
            message: message,
            title: title??'',
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
  static showErrorMessage({String? message, String? title,required BuildContext context}) {
    if (message!.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: title??'',
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
  static showSuccessMessage({String? message, String? title,required BuildContext context}) {
    if (message!.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createSuccess(
            message: message,
            title: title??'',
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  static showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      child: child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }

}
