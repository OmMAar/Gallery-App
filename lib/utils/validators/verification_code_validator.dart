import 'package:flutter/material.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';

import 'base_validator.dart';

class VerificationCodeValidator extends BaseValidator {
  @override
  String getMessage(BuildContext? context) {
    return AppLocalizations.of(context!).translate('v_invalid_code');
  }

  @override
  bool validate(String value) {
    return value.isNotEmpty && value.length == 5;
  }
}
