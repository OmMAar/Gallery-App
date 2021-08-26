import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nabed_test/constants/app_constants.dart';

import 'global_decorations.dart';


class NormalFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onFieldSubmitted;
  final TextStyle? style;
  final TextStyle? labelStyle;

  const NormalFormField({
    Key? key,
    this.validator,
    this.controller,
    this.inputFormat,
    this.label,
    this.keyboardType,
    this.onChanged,
    this.focusNode,
    this.hintText,
    this.nextNode,
    this.onFieldSubmitted,
    this.style,
    this.labelStyle,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: style ??
            appTextStyle.smallTSBasic.copyWith(color: AppColors.primaryColor),
        cursorColor: AppColors.primaryColor,
        decoration: GlobalDecorations.kNormalFieldInputDecoration.copyWith(
            labelText: label,
            hintText: hintText,
            labelStyle: labelStyle ??
                appTextStyle.smallTSBasic
                    .copyWith(color: AppColors.primaryColor)),
        validator: validator,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        autovalidate: true,
        onChanged: onChanged,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted != null
            ? onFieldSubmitted
            : (term) {
                _fieldFocusChange(context, focusNode, nextNode);
              });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

class BorderFormField extends StatelessWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  const BorderFormField(
      {Key? key,
      this.validator,
      this.isEnableFocusOnTextField = true,
      this.inputFormat,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.onTap,
      this.readOnly = false,
      this.filled = false,
      this.fillColor,
      this.textAlign,
      this.maxLines = 1,
      this.minLines,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,

      this.borderColor,
      this.style,
      this.contentPadding,
      this.maxLength,
      this.buildCounter,
      this.hintStyle,
      required this.hintText,
      this.borderRadius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: style ??
            appTextStyle.smallTSBasic.copyWith(
                color: AppColors.black,
                decorationThickness: 0,
                wordSpacing: 1.0),
        cursorColor: borderColor ?? AppColors.primaryColor,
        textCapitalization: TextCapitalization.sentences,
        cursorWidth: 1.5,
        maxLength: maxLength ?? null,
        // minLines: minLines??1,
        buildCounter: buildCounter ?? null,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            errorStyle: appTextStyle.subMinTSBasic.copyWith(
              color: Colors.red,
            ),
            counterStyle:
                appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
            contentPadding: contentPadding ??
                EdgeInsets.only(
                    left: AppDimens.space10, right: AppDimens.space10),
            focusedBorder: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            enabledBorder: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            errorBorder: generalBoarder(
                isError: true,
                borderRadius: borderRadius,
                borderColor: borderColor),
            border: generalBoarder(
                borderRadius: borderRadius, borderColor: borderColor),
            focusedErrorBorder: generalBoarder(
                isError: true,
                borderRadius: borderRadius,
                borderColor: borderColor),
            hintText: hintText,
            prefixIcon: prefixIcon ?? null,
            suffixIcon: suffixIcon ?? null,
            //   labelText: hintText??'',
            hintStyle: hintStyle ??
                appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
            alignLabelWithHint: false,
            labelStyle: appTextStyle.normalTSBasic.copyWith(
              color: AppColors.black
            ),
            filled: filled,
            fillColor: fillColor ?? null),
        validator: validator,
        enabled: isEnableFocusOnTextField,
        inputFormatters: inputFormat,
        keyboardType: keyboardType,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap != null ? onTap as void Function()? : () {},
        onFieldSubmitted: onFieldSubmitted != null
            ? onFieldSubmitted
            : (term) {
                _fieldFocusChange(context, focusNode, nextNode);
              });
  }
  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
class BorderFormPasswordField extends StatefulWidget {
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? keyboardType;
  final double borderRadius;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool isEnableFocusOnTextField;
  final bool readOnly;
  final bool filled;
  final Color? fillColor;
  final Function? onTap;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;

  final Color? borderColor;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  final InputCounterWidgetBuilder? buildCounter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;

  const BorderFormPasswordField(
      {Key? key,
      this.validator,
      this.isEnableFocusOnTextField = true,
      this.inputFormat,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.onTap,
      this.readOnly = false,
      this.filled = false,
      this.fillColor,
      this.textAlign,
      this.maxLines = 1,
      this.minLines,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,
        this.suffixIconColor,
        this.suffixIconSize = 20,
      this.borderColor,
      this.style,
      this.contentPadding,
      this.maxLength,
      this.buildCounter,
      this.hintStyle,
      required this.hintText,
      this.borderRadius = 0})
      : super(key: key);

  @override
  _BorderFormPasswordFieldState createState() => _BorderFormPasswordFieldState();
}

class _BorderFormPasswordFieldState extends State<BorderFormPasswordField> {


  bool isSecureText = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        style: widget.style ??
            appTextStyle.smallTSBasic.copyWith(
                color: AppColors.black,
                decorationThickness: 0,
                wordSpacing: 1.0),
        cursorColor: widget.borderColor ?? AppColors.primaryColor,
        textCapitalization: TextCapitalization.sentences,
        cursorWidth: 1.5,
        maxLength: widget.maxLength ?? null,
        // minLines: minLines??1,
        buildCounter: widget.buildCounter ?? null,
        textAlign: widget.textAlign ?? TextAlign.start,
        decoration: InputDecoration(
            errorStyle: appTextStyle.subMinTSBasic.copyWith(
              color: Colors.red,
            ),
            counterStyle:
                appTextStyle.smallTSBasic.copyWith(color: AppColors.black),
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                    left: AppDimens.space10, right: AppDimens.space10),
            focusedBorder: generalBoarder(
                borderRadius: widget.borderRadius, borderColor: widget.borderColor),
            enabledBorder: generalBoarder(
                borderRadius: widget.borderRadius, borderColor: widget.borderColor),
            errorBorder: generalBoarder(
                isError: true,
                borderRadius: widget.borderRadius,
                borderColor: widget.borderColor),
            border: generalBoarder(
                borderRadius: widget.borderRadius, borderColor: widget.borderColor),
            focusedErrorBorder: generalBoarder(
                isError: true,
                borderRadius: widget.borderRadius,
                borderColor: widget.borderColor),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon ?? null,
            suffixIcon: InkWell(
              onTap: (){
                if(mounted){
                  setState(() {
                    isSecureText = !isSecureText;
                  });
                }
              },
              child: Icon(
                widget.suffixIcon ?? Icons.remove_red_eye,
                color: widget.suffixIconColor ?? AppColors.mainGray,
                size: widget.suffixIconSize,
              ),
            ),
            //   labelText: hintText??'',
            hintStyle: widget.hintStyle ??
                appTextStyle.smallTSBasic.copyWith(color: AppColors.mainGray),
            alignLabelWithHint: false,
            labelStyle: appTextStyle.normalTSBasic.copyWith(
              color: AppColors.black
            ),
            filled: widget.filled,
            fillColor: widget.fillColor ?? null),
        validator: widget.validator,
        enabled: widget.isEnableFocusOnTextField,
        inputFormatters: widget.inputFormat,
        keyboardType: widget.keyboardType,
        obscureText: isSecureText,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        onTap: widget.onTap != null ? widget.onTap as void Function()? : () {},
        onFieldSubmitted: widget.onFieldSubmitted != null
            ? widget.onFieldSubmitted
            : (term) {
                _fieldFocusChange(context, widget.focusNode, widget.nextNode);
              });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}


InputBorder generalBoarder(
    {bool isError = false, required double borderRadius, Color? borderColor}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor ?? AppColors.mainColor,
      style: BorderStyle.solid,
      width: isError ? 3.0 : 1.5,
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(borderRadius) //         <--- border radius here
        ),
  );
}

