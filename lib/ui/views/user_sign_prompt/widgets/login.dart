import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';
import 'package:school_management/ui/widgets/input_field.dart';

class Login extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const Login({super.key, required this.viewModel});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextInputFormatter usernameFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  TextEditingController passwordController = TextEditingController();
  TextInputFormatter passwordFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Form(
              key: widget.viewModel.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //login
                  Text(
                    "Login",
                    style: ktsTitleText,
                  ),
                  //please sign in to your account
                  Text(
                    "Please sign in to your account",
                    style: ktsBodyRegular,
                  ),
                  verticalSpaceMedium,
                  //contain 3 circles
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: kcWhite,
                      ),
                      horizontalSpaceSmall,
                      CircleAvatar(
                        backgroundColor: kcBlue,
                      ),
                      horizontalSpaceSmall,
                      CircleAvatar(
                        backgroundColor: kcDarkGreyColor,
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
                      Text(
                        "Username",
                        style: ktsBodyRegular,
                      ),
                      //inputField
                      InputField(
                          controller: usernameController,
                          validate: true,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: kcPrimaryColorDark,
                          ),
                          horizontalPadding: 0,
                          hintText: "Type your username",
                          inputFormatters: [usernameFormatter],
                          textInputType: TextInputType.text)
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //username
                      Text(
                        "Password",
                        style: ktsBodyRegular,
                      ),
                      //inputField
                      InputField(
                          controller: passwordController,
                          validate: true,
                          hintText: "Type your password",
                          obscureText: widget.viewModel.isObsecured,
                          horizontalPadding: 0,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: kcPrimaryColorDark,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                widget.viewModel.passwordObsecurity();
                              },
                              icon: Icon(
                                widget.viewModel.isObsecured
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: kcPrimaryColorDark,
                              )),
                          inputFormatters: [passwordFormatter],
                          textInputType: TextInputType.visiblePassword)
                    ],
                  ),
                  //forgot pass
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                        onPressed: () => widget.viewModel.setOnlyOneTrue(3),
                        child: Text(
                          "Forget password?",
                          textAlign: TextAlign.center,
                          style: ktsBodyRegular.copyWith(),
                        )),
                  ),
                  //rounded elevated button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))))),
                        onPressed: () => widget.viewModel.login(),
                        child: Text(
                          "Login",
                          style: ktsBodyRegular.copyWith(color: kcWhite),
                        )),
                  ),
                  verticalSpaceMedium,
                  //don't have account? register with gesture
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account? ",
                            style: ktsBodyRegular.copyWith(fontSize: 18)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => widget.viewModel.setOnlyOneTrue(2),
                            text: "Register",
                            style: ktsBodyRegular.copyWith(
                                fontSize: 18, color: kcBlue))
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
