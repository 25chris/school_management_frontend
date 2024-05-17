import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';
import 'package:school_management/ui/widgets/input_field.dart';

class Register extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const Register({super.key, required this.viewModel});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextInputFormatter emailFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@._ ]"));
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
              key: widget.viewModel.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //login
                  Text(
                    "Create an account",
                    style: ktsTitleText,
                  ),
                  //please sign in to your account
                  Text(
                    "Register with social of fill the form to continue.",
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
                        "Email",
                        style: ktsBodyRegular,
                      ),
                      //inputField
                      InputField(
                          controller: emailController,
                          validate: true,
                          horizontalPadding: 0,
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: kcPrimaryColorDark,
                          ),
                          hintText: "Type your email",
                          inputFormatters: [emailFormatter],
                          textInputType: TextInputType.emailAddress)
                    ],
                  ),
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
                          horizontalPadding: 0,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: kcPrimaryColorDark,
                          ),
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
                          horizontalPadding: 0,
                          hintText: "Type your password",
                          obscureText: widget.viewModel.isObsecured,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: widget.viewModel.isAgreed,
                            onChanged: (val) => widget.viewModel.policyAgree()),
                        horizontalSpaceSmall,
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text.rich(TextSpan(children: [
                              const TextSpan(text: "I Agree with "),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: "Term of Service",
                                  style:
                                      ktsBodyRegular.copyWith(color: kcBlue)),
                              const TextSpan(text: " and "),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: "Privacy Policy",
                                  style:
                                      ktsBodyRegular.copyWith(color: kcBlue)),
                            ])),
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpaceSmall,
                  //rounded elevated button
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30))))),
                        onPressed: widget.viewModel.isAgreed
                            ? () => widget.viewModel.register()
                            : null,
                        child: Text(
                          "Continue",
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
                            text: "Already have an account? ",
                            style: ktsBodyRegular.copyWith(fontSize: 18)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => widget.viewModel.setOnlyOneTrue(1),
                            text: "Login",
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
