import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';
import 'package:school_management/ui/widgets/input_field.dart';

class NewPassword extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const NewPassword({super.key, required this.viewModel});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController password1Controller = TextEditingController();
  TextInputFormatter password1Formatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  TextEditingController password2Controller = TextEditingController();
  TextInputFormatter password2Formatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcVeryLiteWhite,
        leading: IconButton(
            onPressed: () => widget.viewModel.setOnlyOneTrue(3),
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: kcPrimaryColorDark,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Form(
          key: widget.viewModel.newPassFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Password",
                style: ktsBodyLarge,
              ),
              verticalSpaceSmall,
              Text(
                "Create new password that is safe and easy to remember",
                style: ktsBodyRegular,
              ),
              verticalSpaceMedium,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //username
                  Text(
                    "New Password",
                    style: ktsBodyRegular,
                  ),
                  //inputField
                  InputField(
                      controller: password1Controller,
                      horizontalPadding: 0,
                      validate: true,
                      obscureText: widget.viewModel.isObsecured,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kcPrimaryColorDark,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () =>
                              widget.viewModel.passwordObsecurity(),
                          icon: Icon(
                            widget.viewModel.isObsecured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: kcPrimaryColorDark,
                          )),
                      hintText: "Type your new password",
                      inputFormatters: [password1Formatter],
                      textInputType: TextInputType.visiblePassword)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //username
                  Text(
                    "Confirm New Password",
                    style: ktsBodyRegular,
                  ),
                  //inputField
                  InputField(
                      controller: password2Controller,
                      horizontalPadding: 0,
                      validate: true,
                      obscureText: widget.viewModel.isObsecured,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: kcPrimaryColorDark,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () =>
                              widget.viewModel.passwordObsecurity(),
                          icon: Icon(
                              widget.viewModel.isObsecured
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: kcPrimaryColorDark)),
                      hintText: "Confirm your new password",
                      inputFormatters: [password2Formatter],
                      customValidator: (value) {
                        if (value != password1Controller.text) {
                          return value;
                        }
                        return null;
                      },
                      textInputType: TextInputType.visiblePassword)
                ],
              ),
              verticalSpaceMedium,
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 52,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))))),
                    onPressed: () => widget.viewModel.submitNewPassword(),
                    child: Text(
                      "Continue",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
