
// import 'package:easyfy_care_patient/app.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'core/network/notification_services.dart';


// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

// void main()async {
//     WidgetsFlutterBinding.ensureInitialized();
//     _initializeNotifications();
//      await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,

//   );
//    // Initialize notification service
//   final NotificationService notificationService = NotificationService();
//   await notificationService.init();

//   serviceLocator();
//   runApp(const MyApp());
// }

// void _initializeNotifications() {
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//   InitializationSettings(android: initializationSettingsAndroid);
//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
