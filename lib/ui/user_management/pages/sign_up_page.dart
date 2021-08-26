import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nabed_test/blocs/user_management/sign_up_bloc.dart';
import 'package:nabed_test/common/widgets/base_body.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/constants/app_dimens.dart';
import 'package:nabed_test/constants/text_style.dart';
import 'package:nabed_test/ui/user_management/widgets/button_user_management_widget.dart';
import 'package:nabed_test/utils/device/app_uitls.dart';
import 'package:nabed_test/utils/device/device_utils.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:nabed_test/utils/routes/routes.dart';
import 'package:nabed_test/utils/validators/base_validator.dart';
import 'package:nabed_test/utils/validators/email_validator.dart';
import 'package:nabed_test/utils/validators/match_validator.dart';
import 'package:nabed_test/utils/validators/min_length_validator.dart';
import 'package:nabed_test/utils/validators/required_validator.dart';
import 'package:nabed_test/widgets/textfield/normal_form_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// ====================== Start variables section ======================
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Email parameters
  bool _emailValidation = false;
  String _email = '';
  final TextEditingController _emailEditingController =
      new TextEditingController();
  final _emailFocus = FocusNode();
  
  /// FullName parameters
  bool _fullNameValidation = false;
  String _fullName = '';
  final TextEditingController _fullNameEditingController =
      new TextEditingController();
  final _fullNameFocus = FocusNode();
  
  /// Password parameters
  bool _passwordValidation = false;
  String _password = '';
  final TextEditingController _passwordEditingController =
      new TextEditingController();
  final _passwordFocus = FocusNode();
  
  /// Confirm Password parameters
  bool _confirmPasswordValidation = false;
  String _confirmPassword = '';
  final TextEditingController _confirmPasswordEditingController =
      new TextEditingController();
  final _confirmPasswordFocus = FocusNode();

  var _cancelToken = CancelToken();
  var _bloc = SignUpBloc();
  
  
  /// ====================== End variables section ======================
 


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
      title: Text(
        "Create new account",
        style: appTextStyle.normalTSBasic.copyWith(color: AppColors.black),
      ),
      centerTitle: true,
      backgroundColor: AppColors.transparent,
      brightness: Brightness.light,
      elevation: 0,
    );

    double widthC = DeviceUtils.getScaledWidth(context, 1);
    double heightC = DeviceUtils.getScaledHeight(context, 1) -
        appBar.preferredSize.height -
        MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      primary: true,
      appBar: appBar,
      body: _buildBody(height: heightC, width: widthC),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody({required double width, required double height}) {
    return BlocListener<SignUpBloc, SignUpState>(
      bloc: _bloc,
      listener: (context, state) async {
        if (state is SignUpSuccess) {

          AppUtils.showSuccessMessage(context: context,title: AppLocalizations.of(context).translate('home_tv_success') ,message: "Account has been created successfully");

          Navigator.of(context).pushReplacementNamed(Routes.home,arguments: state.result);
        }
        if (state is SignUpFailure) {
          // _showErrorMessage(state.errorMessage);
          AppUtils.showErrorMessage(context: context,title: AppLocalizations.of(context).translate('home_tv_error') ,message: state.errorMessage);
          
        }
      },
      child:  BlocBuilder<SignUpBloc, SignUpState>(
          bloc: _bloc,
          builder: (context, state){
          return ModalProgressHUD(
            inAsyncCall: state is SignUpLoading,
            color: AppColors.mainColor,
            opacity: 0.2,
            child: Form(
              key: _formKey,
              autovalidateMode:AutovalidateMode.always ,
              child: BaseBody(
                portraitWidget: _portraitWidget(height: height, width: width),
                landscapeWidget: _landscapeWidget(height: height, width: width),
                isSafeAreaTop: true,
              ),
            ),
          );
        }
      ),
    );
  }

  // portrait view:--------------------------------------------------------------
  Widget _portraitWidget({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.horizontal_padding,
          vertical: AppDimens.vertical_padding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalPadding(
              percentage: .4,
            ),

            BorderFormField(
              controller: _emailEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator(), EmailValidator()],
                  _emailValidation,
                );
              },
              focusNode: _emailFocus,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'E-Mail',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.emailAddress,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _emailValidation = true;
                  _email = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_fullNameFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormField(
              controller: _fullNameEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator()],
                  _fullNameValidation,
                );
              },
              focusNode: _fullNameFocus,
              prefixIcon: Icon(
                Icons.person_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Full Name',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _fullNameValidation = true;
                  _fullName = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormPasswordField(
              controller: _passwordEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator(),MinLengthValidator(minLength: 8)],
                  _passwordValidation,
                );
              },
              // focusNode: _emailFocus,
              suffixIcon: Icons.remove_red_eye,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Password',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _passwordValidation = true;
                  _password = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormPasswordField(
              controller: _confirmPasswordEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator(),MatchValidator(value: _password)],
                  _confirmPasswordValidation,
                );
              },
              // focusNode: _emailFocus,
              suffixIcon: Icons.remove_red_eye,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Confirm Password',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _confirmPasswordValidation = true;
                  _confirmPassword = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                //FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            ButtonUserManagementWidget(
              width: width,
              child: Text(
                AppLocalizations.of(context).translate("login_btn_sign_up"),
                style: appTextStyle.middleTSBasic.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.mainColor,
              height: 55,
              borderColor: AppColors.white,
              onPressed: _signUpAction,
            ),
            VerticalPadding(
              percentage: 0.25,
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
      child: SingleChildScrollView(
        child: Column(
          children: [

            BorderFormField(
              controller: _emailEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator(), EmailValidator()],
                  _emailValidation,
                );
              },
              focusNode: _emailFocus,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'E-Mail',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.emailAddress,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _emailValidation = true;
                  _email = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_fullNameFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormField(
              controller: _fullNameEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator()],
                  _fullNameValidation,
                );
              },
              focusNode: _fullNameFocus,
              prefixIcon: Icon(
                Icons.person_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Full Name',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _fullNameValidation = true;
                  _fullName = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormPasswordField(
              controller: _passwordEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator()],
                  _passwordValidation,
                );
              },
              // focusNode: _emailFocus,
              suffixIcon: Icons.remove_red_eye,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Password',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _passwordValidation = true;
                  _password = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            BorderFormPasswordField(
              controller: _confirmPasswordEditingController,
              validator: (value) {
                return BaseValidator.validateValue(
                  context,
                  value!,
                  [RequiredValidator(),MatchValidator(value: _password)],
                  _confirmPasswordValidation,
                );
              },
              // focusNode: _emailFocus,
              suffixIcon: Icons.remove_red_eye,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.mainGray,
                size: 20,
              ),
              hintText: 'Confirm Password',
              fillColor: AppColors.mainGray.withOpacity(0.2),
              filled: true,
              keyboardType: TextInputType.text,
              borderRadius: width * .01,
              borderColor: AppColors.mainGray,
              hintStyle: appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
              onChanged: (value) {
                setState(() {
                  _confirmPasswordValidation = true;
                  _confirmPassword = value;
                });
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                //FocusScope.of(context).requestFocus(_passwordFocus);
              },
            ),

            VerticalPadding(
              percentage: .05,
            ),

            ButtonUserManagementWidget(
              width: width,
              child: Text(
                AppLocalizations.of(context).translate("login_btn_sign_up"),
                style: appTextStyle.middleTSBasic.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.mainColor,
              height: 55,
              borderColor: AppColors.white,
              onPressed: _signUpAction,
            ),
          ],
        ),
      ),
    );
  }


  _signUpAction(){
    DeviceUtils.hideKeyboard(context);
    setState(() {
       _fullNameValidation =true;
      _emailValidation = true;
      _passwordValidation = true;
      _confirmPasswordValidation = true;
    });

    if (_formKey.currentState!.validate()){
      _bloc.add(SignUpEvent(fullName: _fullName, password: _password, email: _email));
    }


    }
  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    _emailEditingController.dispose();
    _fullNameEditingController.dispose();
    _passwordEditingController.dispose();
    _confirmPasswordEditingController.dispose();
    _cancelToken.cancel();
    _bloc.close();
    super.dispose();
  }


}
