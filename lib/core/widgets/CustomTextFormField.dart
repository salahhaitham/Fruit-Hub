import 'package:flutter/material.dart';
import '../utils/App_TextStyles.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final bool isPassword;
  final Widget? icon;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onSaved,
    this.keyboardType,
    this.isPassword = false,
    this.icon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      maxLength: 40,
      buildCounter: (_, {required currentLength, required isFocused, maxLength}) => null,

      obscureText: widget.isPassword && !_isVisible,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.body13Bold.copyWith(
          color: const Color(0xff949D9E),
        ),
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xffC9CECF),
          ),
        )
            : widget.icon,
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffE6E9E9),
      ),
    );
  }
}
