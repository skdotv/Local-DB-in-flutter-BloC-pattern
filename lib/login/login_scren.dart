import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reporting_system/appcolor/appcolor.dart';
import 'package:reporting_system/common/common_form_field.dart';
import 'package:reporting_system/login/bloc/login_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginBloc bloc = LoginBloc();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: commonFormField(
                  stream: bloc.usernameController,
                  hintText: "Username",
                  maxLines: 1,
                  onChanged: (value) {
                    bloc.usernameController.sink.add(value);
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: commonFormField(
                  stream: bloc.passwordController,
                  hintText: "Password",
                  isObscure: true,
                  maxLines: 1,
                  onChanged: (value) {
                    bloc.passwordController.sink.add(value);
                  },
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password field is required";
                    } else {
                      return null;
                    }
                  }),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColor.kPrimaryColor),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  bloc.login(context);
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
