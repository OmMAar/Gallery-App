import 'package:flutter/material.dart';
import 'package:nabed_test/constants/text_style.dart';
import 'package:nabed_test/constants/app_assets.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';

class UnexpectedError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //   Assets.unexpectedError,
              //   width: 240,
              //   height: 240,
              // ),
              Text(
                AppLocalizations.of(context).translate('unexpected_err'),
                style: appTextStyle.smallTSBasic,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}