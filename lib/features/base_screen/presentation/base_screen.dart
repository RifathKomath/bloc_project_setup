// import 'package:easyfy_care_patient/config.dart';
// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/account_screen/presentation/bloc/account_bloc.dart';
// import 'package:easyfy_care_patient/features/appointment_screen/presentation/appointment_screen.dart';
// import 'package:easyfy_care_patient/features/chat_screen/presentation/screens/chat_screen.dart';
// import 'package:easyfy_care_patient/features/home_screen/presentation/home_screen.dart';
// import 'package:easyfy_care_patient/features/more/presentation/screens/more_screen.dart';
// import 'package:easyfy_care_patient/features/payments/presentation/screens/payment_screen.dart';
// import 'package:easyfy_care_patient/features/treatments/presentation/screens/treatment_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/network/di.dart';
// import '../../../core/utils/string_utils.dart';
// import '../../../widgets/app_svg.dart';
// import '../../account_screen/presentation/screen/account_screen.dart';
// import '../../home_screen/presentation/bloc/home_bloc_bloc.dart';
// import '../../home_screen/presentation/bloc/home_bloc_event.dart';
// import '../../report_screen/presentation/screens/report_screen.dart';
// import 'bloc/base_screen_bloc.dart';

// class BaseScreen extends StatelessWidget {
//   const BaseScreen({super.key, required this.currentIndex});
//   final int currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     final List<String> icons = [
//       "home",
//       "treatments",
//       "payments",
//       "help",
//       "more"
//     ];
//     final List<Widget> screens = [
//       MultiBlocProvider(providers: [
//          BlocProvider<HomeBloc>(
//         create: (context) {
//           final bloc = getIt<HomeBloc>();
//           bloc.add(InitializeNotificationEvent());
//           bloc.add(AllocatedDoctorEvent());
//           return bloc;
//         },
        
        
//       ),
//       BlocProvider<AccountBloc>(
//         create: (context) {
//           final accountbloc = getIt<AccountBloc>();
//           accountbloc.add(LoadProfileImageEvent(patientDetails?.id ?? 0));
//           return accountbloc;
//         },)
//       ], child: HomeScreen())
//      ,
//       // AppointmentScreen(),
//       TreatmentScreen(),
//       // ReportScreen(),
//       PaymentScreen(),
//       ChatScreen(),
//       // AccountScreen(),
//       MoreScreen()
     
//     ];
//     return BlocProvider(
//       create: (context) => BaseScreenBloc(initialIndex: currentIndex),
//       child: BlocBuilder<BaseScreenBloc, BaseScreenState>(
//         builder: (context, state) {
//           final bloc = context.read<BaseScreenBloc>();
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: screens[state.currentTabIndex],
//             bottomNavigationBar: BottomNavigationBar(
//                 currentIndex: state.currentTabIndex,
//                 selectedItemColor: blueTextClr,
//                 unselectedItemColor: lightGreyClr,
//                 unselectedLabelStyle:
//                     AppTextStyles.textStyle_500_16.copyWith(fontSize: 12),
//                 showUnselectedLabels: true,
//                 backgroundColor: Colors.white,
//                 selectedLabelStyle:
//                     AppTextStyles.textStyle_700_28.copyWith(fontSize: 12),
//                 onTap: (value) {
//                   bloc.add(TabChangeEvent(value));
//                 },
//                 items: List.generate(
//                   icons.length,
//                   (index) {
//                     return BottomNavigationBarItem(
//                       icon: AppSvg(name: icons[index]),
//                       backgroundColor: Colors.white,
//                       label: icons[index].upperFirst,
//                       activeIcon: AppSvg(
//                         name: icons[index],
//                         color: blueTextClr,
//                       ),
//                     );
//                   },
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }
