import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:school_management/ui/common/app_colors.dart';
import 'package:school_management/ui/common/app_shared_style.dart';
import 'package:school_management/ui/common/ui_helpers.dart';
import 'package:school_management/ui/views/user_sign_prompt/user_sign_prompt_viewmodel.dart';

class OneTimePassword extends StatefulWidget {
  final UserSignPromptViewModel viewModel;
  const OneTimePassword({super.key, required this.viewModel});

  @override
  State<OneTimePassword> createState() => _OneTimePasswordState();
}

class _OneTimePasswordState extends State<OneTimePassword> {
  // Controllers for each text field
  final TextEditingController _controllerOne = TextEditingController();
  final TextEditingController _controllerTwo = TextEditingController();
  final TextEditingController _controllerThree = TextEditingController();
  final TextEditingController _controllerFour = TextEditingController();

  // Focus nodes to manage focus of TextFormFields
  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();
  final FocusNode _focusNodeFour = FocusNode();

  Timer? _timer;
  int _start = 60; // Start from 60 seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 60; // Reset the timer to 60 seconds
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcVeryLiteWhite,
        leading: IconButton(
            onPressed: () async {
              setState(() {
                _timer!.cancel();
              });
              widget.viewModel.setOnlyOneTrue(3);
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: kcPrimaryColorDark,
            )),
        title: Text(
          'OTP',
          style: ktsBodyRegular.copyWith(
              fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Verification",
              style: ktsBodyLarge,
            ),
            verticalSpaceSmall,
            Text(
              "Please enter 4-digit code sent to you at \n${widget.viewModel.forgetEmailController.text}",
              style: ktsBodyRegular,
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _otpTextField(_controllerOne, _focusNodeOne),
                  _otpTextField(_controllerTwo, _focusNodeTwo),
                  _otpTextField(_controllerThree, _focusNodeThree),
                  _otpTextField(_controllerFour, _focusNodeFour),
                ],
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text.rich(
                TextSpan(children: [
                  _start > 0
                      ? TextSpan(
                          text: 'Resend code in $_start seconds',
                          style: ktsBodyRegular)
                      : TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                _controllerOne.text = "";
                                _controllerTwo.text = "";
                                _controllerThree.text = "";
                                _controllerFour.text = "";
                              });
                              widget.viewModel.resendMailDialog();
                            },
                          text: 'Resend code',
                          style: ktsBodyRegular.copyWith(color: kcBlue))
                ]),
                textAlign: TextAlign.center,
              ),
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
                  onPressed: _controllerOne.text.isNotEmpty &&
                          _controllerTwo.text.isNotEmpty &&
                          _controllerThree.text.isNotEmpty &&
                          _controllerFour.text.isNotEmpty
                      ? () {
                          setState(() {
                            _timer!.cancel();
                          });
                          widget.viewModel.submitOtpCode();
                        }
                      : null,
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

  Widget _otpTextField(TextEditingController controller, FocusNode focusNode) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: ktsBodyLarge,
        decoration: const InputDecoration(
          counterText: "", // Hide counter underneath the TextField
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            focusNode.nextFocus(); // Move focus to next
          }
        },
      ),
    );
  }

  void _submitCode() {
    String otpCode = _controllerOne.text +
        _controllerTwo.text +
        _controllerThree.text +
        _controllerFour.text;
    print('Entered OTP is: $otpCode');
    // Here you can add your code to send the OTP for verification
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    _controllerOne.dispose();
    _controllerTwo.dispose();
    _controllerThree.dispose();
    _controllerFour.dispose();
    _focusNodeOne.dispose();
    _focusNodeTwo.dispose();
    _focusNodeThree.dispose();
    _focusNodeFour.dispose();
    super.dispose();
  }
}
