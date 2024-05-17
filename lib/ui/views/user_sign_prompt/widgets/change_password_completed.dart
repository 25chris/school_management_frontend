import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';
import 'package:school_management/ui/widgets/my_button_theme.dart';

class ChangePasswordComplete extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const ChangePasswordComplete({super.key, required this.viewModel});

  @override
  State<ChangePasswordComplete> createState() => _ChangePasswordCompleteState();
}

class _ChangePasswordCompleteState extends State<ChangePasswordComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Placeholder(),
                    Text(
                      "Change password complete",
                      textAlign: TextAlign.center,
                      style: ktsTitleText,
                    ),
                    Text(
                      "The password has been changed, please go back to doing the event search",
                      textAlign: TextAlign.center,
                      style: ktsBodyRegular,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyButtonTheme(
            onPressed: () => widget.viewModel.setOnlyOneTrue(1),
            label: "Login",
          ),
        ));
  }
}
