import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/app/app.locator.dart';
import 'package:school_management/app/app.router.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserSignPromptViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final forgotPassFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final newPassFormKey = GlobalKey<FormState>();

  late bool isObsecured = true;
  late bool isAgreed = false;
  late bool isLoginPage = true;
  late bool isRegisterPage = false;
  late bool isChangePasswordPage = false;
  late bool isForgotPasswordPage = false;
  late bool isNewPasswordPage = false;
  late bool isOtp = false;

  TextEditingController forgetEmailController = TextEditingController();
  TextInputFormatter forgetEmailFormatter =
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@._ ]"));

  void passwordObsecurity() {
    isObsecured = !isObsecured;
    rebuildUi();
  }

  void policyAgree() {
    isAgreed = !isAgreed;
    rebuildUi();
  }

  void setOnlyOneTrue(int index) {
    isLoginPage = index == 1;
    rebuildUi();
    isRegisterPage = index == 2;
    rebuildUi();
    isForgotPasswordPage = index == 3;
    rebuildUi();
    isChangePasswordPage = index == 4;
    rebuildUi();
    isNewPasswordPage = index == 5;
    rebuildUi();
    isOtp = index == 6;
    rebuildUi();
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      await navigateToHome();
    }
  }

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      print("Registering");
    }
  }

  Future<void> forgotPass() async {
    if (forgotPassFormKey.currentState!.validate()) {
      setOnlyOneTrue(6);
    }
  }

  Future<void> submitNewPassword() async {
    if (newPassFormKey.currentState!.validate()) {
      setOnlyOneTrue(4);
    }
  }

  Future<void> resendMail() async {
    if (forgotPassFormKey.currentState!.validate()) {
      setOnlyOneTrue(6);
    }
  }

  Future<void> resendMailDialog() async {
    _dialogService.showConfirmationDialog(
        title: "Email has been sent",
        description: "Another OTP has been sent to your email.",
        cancelTitle: "",
        cancelTitleColor: kcWhite);
  }

  void submitOtpCode() {
    setOnlyOneTrue(5);
  }

  Future navigateToHome() async {
    _navigationService.replaceWithHomeView();
  }
}
