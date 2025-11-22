
// import 'dart:io';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';

// class CommonTextField extends StatelessWidget {
//   final String? label;
//   final String hint;
//   final TextInputType? keyboardType;
//   final void Function(String)? onChanged;
//   final TextEditingController? controller;
//   final bool readOnly;
//   final VoidCallback? onTap;
//   final Widget? suffixIcon;
//   final Color? borderColor;
//   final double? radius;
//   final TextStyle? hintStyle;
//   final TextStyle? labelStyle;
//   final FocusNode? focusNode;
//   final bool? isborder;
//   final List<TextInputFormatter>? inputFormatters;
//   final int? maxLength;
//   final int? maxline;
//   final String? Function(String?)? validator;

//   const CommonTextField({
//     super.key,
//      this.label,
//     required this.hint,
//     this.keyboardType,
//     this.focusNode,
//     this.onChanged,
//     this.controller,
//     this.readOnly = false,
//     this.onTap,
//     this.suffixIcon,
//     this.borderColor,
//     this.radius,
//     this.hintStyle,
//     this.labelStyle,
//     this.isborder,
//     this.inputFormatters,
//     this.maxLength,
//     this.maxline,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isIOS = Platform.isIOS;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//       label!=null?  Text(
//           label!,
//           style: labelStyle ??
//               AppTextStyles.textStyle_500_14.copyWith(color: blackTextClr),
//         ):0.hBox,
//            label!=null?  const SizedBox(height: 8):0.hBox,
//         isIOS ? _buildCupertinoTextField(context) : _buildMaterialTextField(),
//       ],
//     );
//   }

//   Widget _buildMaterialTextField() {
//     return TextFormField(
//       keyboardType: keyboardType,
//       onChanged: onChanged,
//       controller: controller,
//       validator: validator,
//       readOnly: readOnly,
//       maxLines: maxline,
//       focusNode: focusNode,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onTap: onTap,
//       inputFormatters: inputFormatters,
//       textInputAction: TextInputAction.done,
//       maxLength: maxLength,
//       style: AppTextStyles.textStyle_500_16,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: hintStyle ??
//             AppTextStyles.textStyle_500_14.copyWith(color: grey2Clr),
//         suffixIcon: suffixIcon,
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//         filled: isborder == null ? true : false,
//         fillColor: isborder == null ? bgColor : null,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius ?? 12)),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius ?? 12),
//           borderSide:
//               isborder == null ? BorderSide.none : BorderSide(color: borderClr),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius ?? 12),
//           borderSide: isborder == null
//               ? BorderSide.none
//               : BorderSide(color: borderClr, width: 1.5),
//         ),
//       ),
//     );
//   }

//   Widget _buildCupertinoTextField(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: isborder == null ? bgColor : Colors.transparent,
//         border: isborder == null ? null : Border.all(color: borderClr),
//         borderRadius: BorderRadius.circular(radius ?? 12),
//       ),
//       child: CupertinoTextField(
//         controller: controller,
//         onChanged: onChanged,
//         readOnly: readOnly,
//         onTap: onTap,
//         keyboardType: keyboardType,
//         maxLength: maxLength,
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
//         placeholder: hint,
//         placeholderStyle: hintStyle ??
//             AppTextStyles.textStyle_500_14.copyWith(color: grey2Clr),
//         style: AppTextStyles.textStyle_500_16,
//         suffix: suffixIcon,
//         inputFormatters: inputFormatters,
//         decoration: null,
//         textInputAction: TextInputAction.done,
//       ),
//     );
//   }
// }
