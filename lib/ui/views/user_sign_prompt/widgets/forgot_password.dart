import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';
import 'package:school_management/ui/widgets/input_field.dart';

class ForgotPassword extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const ForgotPassword({super.key, required this.viewModel});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcVeryLiteWhite,
        leading: IconButton(
            onPressed: () => widget.viewModel.setOnlyOneTrue(1),
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: kcPrimaryColorDark,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forget your password?",
              style: ktsBodyLarge,
            ),
            verticalSpaceSmall,
            Text(
              "Enter your email address and we'll send you confirmation code to reset your password",
              style: ktsBodyRegular,
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
                Form(
                  key: widget.viewModel.forgotPassFormKey,
                  child: InputField(
                      controller: widget.viewModel.forgetEmailController,
                      horizontalPadding: 0,
                      validate: true,
                      prefixIcon: const Icon(
                        Icons.mail_outline,
                        color: kcPrimaryColorDark,
                      ),
                      hintText: "Type your email",
                      inputFormatters: [widget.viewModel.forgetEmailFormatter],
                      textInputType: TextInputType.emailAddress),
                )
              ],
            ),
            verticalSpaceMedium,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))))),
                  onPressed: () => widget.viewModel.forgotPass(),
                  child: Text(
                    "Continue",
                    style: ktsBodyRegular.copyWith(color: kcWhite),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
