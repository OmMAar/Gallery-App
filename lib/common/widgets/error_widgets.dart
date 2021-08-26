import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';

class ConnectionErrorWidget extends StatelessWidget {
  final VoidCallback? callback;

  const ConnectionErrorWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('connection_err'),
            style:
                appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
          ),
          RaisedButton(
            onPressed: callback,
            child: Text(
              AppLocalizations.of(context).translate('retry'),
              style: appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
            ),
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}

class UnexpectedErrorWidget extends StatelessWidget {
  final VoidCallback? callback;

  const UnexpectedErrorWidget({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('unexpected_err'),
            style:
                appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
          ),
          RaisedButton(
            onPressed: callback,
            child: Text(
              AppLocalizations.of(context).translate('retry'),
              style: appTextStyle.smallTSBasic.copyWith(color: AppColors.white),
            ),
            color: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}

class InternalServerErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('err_server'),
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}

class ForbiddenErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('err_forbidden'),
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}

class BadRequestErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('err_bad_request'),
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}

class NotFoundErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('err_not_found'),
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}

class UnauthorizedErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('err_unauthorized'),
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({
    Key? key,
    required this.message,
  })   : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
      ),
    );
  }
}
