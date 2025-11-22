// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomChoiceChipRow extends StatelessWidget {
//   final List<String> options;
//   final String selectedValue;
//   final Function(String) onSelected;
//   final MainAxisAlignment alignment;
//   final bool isExpanded;

//   const CustomChoiceChipRow({
//     super.key,
//     required this.options,
//     required this.selectedValue,
//     required this.onSelected,
//     this.alignment = MainAxisAlignment.start,
//     this.isExpanded = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: isExpanded ? alignment:MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.max,
//       children: List.generate(options.length * 2 - 1, (index) {
//         if (index.isOdd) {
//           return const SizedBox(width: 11); 
//         } else {
//           final g = options[index ~/ 2];
//           final isSelected = selectedValue == g;
//  final chip = InkWell(
//           onTap: () => onSelected(g),
//           borderRadius: BorderRadius.circular(12),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               gradient: isSelected ? buttonColor : null,
//               color: isSelected ? null : Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: isSelected ? Colors.transparent : textborderClr,
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 g,
//                 style: AppTextStyles.textStyle_500_14.copyWith(
//                   color: isSelected ? Colors.white : grey2Clr,
//                 ),
//               ),
//             ),
//           ),
//         );
//           return isExpanded ? Expanded(child: chip) : chip;
//         }
//       }),
//     );
//   }
// }
