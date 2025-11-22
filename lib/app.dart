// import 'package:easyfy_care_patient/config/routes.dart';
// import 'package:easyfy_care_patient/core/network/di.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/area_selection_screen.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import 'package:easyfy_care_patient/features/register_screen/presentation/bloc/reg_bloc.dart';
// import 'package:easyfy_care_patient/features/splash_screen/presentation/screens/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'core/constants/style.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>getIt<RegisterBloc>(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Easyfy Care Patient App',
//         navigatorKey: navigatorKey,
//         theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF298998)),
//             appBarTheme: AppBarTheme(
//                 color: Colors.white,
//                 centerTitle: true,
//                 titleTextStyle:
//                     AppTextStyles.textStyle_700_28.copyWith(fontSize: 16))),
//         initialRoute: '/',
//         routes: AppRoutes.routes,
//         home: SplashScreen(),
//       ),
//     );
//   }
// }
