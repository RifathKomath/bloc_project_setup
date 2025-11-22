
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart'; 
// import '../../../../core/constants/colors.dart';
// import '../../../../core/constants/strings.dart';
// import '../../../../core/constants/style.dart';
// import '../../../call_screen/presentation/screen/call_screen.dart';
 
// class ChatDetailPage extends StatefulWidget {
//   final String name;
//   ChatDetailPage({super.key, required this.name});
 
//   @override
//   State<ChatDetailPage> createState() => _ChatDetailPageState();
// }
 
// class _ChatDetailPageState extends State<ChatDetailPage> {
//   final List<ChatMessage> messages = [
//     ChatMessage(
//       imgLink: AppStrings.xrayDummy,
//       message: 'Look at the X ray that came from your visit',
//       isSender: true,
//       type: MessageType.image,
//       time: '16:46',
//       timestamp: DateTime.now().subtract(Duration(days: 2)),
//     ),
//     ChatMessage(
//       message: "Can I come over?",
//       isSender: true,
//       type: MessageType.text,
//       time: "16:46",
//       timestamp: DateTime.now().subtract(Duration(days: 1)),
//     ),
//     ChatMessage(
//       message: "Of course, let me know...",
//       isSender: false,
//       type: MessageType.text,
//       time: "09:13",
//       timestamp: DateTime.now().subtract(Duration(minutes: 2)),
//     ),
//     ChatMessage(
//       message: "Of course, let me know...",
//       isSender: false,
//       type: MessageType.voice,
//       time: "09:45",
//       timestamp: DateTime.now().subtract(Duration(minutes: 1)),
//     ),
//     ChatMessage(
//       message: "Good morning, did you sleep well?",
//       isSender: true,
//       type: MessageType.text,
//       time: "09:45",
//       timestamp: DateTime.now().subtract(Duration(minutes: 1)),
//     ),
//     // Add more...
//   ];
//   final TextEditingController _controller = TextEditingController();
//   Map<String, List<ChatMessage>> groupMessagesByDate(
//     List<ChatMessage> messages,
//   ) {
//     Map<String, List<ChatMessage>> grouped = {};
 
//     for (var message in messages) {
//       final dateKey = _formatDate(
//         message.timestamp,
//       ); // 'Today', 'Yesterday', or 'Apr 17, 2025'
//       grouped.putIfAbsent(dateKey, () => []).add(message);
//     }
 
//     return grouped;
//   }
 
//   String _formatDate(DateTime date) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final messageDate = DateTime(date.year, date.month, date.day);
 
//     if (messageDate == today) return 'Today';
//     if (messageDate == today.subtract(Duration(days: 1)))
//       return 'Yesterday';
//     else {
//       final weekday = _getWeekdayName(messageDate.weekday);
//       final formatted =
//           "${_formatNumber(messageDate.day)}/${_formatNumber(messageDate.month)}";
//       return "$weekday, $formatted"; // Example: Sat, 17/10
//     }
//     // return '${date.day}/${date.month}/${date.year}';
//   }
 
//   String _getWeekdayName(int weekday) {
//     const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
//     return days[(weekday - 1) % 7];
//   }
 
//   String _formatNumber(int number) {
//     return number < 10 ? '0$number' : '$number';
//   }
 
//   String getCurrentTime() {
//     final now = DateTime.now();
//     final formatter = DateFormat('HH:mm'); // 'HH' for 24-hour format
//     return formatter.format(now);
//   }
 
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       final newMessage = ChatMessage(
//         message: _controller.text,
//         isSender: false,
//         type: MessageType.text,
//         time: getCurrentTime(),
//         timestamp: DateTime.now(),
//       );
 
//       setState(() {
//         messages.add(newMessage);
//       });
 
//       _controller.clear(); // Clear the input field
//     }
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     final groupedMessages = groupMessagesByDate(messages);
//     return Scaffold(
//       backgroundColor: textFieldBg,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, size: 24),
//           color: Colors.black,
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           widget.name,
//           style: AppTextStyles.textStyle_500_14.copyWith(color: textBlack,fontSize: 18),
//         ),
//         actions: [
//           SvgPicture.asset(AppStrings.videoIcon),
//           8.wBox,
//           GestureDetector(
//             onTap: () {
//               open(context, CallScreen());
//             },
//             child: SvgPicture.asset(AppStrings.phoneIcon)),
//           8.wBox,
//           Icon(Icons.more_vert, color: Colors.black),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               separatorBuilder: (context, index) => 12.hBox,
//               itemCount: groupedMessages.keys.length,
//               itemBuilder: (context, index) {
//                 final date = groupedMessages.keys.elementAt(index);
//                 final dayMessages = groupedMessages[date]!;
//                 final msg = messages[index];
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Divider(color: bgColorChat, thickness: 1),
//                         ),
//                         16.wBox,
//                         Text(
//                           date,
//                           style: AppTextStyles.textStyle_400_14.copyWith(
//                             color: lightGreyText,fontSize: 12
//                           ),
//                         ),
//                         16.wBox,
//                         Expanded(
//                           child: Divider(color: bgColorChat, thickness: 1),
//                         ),
//                       ],
//                     ),
 
//                     // Messages for the Day
//                     ...dayMessages.map((msg) {
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 12.0),
//                         child: ChatBubble(chatMessage: msg),
//                       );
//                     }).toList(),
//                   ],
//                 );
//               },
//             ),
//           ),
//           ChatInputField(controller: _controller, onSend: _sendMessage),
//         ],
//       ),
//     );
//   }
// }
 
// class ChatBubble extends StatelessWidget {
//   final ChatMessage chatMessage;
//   const ChatBubble({super.key, required this.chatMessage});
 
//   @override
//   Widget build(BuildContext context) {
//     final isSender = chatMessage.isSender;
//     final alignment =
//         chatMessage.isSender ? Alignment.centerLeft : Alignment.centerRight;
//     final color = !isSender ? blueTextClr : Colors.white;
//     final textColor = !isSender ? Colors.white : textBlack;
//     Widget bubbleChild;
//     switch (chatMessage.type) {
//       case MessageType.text:
//         bubbleChild = Text(
//           chatMessage.message,
//           style: AppTextStyles.textStyle_400_14.copyWith(color: textColor),
//         );
//         break;
//       case MessageType.image:
//         bubbleChild = SizedBox(
//           width: MediaQuery.of(context).size.width * 0.5,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.asset(
//                   chatMessage.imgLink,
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               4.hBox,
//               Text(
//                 chatMessage.message,
//                 style: AppTextStyles.textStyle_400_14.copyWith(
//                   color: textColor,
//                 ),
//               ),
//             ],
//           ),
//         );
//         break;
//       case MessageType.voice:
//         bubbleChild = Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.play_arrow, color: textColor),
//             8.wBox,
//             Text(
//               '0:20',
//               style: AppTextStyles.textStyle_400_14.copyWith(color: textColor),
//             ),
//           ],
//         );
//         break;
//     }
//     return Align(
//       alignment: alignment,
//       child: Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//             bottomLeft: !isSender ? Radius.circular(16) : Radius.zero,
//             bottomRight: isSender ? Radius.circular(16) : Radius.zero,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment:
//               !isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             bubbleChild,
//             4.hBox,
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   chatMessage.time,
//                   style: AppTextStyles.textStyle_400_14.copyWith(
//                     color: isSender ? lightGreyText : Colors.white,fontSize: 10
//                   ),
//                 ),
//                 if (!isSender)
//                   Text(
//                     ' · Read',
//                     style: AppTextStyles.textStyle_400_14.copyWith(
//                       color: isSender ? lightGreyText : Colors.white,fontSize: 10
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ).paddingAll(10),
//       ),
//     );
//   }
// }
 
// class ChatMessage {
//   final String imgLink;
//   final String message;
//   final bool isSender;
//   final MessageType type;
//   final String time;
//   final DateTime timestamp;
 
//   ChatMessage({
//     this.imgLink = '',
//     required this.message,
//     required this.isSender,
//     required this.type,
//     required this.time,
//     required this.timestamp,
//   });
// }
 
// enum MessageType { text, image, voice }
 
// class ChatInputField extends StatelessWidget {
//   final TextEditingController controller;
//   final VoidCallback onSend;
//   ChatInputField({required this.controller, required this.onSend});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       color: Colors.white,
//       child: Row(
//         children: [
//           Icon(Icons.add, color: lightGreyText),
//           Expanded(
//             child: SizedBox(
//               height: 36,
//               child: TextField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: textFieldBg,
//                   hintText: "Type a message",
//                   // border: InputBorder.none,
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           GestureDetector(
//             onTap: onSend,
//             child: SvgPicture.asset(AppStrings.sendIcon),
//           ),
//         ],
//       ),
//     );
//   }
// }