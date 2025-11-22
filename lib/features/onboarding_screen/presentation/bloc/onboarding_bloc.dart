

// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/bloc/onboarding_event.dart';
// import 'package:easyfy_care_patient/features/onboarding_screen/presentation/bloc/onboarding_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'dart:async';

// class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
//   Timer? _timer;

//   OnboardingBloc()
//       : super(OnboardingState(currentPage: 0, isNextClicked: false)) {
//     on<OnboardingPageChanged>((event, emit) {
//       emit(OnboardingState(
//         currentPage: event.page,
//         isNextClicked: state.isNextClicked,
//       ));
//     });

//     on<IsNextClicked>((event, emit) {
//       emit(OnboardingState(
//         currentPage: state.currentPage,
//         isNextClicked: event.isclicked,
//       ));
//     });


//     on<AutoSlidePage>((event, emit) {
//       final nextPage = (state.currentPage + 1) % 2; 
//       emit(OnboardingState(
//         currentPage: nextPage,
//         isNextClicked: state.isNextClicked,
//       ));
//     });

  
//     _startAutoSlide();
//   }

//   void _startAutoSlide() {
//     _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       add(AutoSlidePage());
//     });
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }
