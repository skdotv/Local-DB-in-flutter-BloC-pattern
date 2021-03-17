// text form field start
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reporting_system/appcolor/appcolor.dart';
import 'package:reporting_system/common/size.dart';

Widget commonFormField({
  Stream stream,
  String initialValue,
  FocusNode focusNode,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
  FormFieldValidator<String> validator,
  String hintText,
  TextEditingController textEditingController,
  bool isObscure = false,
  int maxLength,
  EdgeInsetsGeometry contentPadding =
      const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
  double radius = 10,
  Widget suffixIcon,
  bool autoFocus = false,
  TextCapitalization textCapitalization = TextCapitalization.none,
  List<TextInputFormatter> inputFormatter,
  void Function(String) onChanged,
  void Function(String) onSaved,
  void Function(String) onFieldSubmitted,
}) {
  return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        print(snapshot.data);
        return TextFormField(
          maxLength: maxLength,
          inputFormatters: inputFormatter,
          autofocus: autoFocus,
          controller: textEditingController,
          initialValue: initialValue,
          obscureText: isObscure,
          focusNode: focusNode,
          cursorColor: AppColor.kPrimaryColor,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          validator: validator,
          textCapitalization: textCapitalization,
          //obscureText: obsecureText,
          decoration: InputDecoration(
            fillColor: AppColor.kTextBoxFillColor,
            hintText: snapshot.hasData ? snapshot.data : hintText,
            hintStyle: TextStyle(
              fontSize: CommonSize.kfontSize,
              fontFamily: 'light',
              color: AppColor.kTextColor,
            ),
            contentPadding: contentPadding,
            isDense: true,
            focusColor: Colors.redAccent,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kerrorColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.kerrorColor),
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            errorText: snapshot.hasError ? snapshot.error : null,
            errorStyle: TextStyle(
                fontSize: CommonSize.kerrorFontSize,
                fontFamily: 'regular',
                color: AppColor.kerrorColor),
            suffixIcon: suffixIcon,
          ),
          style: TextStyle(
            fontSize: CommonSize.kfontSize,
            fontFamily: 'regular',
            color: AppColor.kPrimaryColor,
          ),
        );
      });
}
