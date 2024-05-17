import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/change_password_completed.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/forgot_password.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/login.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/new_password.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/otp.dart';
import 'package:school_management/ui/views/user_sign_prompt/widgets/register.dart';
import 'package:stacked/stacked.dart';

import 'user_sign_prompt_viewmodel.dart';

class UserSignPromptView extends StackedView<UserSignPromptViewModel> {
  const UserSignPromptView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserSignPromptViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kcVeryLiteWhite,
      body: Container(
        child: viewModel.isLoginPage
            ? Login(
                viewModel: viewModel,
              )
            : viewModel.isRegisterPage
                ? Register(viewModel: viewModel)
                : viewModel.isOtp
                    ? OneTimePassword(viewModel: viewModel)
                    : viewModel.isNewPasswordPage
                        ? NewPassword(viewModel: viewModel)
                        : viewModel.isChangePasswordPage
                            ? ChangePasswordComplete(viewModel: viewModel)
                            : ForgotPassword(viewModel: viewModel),
      ),
    );
  }

  @override
  UserSignPromptViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserSignPromptViewModel();
}
