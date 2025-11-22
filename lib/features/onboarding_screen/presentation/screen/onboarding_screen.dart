// import 'dart:async';

// import 'package:easyfy_care_patient/core/utils/screen_utils.dart';
// import 'package:easyfy_care_patient/features/base_screen/presentation/base_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/bloc/onboarding_bloc.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/bloc/onboarding_event.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/bloc/onboarding_state.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/widgets/onboarding_page.dart';
// import 'package:easyfy_care_patient/features/otp_screen/presentation/screens/send_otp_screen.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../../../core/constants/colors.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   final ValueNotifier<double> _pageNotifier = ValueNotifier<double>(0.0);
//   Timer? autoScrollTimer; 

//   final List<Map<String, String>> pages = [
//     {
//       "image": "assets/images/doc1.png",
//       "title": "Welcome to oncology care",
//       "subtitle": "We are here to support you on your journey.",
//     },
//     {
//       "image": "assets/images/doc2.png",
//       "title": "Caring for you, every step of the way",
//       "subtitle": "Support guidance and peace of mind - all in one place.",
//     },
//   ];

//   @override
// void initState() {
//   super.initState();

//   _pageController.addListener(() {
//     _pageNotifier.value = _pageController.page ?? 0.0;
//   });
//   autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
//     final currentPage = (_pageController.page ?? 0).round();
//     final nextPage = currentPage + 1;

//     _pageController.animateToPage(
//       nextPage < pages.length ? nextPage : 0,
//       duration: const Duration(milliseconds: 600),
//       curve: Curves.easeInOut,
//     );
//   });
// }


//   @override
//   void dispose() {
//     _pageController.dispose();
//     _pageNotifier.dispose();
//     autoScrollTimer?.cancel(); 
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => OnboardingBloc(),
//       child: Scaffold(
//         body: BlocBuilder<OnboardingBloc, OnboardingState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ValueListenableBuilder<double>(
//                     valueListenable: _pageNotifier,
//                     builder: (context, currentPage, _) {
//                       return PageView.builder(
//                         controller: _pageController,
//                         physics: const BouncingScrollPhysics(),
//                         onPageChanged: (index) {
//                           context.read<OnboardingBloc>().add(OnboardingPageChanged(page: index));
//                         },
//                         itemCount: pages.length,
//                         itemBuilder: (context, index) {
//                           double pageOffset = (currentPage.isNaN) ? 0 : index - currentPage;

//                           return OnboardingPage(
//                             image: pages[index]['image']!,
//                             title: pages[index]['title']!,
//                             subtitle: pages[index]['subtitle']!,
//                             isOtpScreen: false,
//                             pageOffset: pageOffset,
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 SmoothPageIndicator(
//                   controller: _pageController,
//                   count: pages.length,
//                   effect: ExpandingDotsEffect(
//                     dotHeight: 8,
//                     dotWidth: 8,
//                     expansionFactor: 3,
//                     activeDotColor: primaryColor,
//                     dotColor: Colors.grey,
//                     spacing: 8,
//                   ),
//                 ),
//                 20.gapBox,
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CommonButton(
//                         label: 'Next',
//                         onTap: () {
//                          open(context, SendOtpScreen());
//                         },
//                       ),
//                       16.gapBox,
//                       if (!state.isNextClicked)
//                         GestureDetector(
//                           onTap: () {
//                             openAsNewPage(context, BaseScreen(currentIndex: 0));
//                           },
//                           child: const Text.rich(
//                             TextSpan(
//                               text: 'Are you an existing customer? ',
//                               style: TextStyle(color: Colors.black54),
//                               children: [
//                                 TextSpan(
//                                   text: 'Login',
//                                   style: TextStyle(
//                                     color: Color(0xFF0077B6),
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }