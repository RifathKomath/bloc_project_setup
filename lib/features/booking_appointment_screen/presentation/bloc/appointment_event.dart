// part of 'appointment_bloc.dart';

// abstract class AppointmentEvent extends Equatable {
//   const AppointmentEvent();

//   @override
//   List<Object?> get props => [];
// }

// class SelectServiceEvent extends AppointmentEvent {
//   final String service;
//   const SelectServiceEvent(this.service);

//   @override
//   List<Object?> get props => [service];
// }

// class SelectDateEvent extends AppointmentEvent {
//   final DateTime date;
//   const SelectDateEvent(this.date);

//   @override
//   List<Object?> get props => [date];
// }

// class SelectTimeSlotEvent extends AppointmentEvent {
//   final String timeSlot;
//   const SelectTimeSlotEvent(this.timeSlot);

//   @override
//   List<Object?> get props => [timeSlot];
// }

// class BackToServiceSelectionEvent extends AppointmentEvent {
//   const BackToServiceSelectionEvent();
// }

// class ConfirmAppointmentEvent extends AppointmentEvent {
//   const ConfirmAppointmentEvent();
// }

// class CenterLisingEvent extends AppointmentEvent {
//   const CenterLisingEvent();
// }

// class ToggleAreaDropdownEvent extends AppointmentEvent {
//   final bool show;
//   const ToggleAreaDropdownEvent(this.show);

//   @override
//   List<Object?> get props => [show];
// }

// // Location-related events
// class SetLocationLoadingEvent extends AppointmentEvent {
//   final bool isLoading;
//   const SetLocationLoadingEvent(this.isLoading);

//   @override
//   List<Object?> get props => [isLoading];
// }

// class SetCurrentLocationEvent extends AppointmentEvent {
//   final LatLng location;
//   final String address;
//   const SetCurrentLocationEvent({required this.location, required this.address});

//   @override
//   List<Object?> get props => [location, address];
// }

// class ToggleMapViewEvent extends AppointmentEvent {
//   final bool showMap;
//   const ToggleMapViewEvent(this.showMap);

//   @override
//   List<Object?> get props => [showMap];
// }

// class SetLocationEvent extends AppointmentEvent {
//   final LatLng location;
//   final String address;
//   const SetLocationEvent({required this.location, required this.address});

//   @override
//   List<Object?> get props => [location, address];
// }

// class SetLocationErrorEvent extends AppointmentEvent {
//   final String error;
//   const SetLocationErrorEvent(this.error);

//   @override
//   List<Object?> get props => [error];
// }

// class SetMapControllerEvent extends AppointmentEvent {
//   final GoogleMapController controller;
//   const SetMapControllerEvent(this.controller);

//   @override
//   List<Object?> get props => [controller];
// }

// class ClearLocationErrorEvent extends AppointmentEvent {
//   const ClearLocationErrorEvent();
// }

// // Search-related events
// class SetSearchLoadingEvent extends AppointmentEvent {
//   final bool isLoading;
//   const SetSearchLoadingEvent(this.isLoading);

//   @override
//   List<Object?> get props => [isLoading];
// }

// class SetSearchResultsEvent extends AppointmentEvent {
//   final List<Map<String, dynamic>> results;
//   const SetSearchResultsEvent(this.results);

//   @override
//   List<Object?> get props => [results];
// }

// class ClearSearchResultsEvent extends AppointmentEvent {
//   const ClearSearchResultsEvent();
// }