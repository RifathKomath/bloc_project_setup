abstract class OnboardingEvent {}

class OnboardingPageChanged extends OnboardingEvent {
  final int page;
  OnboardingPageChanged({required this.page});
}

class IsNextClicked extends OnboardingEvent {
  final bool isclicked;
  IsNextClicked({required this.isclicked});
}

class AutoSlidePage extends OnboardingEvent {}
