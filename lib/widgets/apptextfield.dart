import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/style.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final bool? isFilled;
  final String? hint;
  final String? labelText;
  final String? suffixText;
  final String? helperText;
  final String? prefixText;
  final IconData? suffixIcon;
  final int? maxNumber;
  final int? maxLines;
  final double? borderradius;
  final bool isRequired;
  final bool isdropDown;
  final bool? showIconButton;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onSuffixIconPressed;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? labelColor;
  final Color? bgClr;
  final Color? suffixIconClr;
  final bool readOnly;
  final bool isUppercase;
  final TextStyle? labelTextStyle;
  final Widget? prefixIcon;
    final TextStyle? hintStyle;

  const AppTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.textAlign,
    this.labelTextStyle,
    this.focusNode,
    this.suffixIconClr,
    this.hint,
    this.labelText,
    this.isdropDown=false,
    this.suffixText,
    this.readOnly = false,
    this.suffixIcon,
    this.helperText,
    this.bgClr,
    this.prefixText,
    this.isRequired = false,
    this.isUppercase=false,
    this.onChanged,
    this.onTap,
    this.validator,
    this.isFilled,
    this.maxLines,
    this.maxNumber,
    this.borderColor,
    this.labelColor,
    this.showIconButton = false,
    this.onSuffixIconPressed,
    this.borderradius,
    this.prefixIcon,
    this.hintStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,     
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.textStyle_400_14.copyWith(decoration: TextDecoration.none, ),
      textInputAction: TextInputAction.next,
      readOnly: readOnly,
      textAlign: textAlign ?? TextAlign.start,
      inputFormatters: [
        LengthLimitingTextInputFormatter(
          keyboardType == TextInputType.phone || keyboardType == TextInputType.number
              ? (maxNumber ?? 10)
              : (maxLines == null ? 48 : 300),
        ),
     if(isUppercase)   UpperCaseTextFormatter(), 
      ],
      focusNode: focusNode,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      maxLength: maxNumber,
      maxLines: maxLines,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        filled: isFilled ?? false,
        fillColor: bgClr ?? Colors.white,
       
       
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xFF949494)),
          borderRadius: BorderRadius.all(Radius.circular(borderradius ?? 14)),
        ),
        
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? const Color(0xFF949494), width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderradius ?? 14)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderradius ?? 14)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(borderradius ?? 14)),
        ),
        labelText: isRequired && labelText != null ? '$labelText *' : labelText,
        labelStyle: labelTextStyle ?? AppTextStyles.textStyle_400_14,
        hintText: hint,
        hintStyle: hintStyle ?? AppTextStyles.textStyle_400_14,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        suffixIcon:isdropDown
                        ? const Icon(Icons.keyboard_arrow_down_rounded): (showIconButton ?? false)
            ? IconButton(
                icon: Icon(suffixIcon, color: suffixIconClr),
                onPressed: onSuffixIconPressed,
              )
            : (suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: suffixIconClr,
                  )
                : null),
        suffixText: suffixText,
        helperText: helperText,
        prefixText: prefixText, 
        prefixIcon: prefixIcon,       
        counterText: "", // Hide counter text that appears when maxLength is set
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
