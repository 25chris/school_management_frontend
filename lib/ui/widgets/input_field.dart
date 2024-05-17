import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final String? labelText;
  final int maxLines;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? fillColor;
  final bool? filled;
  final double? borderRadius;
  final BorderSide? borderSide;
  final bool validate; // Whether to perform validation
  final Function(String)? onChanged;
  final String? Function(String?)? customValidator; // Custom validator function

  const InputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.inputFormatters,
      required this.textInputType,
      required this.prefixIcon,
      this.borderRadius,
      this.borderSide,
      this.horizontalPadding,
      this.verticalPadding,
      this.obscureText = false,
      this.suffixIcon,
      this.labelText,
      this.maxLines = 1,
      this.onChanged,
      this.validate = false,
      this.customValidator,
      this.fillColor,
      this.filled})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 10.0,
          vertical: widget.verticalPadding ?? 10.0),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.filled,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
              borderSide: widget.borderSide ?? const BorderSide()),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
        ),
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validate ? _validateInput : null,
      ),
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This part cannot be empty!';
    }
    if (widget.textInputType == TextInputType.emailAddress) {
      // Email validation
      String pattern = r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
    }
    if (widget.textInputType == TextInputType.visiblePassword) {
      // Password validation
      if (value.length < 8) {
        return 'Password must be at least 8 characters';
      }
    }
    if (widget.customValidator != null) {
      return widget.customValidator!(value);
    }
    return null;
  }
}
