// import 'package:bloc/bloc.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/domain/usecases/book_appointment_usecases.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/bloc/appointment_state.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// part 'appointment_event.dart';

// class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
//   final BookAppointmentUsecases usecases;

//   AppointmentBloc({required this.usecases})
//       : super(const AppointmentInitial()) {
//     // Basic appointment events
//     on<SelectServiceEvent>(_onSelectService);
//     on<SelectDateEvent>(_onSelectDate);
//     on<SelectTimeSlotEvent>(_onSelectTimeSlot);
//     on<BackToServiceSelectionEvent>(_onBackToServiceSelection);
//     on<ConfirmAppointmentEvent>(_onConfirmAppointment);
//     on<CenterLisingEvent>(centerListing);
//     on<ToggleAreaDropdownEvent>(_onToggleAreaDropdown);
    
//     // Location-related event handlers
//     on<SetLocationLoadingEvent>(_onSetLocationLoading);
//     on<SetCurrentLocationEvent>(_onSetCurrentLocation);
//     on<ToggleMapViewEvent>(_onToggleMapView);
//     on<SetLocationEvent>(_onSetLocation);
//     on<SetLocationErrorEvent>(_onSetLocationError);
//     on<SetMapControllerEvent>(_onSetMapController);
//     on<ClearLocationErrorEvent>(_onClearLocationError);
    
//     // Search-related event handlers
//     on<SetSearchLoadingEvent>(_onSetSearchLoading);
//     on<SetSearchResultsEvent>(_onSetSearchResults);
//     on<ClearSearchResultsEvent>(_onClearSearchResults);
//   }

//   // Basic appointment event handlers
//   void _onSelectService(
//       SelectServiceEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(service: event.service));
//   }

//   void _onSelectDate(SelectDateEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(selectedDate: event.date));
//   }

//   void _onSelectTimeSlot(
//       SelectTimeSlotEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(selectedTimeSlot: event.timeSlot));
//   }

//   void _onBackToServiceSelection(
//       BackToServiceSelectionEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(
//         selectedDate: null, selectedTimeSlot: null, service: null));
//   }

//   void _onToggleAreaDropdown(
//     ToggleAreaDropdownEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(showAreaDropdown: event.show));
//   }

//   void _onConfirmAppointment(
//       ConfirmAppointmentEvent event, Emitter<AppointmentState> emit) {
//     if (state.selectedDate != null &&
//         state.selectedTimeSlot != null &&
//         state.service != null) {
//       emit(state.copyWith(isSuccess: true));
//     } else {
//       emit(state.copyWith(
//           isError: true,
//           error: "Please complete all selections before confirming."));
//     }
//   }

//   void centerListing(CenterLisingEvent event, Emitter<AppointmentState> emit) async {
//     try {
//       emit(state.copyWith(isLoading: true, error: '', isError: false));

//       final centerList = await usecases.nearByTreatmentCentersListing();
//       print("USECASE RESULT DATA: ${centerList.data}");

//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: true,
//         treatmentCenterList: centerList.data,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: false,
//         isError: true,
//         error: e.toString(),
//       ));
//     }
//   }

//   // Location-related event handlers
//   void _onSetLocationLoading(
//       SetLocationLoadingEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(isLoadingLocation: event.isLoading));
//   }

//   void _onSetCurrentLocation(SetCurrentLocationEvent event, Emitter<AppointmentState> emit) {
//   final markers = <Marker>{
//     Marker(
//       markerId: const MarkerId('current_location'),
//       position: event.location,
//       infoWindow: InfoWindow(
//         title: 'Current Location',
//         snippet: event.address,
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     ),
//   };

//   emit(state.copyWith(
//     currentLocation: event.location,
//     selectedLocation: event.location,
//     selectedAddress: event.address,
//     showMap: true,
//     isLoadingLocation: false,
//     markers: markers,
//     locationError: '',
//   ));
// }

//   void _onToggleMapView(
//       ToggleMapViewEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(showMap: event.showMap));
//   }

//   void _onSetLocation(SetLocationEvent event, Emitter<AppointmentState> emit) {
//   final markers = <Marker>{
//     Marker(
//       markerId: const MarkerId('selected_location'),
//       position: event.location,
//       infoWindow: InfoWindow(
//         title: 'Selected Location',
//         snippet: event.address,
//       ),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     ),
//   };

//   emit(state.copyWith(
//     selectedLocation: event.location,
//     selectedAddress: event.address,
//     markers: markers,
//     locationError: '',
//     showMap: true, // Ensure map is shown when location is set
//   ));
// }

//   void _onSetLocationError(
//       SetLocationErrorEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(
//       locationError: event.error,
//       isLoadingLocation: false,
//     ));
//   }

//   void _onSetMapController(
//       SetMapControllerEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(mapController: event.controller));
//   }

//   void _onClearLocationError(
//       ClearLocationErrorEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(locationError: ''));
//   }

//   // Search-related event handlers
//   void _onSetSearchLoading(
//       SetSearchLoadingEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(isSearching: event.isLoading));
//   }

//   void _onSetSearchResults(
//       SetSearchResultsEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(
//       searchResults: event.results,
//       isSearching: false,
//     ));
//   }

//   void _onClearSearchResults(
//       ClearSearchResultsEvent event, Emitter<AppointmentState> emit) {
//     emit(state.copyWith(
//       searchResults: const [],
//       isSearching: false,
//     ));
//   }


 
// }