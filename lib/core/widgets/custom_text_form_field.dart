import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.keyboardType,
  });
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String hintText;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscureText;

  @override
  void initState() {
    isObscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: isObscureText,

      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        filled: true,
        fillColor: AppColors.kWhiteColor,
        border: buildBorder(color: Color(0xFF7F7F7F)),
        enabledBorder: buildBorder(color: AppColors.kStokeColor),
        focusedBorder: buildBorder(color: Color(0xFF7F7F7F)),
        errorBorder: buildBorder(color: AppColors.kErrorColor),
        hintText: widget.hintText,
        hintStyle: AppStyles.regular14,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.kSecondaryColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              )
            : null,
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
