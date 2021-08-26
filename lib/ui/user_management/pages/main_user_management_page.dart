import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabed_test/common/animation/animation_column_widget.dart';
import 'package:nabed_test/common/widgets/base_body.dart';
import 'package:nabed_test/common/widgets/horizontal_padding.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_assets.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/ui/user_management/widgets/button_user_management_widget.dart';
import 'package:nabed_test/ui/user_management/widgets/login_background_widget.dart';
import 'package:nabed_test/ui/user_management/widgets/top_login_logo_widget.dart';
import 'package:nabed_test/ui/user_management/widgets/user_management_text_title_widget.dart';
import 'package:nabed_test/utils/device/device_utils.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:nabed_test/utils/routes/routes.dart';


class MainUserManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1);
    return Container(
      width: widthC,
      height: heightC,
      child: Stack(
        fit: StackFit.expand,
        children: [
          UserManagementBackgroundWidget(
            height: heightC,
            width: widthC,
            imageBackground: AppAssets.login_background,
          ),
          UserManagementContentPage(
            height: heightC,
            width: widthC,
          )
        ],
      ),
    );
  }
}

class UserManagementContentPage extends StatefulWidget {
  final double width;
  final double height;

  const UserManagementContentPage({required this.width, required this.height});

  @override
  _UserManagementContentPageState createState() => _UserManagementContentPageState();
}

class _UserManagementContentPageState extends State<UserManagementContentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: TopLoginLogoWidget(),
      backgroundColor: AppColors.transparent,
      brightness: Brightness.dark,
      elevation: 0,
    );

    double widthC = widget.width;
    double heightC = widget.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      primary: true,
      backgroundColor: AppColors.transparent,
      appBar: appBar,
      body: _buildBody(height: heightC, width: widthC),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody({required double width, required double height}) {
    return BaseBody(
      portraitWidget: _portraitWidget(height: height, width: width),
      landscapeWidget: _landscapeWidget(height: height, width: width),
      isSafeAreaTop: true,
    );
  }

  // portrait view:--------------------------------------------------------------
  Widget _portraitWidget({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(
          left: AppDimens.space16, right: AppDimens.space16),
      alignment: AlignmentDirectional.center,
      child: SingleChildScrollView(
        child: AnimationColumnWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          duration: Duration(milliseconds: 1000),
          verticalOffset: 50,
          children: [
            VerticalPadding(
              percentage: 0.03,
            ),
            UserManagementTextTitleWidget(
              title: AppLocalizations.of(context).translate("login_text_1"),
            ),
            VerticalPadding(
              percentage: 0.15,
            ),
            ButtonUserManagementWidget(
              width: width,
              child: Text(
                AppLocalizations.of(context).translate("login_btn_sign_in"),
                style: appTextStyle.smallTSBasic.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.white,
              height: 45,
              borderColor: AppColors.white,
              onPressed: () {
                //Navigator.of(context).pushReplacementNamed(SignInPage.mainRootPage);
                Navigator.of(context).pushNamed(Routes.signInPage);
              },
            ),
            VerticalPadding(
              percentage: 0.02,
            ),
            ButtonUserManagementWidget(
              width: width,
              backgroundColor: AppColors.white.withOpacity(0.3),
              height: 45,
              child: Text(
                AppLocalizations.of(context).translate("login_btn_sign_up"),
                style: appTextStyle.smallTSBasic.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              borderColor: AppColors.white,
              onPressed: () {
             //   Navigator.of(context).pushReplacementNamed(Routes.mainRootPage);
                Navigator.of(context).pushNamed(Routes.signUpPage);
              },
            ),
            VerticalPadding(
              percentage: 0.04,
            ),
            UserManagementTextTitleWidget(
              title: AppLocalizations.of(context).translate("sign_in_with"),
              alignment: AlignmentDirectional.center,
              style: appTextStyle.smallTSBasic.copyWith(
                  color: AppColors.white,
                  height: 1.4,
                  fontWeight: FontWeight.normal),
            ),
            VerticalPadding(
              percentage: 0.05,
            ),
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonUserManagementWidget(
                      width: width,
                      backgroundColor: AppColors.white.withOpacity(0.3),
                      height: 45,
                      child: _buildIconWithTextWidget(
                        title: AppLocalizations.of(context).translate("apple"),
                        iconAssets: AppAssets.apple_svg,
                      ),
                      borderColor: AppColors.white,
                      onPressed: () {
                      },
                    ),
                  ),
                  HorizontalPadding(
                    percentage: 0.02,
                  ),
                  Expanded(
                    flex: 1,
                    child: ButtonUserManagementWidget(
                      width: width,
                      backgroundColor:
                          AppColors.blueBackground.withOpacity(0.3),
                      height: 45,
                      child: _buildIconWithTextWidget(
                        title: AppLocalizations.of(context).translate("google"),
                        iconAssets: AppAssets.google_svg,
                      ),
                      borderColor: AppColors.blueBackground,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            VerticalPadding(
              percentage: 0.02,
            ),
            Container(
              width: width,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ButtonUserManagementWidget(
                      width: width,
                      backgroundColor:
                          AppColors.mainRed.withOpacity(0.3),
                      height: 45,
                      child: _buildIconWithTextWidget(
                        title: AppLocalizations.of(context)
                            .translate("office_365"),
                        iconAssets: AppAssets.office_svg,
                      ),
                      borderColor: AppColors.mainRed,
                      onPressed: () {
                      },
                    ),
                  ),
                  HorizontalPadding(
                    percentage: 0.02,
                  ),
                  Expanded(
                    flex: 1,
                    child: ButtonUserManagementWidget(
                      width: width,
                      backgroundColor:
                          AppColors.linkedinButBackground.withOpacity(0.3),
                      height: 45,
                      child: _buildIconWithTextWidget(
                        title:
                            AppLocalizations.of(context).translate("linkedin"),
                        iconAssets: AppAssets.linkedin_svg,
                      ),
                      borderColor: AppColors.linkedinButBorder,
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            VerticalPadding(
              percentage: 0.04,
            ),
            UserManagementTextTitleWidget(
              title: AppLocalizations.of(context).translate("login_with_other"),
              style: appTextStyle.minTSBasic.copyWith(
                  color: AppColors.white,
                  height: 1.4,
                  fontWeight: FontWeight.normal),
            ),
            VerticalPadding(
              percentage: 0.2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _landscapeWidget({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(
          left: AppDimens.space16, right: AppDimens.space16),
      alignment: AlignmentDirectional.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            VerticalPadding(
              percentage: 0.03,
            ),
            Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        UserManagementTextTitleWidget(
                          title: AppLocalizations.of(context)
                              .translate("login_text_1"),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    alignment: AlignmentDirectional.centerStart,
                  ),
                  HorizontalPadding(
                    percentage: 0.2,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ButtonUserManagementWidget(
                            width: width,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate("login_btn_sign_in"),
                              style: appTextStyle.smallTSBasic.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: AppColors.white,
                            height: 45,
                            borderColor: AppColors.white,
                            onPressed: () {
                      //        Navigator.of(context).pushReplacementNamed(Routes.mainRootPage);
                              Navigator.of(context).pushNamed(Routes.signInPage);
                            },
                          ),
                          VerticalPadding(
                            percentage: 0.02,
                          ),
                          ButtonUserManagementWidget(
                            width: width,
                            backgroundColor: AppColors.white.withOpacity(0.3),
                            height: 45,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate("login_btn_sign_up"),
                              style: appTextStyle.smallTSBasic.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            borderColor: AppColors.white,
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.signUpPage);
                            },
                          ),
                          VerticalPadding(
                            percentage: 0.04,
                          ),
                          UserManagementTextTitleWidget(
                            title: AppLocalizations.of(context)
                                .translate("sign_in_with"),
                            alignment: AlignmentDirectional.center,
                            style: appTextStyle.smallTSBasic.copyWith(
                                color: AppColors.white,
                                height: 1.4,
                                fontWeight: FontWeight.normal),
                          ),
                          VerticalPadding(
                            percentage: 0.05,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ButtonUserManagementWidget(
                                    width: width,
                                    backgroundColor:
                                        AppColors.white.withOpacity(0.3),
                                    height: 45,
                                    child: _buildIconWithTextWidget(
                                      title: AppLocalizations.of(context)
                                          .translate("apple"),
                                      iconAssets: AppAssets.apple_svg,
                                    ),
                                    borderColor: AppColors.white,
                                    onPressed: () {
                                    },
                                  ),
                                ),
                                HorizontalPadding(
                                  percentage: 0.02,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ButtonUserManagementWidget(
                                    width: width,
                                    backgroundColor: AppColors.blueBackground
                                        .withOpacity(0.3),
                                    height: 45,
                                    child: _buildIconWithTextWidget(
                                      title: AppLocalizations.of(context)
                                          .translate("google"),
                                      iconAssets: AppAssets.google_svg,
                                    ),
                                    borderColor: AppColors.blueBackground,
                                    onPressed: () {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalPadding(
                            percentage: 0.02,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ButtonUserManagementWidget(
                                    width: width,
                                    backgroundColor: AppColors
                                        .mainRed
                                        .withOpacity(0.3),
                                    height: 45,
                                    child: _buildIconWithTextWidget(
                                      title: AppLocalizations.of(context)
                                          .translate("office_365"),
                                      iconAssets: AppAssets.office_svg,
                                    ),
                                    borderColor: AppColors.mainRed,
                                    onPressed: () {
                                    },
                                  ),
                                ),
                                HorizontalPadding(
                                  percentage: 0.02,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ButtonUserManagementWidget(
                                    width: width,
                                    backgroundColor: AppColors
                                        .linkedinButBackground
                                        .withOpacity(0.3),
                                    height: 45,
                                    child: _buildIconWithTextWidget(
                                      title: AppLocalizations.of(context)
                                          .translate("linkedin"),
                                      iconAssets: AppAssets.linkedin_svg,
                                    ),
                                    borderColor: AppColors.linkedinButBorder,
                                    onPressed: () {
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalPadding(
                            percentage: 0.04,
                          ),
                          UserManagementTextTitleWidget(
                            title: AppLocalizations.of(context)
                                .translate("login_with_other"),
                            style: appTextStyle.minTSBasic.copyWith(
                                color: AppColors.white,
                                height: 1.4,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            VerticalPadding(
              percentage: 0.2,
            ),
          ],
        ),
      ),
    );
  }

  // helper widget :
  Widget _buildIconWithTextWidget(
      {required String title, required String iconAssets}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconAssets,
          width: 18,
          height: 18,
        ),
        HorizontalPadding(
          percentage: 0.02,
        ),
        Text(
          title,
          style: appTextStyle.minTSBasic
              .copyWith(color: AppColors.white, height: 1.4),
        ),
      ],
    );
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    super.dispose();
  }
}
