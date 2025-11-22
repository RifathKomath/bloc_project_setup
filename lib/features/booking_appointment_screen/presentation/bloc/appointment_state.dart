// import 'package:easyfy_care_patient/features/booking_appointment_screen/domain/entity/center_listing_enitity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class AppointmentState extends Equatable {
//   final DateTime? selectedDate;
//   final String? selectedTimeSlot;
//   final String? service;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isError;
//   final String error;
//   final List<CenterEntity>? treatmentCenterList;
//   final bool showAreaDropdown;

//   // Location-related fields
//   final LatLng? selectedLocation;
//   final String? selectedAddress;
//   final LatLng? currentLocation;
//   final bool showMap;
//   final bool isLoadingLocation;
//   final String locationError;
//   final Set<Marker> markers;
//   final GoogleMapController? mapController;

//   final bool isSearching;
// final List<Map<String, dynamic>> searchResults;

  

//   const AppointmentState({
//     this.selectedDate,
//     this.selectedTimeSlot,
//     this.service,
//     this.treatmentCenterList,
//     this.isLoading = false,
//     this.isSuccess = false,
//     this.isError = false,
//     this.error = "",
//     this.showAreaDropdown = false,
//      this.selectedLocation,
//     this.selectedAddress,
//     this.currentLocation,
//     this.showMap = false,
//     this.isLoadingLocation = false,
//     this.locationError = '',
//     this.markers = const {},
//     this.mapController,
//      this.isSearching = false,
//   this.searchResults = const [],
//   });

//   AppointmentState copyWith({
//     DateTime? selectedDate,
//     String? selectedTimeSlot,
//     String? service,
//     final List<CenterEntity>? treatmentCenterList,
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isError,
//     String? error,
//     bool? showAreaDropdown,
//      LatLng? selectedLocation,
//     String? selectedAddress,
//     LatLng? currentLocation,
//     bool? showMap,
//     bool? isLoadingLocation,
//     String? locationError,
//     Set<Marker>? markers,
//     GoogleMapController? mapController,
//      bool? isSearching,
//   List<Map<String, dynamic>>? searchResults,
//   }) {
//     return AppointmentState(
//       selectedDate: selectedDate ?? this.selectedDate,
//       selectedTimeSlot: selectedTimeSlot ?? this.selectedTimeSlot,
//       service: service ?? this.service,
//       isLoading: isLoading ?? this.isLoading,
//       treatmentCenterList: treatmentCenterList ?? this.treatmentCenterList,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isError: isError ?? this.isError,
//       error: error ?? this.error,
//       showAreaDropdown: showAreaDropdown ?? this.showAreaDropdown,
//       selectedLocation: selectedLocation ?? this.selectedLocation,
//       selectedAddress: selectedAddress ?? this.selectedAddress,
//       currentLocation: currentLocation ?? this.currentLocation,
//       showMap: showMap ?? this.showMap,
//       isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
//       locationError: locationError ?? this.locationError,
//       markers: markers ?? this.markers,
//       mapController: mapController ?? this.mapController,
//       isSearching: isSearching ?? this.isSearching,
//     searchResults: searchResults ?? this.searchResults,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         selectedDate,
//         selectedTimeSlot,
//         service,
//         isLoading,
//         isSuccess,
//         isError,
//         error,
//         showAreaDropdown,
//         selectedLocation,
//     selectedAddress,
//     currentLocation,
//     showMap,
//     isLoadingLocation,
//     locationError,
//     markers,
//     mapController,
//      isSearching,
//   searchResults,
//       ];
// }

// class AppointmentInitial extends AppointmentState {
//   const AppointmentInitial() : super();
// }
