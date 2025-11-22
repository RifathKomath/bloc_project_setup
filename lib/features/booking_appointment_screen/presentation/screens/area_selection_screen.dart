// import 'package:easyfy_care_patient/core/constants/colors.dart';
// import 'package:easyfy_care_patient/core/constants/margin_extensions.dart';
// import 'package:easyfy_care_patient/core/constants/style.dart';
// import 'package:easyfy_care_patient/features/booking_appointment_screen/presentation/screens/book_appointment_screen.dart';
// import 'package:easyfy_care_patient/widgets/app_svg.dart';
// import 'package:easyfy_care_patient/widgets/common_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// import '../../../../core/utils/screen_utils.dart';
// import '../../../../widgets/apptextfield.dart';
// import '../bloc/appointment_bloc.dart';
// import '../bloc/appointment_state.dart';

// class AreaSelectionScreen extends StatelessWidget {
//   const AreaSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => GetIt.instance<AppointmentBloc>(),
//         child: BlocBuilder<AppointmentBloc, AppointmentState>(
//           builder: (context, state) {
//             return Scaffold(
//               backgroundColor: whiteText,
//               appBar: AppBar(
//                 title: Text("Enter Your Area"),
//                 automaticallyImplyLeading: false,
//                 leading: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 18.5,
//                   ),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Divider(thickness: 0.2),
//                     AppTextField(
//                       prefixIcon: Icon(Icons.search),
//                       hint: "Search and Area or Address",
//                       borderColor: textborderClr,
//                       onChanged: (value) {
//                         if (value.isNotEmpty && value.length > 2) {
//                           _searchPlace(context, value);
//                         } else if (value.isEmpty) {
//                           context.read<AppointmentBloc>().add(ClearSearchResultsEvent());
//                         }
//                       },
//                      isFilled: state.isSearching,
//                     ).paddingSymmetricHorizontal(16),
                    
//                     // Search Results
//                     if (state.searchResults.isNotEmpty) ...[
//                       10.hBox,
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 16),
//                         decoration: BoxDecoration(
//                           color: whiteText,
//                           borderRadius: BorderRadius.circular(8),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               spreadRadius: 1,
//                               blurRadius: 4,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: state.searchResults.length,
//                           itemBuilder: (context, index) {
//                             final result = state.searchResults[index];
//                             return ListTile(
//                               leading: Icon(Icons.location_on, color: primaryColor),
//                               title: Text(
//                                 result['description'] ?? '',
//                                 style: AppTextStyles.textStyle_500_14,
//                               ),
//                               onTap: () => _selectSearchResult(context, result),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
                    
//                     if (!state.showMap && state.searchResults.isEmpty) ...[
//                       Container(
//                         height: 110,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(16),
//                             bottomRight: Radius.circular(16),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: -1,
//                               blurRadius: 6,
//                               offset: const Offset(0, 5),
//                             ),
//                           ],
//                           color: whiteText,
//                         ),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () => _getCurrentLocation(context),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Row(
//                                   children: [
//                                     if (state.isLoadingLocation)
//                                       const SizedBox(
//                                         width: 20,
//                                         height: 20,
//                                         child: CircularProgressIndicator(
//                                             strokeWidth: 2),
//                                       )
//                                     else
//                                       const AppSvg(
//                                         name: "current location",
//                                       ),
//                                     10.wBox,
//                                     Text(
//                                       state.isLoadingLocation
//                                           ? "Getting Current Location..."
//                                           : "Use My Current Location",
//                                       style: AppTextStyles.textStyle_400_14,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () => _enterManually(context),
//                               child: Row(
//                                 children: [
//                                   const AppSvg(
//                                     name: "location",
//                                   ),
//                                   11.wBox,
//                                   Text(
//                                     "Enter Manually",
//                                     style: AppTextStyles.textStyle_400_14,
//                                   )
//                                 ],
//                               ).paddingSymmetricHorizontal(23),
//                             )
//                           ],
//                         ),
//                       ),
//                       100.hBox,
//                       const Center(child: AppSvg(name: "location_bg")),
//                       12.hBox,
//                       Center(
//                         child: Text(
//                           "We Need Your Location to\nShow Nearby Clinics",
//                           textAlign: TextAlign.center,
//                           style: AppTextStyles.textStyle_600_16,
//                         ),
//                       ),
//                     ],
//                     if (state.showMap) ...[
//                       SizedBox(
//   height: MediaQuery.of(context).size.height * 0.6,
//   child: GoogleMap(
//     initialCameraPosition: CameraPosition(
//       target: state.selectedLocation ?? 
//               state.currentLocation ?? 
//               const LatLng(9.9312, 76.2673), // Default to Kochi
//       zoom: 15,
//     ),
//     onMapCreated: (GoogleMapController controller) {
//       context.read<AppointmentBloc>().add(SetMapControllerEvent(controller));
      
//       // If we have a selected location, move to it immediately after map creation
//       if (state.selectedLocation != null) {
//         Future.delayed(const Duration(milliseconds: 100), () {
//           controller.animateCamera(
//             CameraUpdate.newLatLngZoom(state.selectedLocation!, 15),
//           );
//         });
//       }
//     },
//     onTap: (LatLng tappedLocation) => _onMapTap(context, tappedLocation),
//     markers: state.markers,
//     myLocationEnabled: true,
//     myLocationButtonEnabled: true,
//   ),
// ),
//                     ],
//                     if (state.locationError.isNotEmpty)
//                       Container(
//                         margin: const EdgeInsets.all(16),
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.red.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(8),
//                           border:
//                               Border.all(color: Colors.red.withOpacity(0.3)),
//                         ),
//                         child: Text(
//                           state.locationError,
//                           style: const TextStyle(color: Colors.red),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               bottomNavigationBar: (state.selectedLocation != null &&
//                       state.selectedAddress != null)
//                   ? Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             children: [
//                               const AppSvg(
//                                 name: "location",
//                               ),
//                               11.wBox,
//                               Expanded(
//                                 child: Text(
//                                   state.selectedAddress!,
//                                   style: AppTextStyles.textStyle_500_16
//                                       .copyWith(
//                                           fontSize: 16, color: blackTextClr),
//                                 ),
//                               ),
//                             ],
//                           ).paddingSymmetricHorizontal(23),
//                           10.hBox,
//                           CommonButton(
//                             label: "Confirm & Proceed",
//                             onTap: () => _confirmLocation(context),
//                           ),
//                         ],
//                       ),
//                     )
//                   : null,
//             );
//           },
//         ));
//   }

//   Future<void> _searchPlace(BuildContext context, String query) async {
//     context.read<AppointmentBloc>().add(SetSearchLoadingEvent(true));
    
//     try {
//       // Use geocoding to search for places
//       List<Location> locations = await locationFromAddress(query);
      
//       if (locations.isNotEmpty) {
//         List<Map<String, dynamic>> results = [];
        
//         for (Location location in locations.take(5)) { // Limit to 5 results
//           try {
//             // Get address details for each location
//             List<Placemark> placemarks = await placemarkFromCoordinates(
//               location.latitude,
//               location.longitude,
//             );
            
//             if (placemarks.isNotEmpty) {
//               Placemark placemark = placemarks.first;
//               String description = '';
              
//               if (placemark.street?.isNotEmpty == true) {
//                 description += placemark.street!;
//               }
//               if (placemark.locality?.isNotEmpty == true) {
//                 description += description.isNotEmpty ? ', ${placemark.locality}' : placemark.locality!;
//               }
//               if (placemark.administrativeArea?.isNotEmpty == true) {
//                 description += description.isNotEmpty ? ', ${placemark.administrativeArea}' : placemark.administrativeArea!;
//               }
//               if (placemark.country?.isNotEmpty == true) {
//                 description += description.isNotEmpty ? ', ${placemark.country}' : placemark.country!;
//               }
              
//               results.add({
//                 'description': description.isNotEmpty ? description : query,
//                 'latitude': location.latitude,
//                 'longitude': location.longitude,
//                 'placemark': placemark,
//               });
//             }
//           } catch (e) {
//             // If reverse geocoding fails, still add the location with query as description
//             results.add({
//               'description': query,
//               'latitude': location.latitude,
//               'longitude': location.longitude,
//             });
//           }
//         }
        
//         context.read<AppointmentBloc>().add(SetSearchResultsEvent(results));
//       } else {
//         context.read<AppointmentBloc>().add(SetSearchResultsEvent([]));
//       }
//     } catch (e) {
//       // context.read<AppointmentBloc>().add(SetLocationErrorEvent('Search failed: ${e.toString()}'));
//       context.read<AppointmentBloc>().add(SetSearchResultsEvent([]));
//     }
    
//     context.read<AppointmentBloc>().add(SetSearchLoadingEvent(false));
//   }

//   Future<void> _selectSearchResult(BuildContext context, Map<String, dynamic> result) async {
//   final latitude = result['latitude'] as double;
//   final longitude = result['longitude'] as double;
//   final description = result['description'] as String;
  
//   final selectedLocation = LatLng(latitude, longitude);
  
//   // Clear search results first
//   context.read<AppointmentBloc>().add(ClearSearchResultsEvent());
  
//   // Show map and set the selected location
//   context.read<AppointmentBloc>().add(ToggleMapViewEvent(true));
//   context.read<AppointmentBloc>().add(SetLocationEvent(
//     location: selectedLocation,
//     address: description,
//   ));
  
//   // Wait a bit for the map to be created, then move camera
//   Future.delayed(const Duration(milliseconds: 300), () async {
//     final currentState = context.read<AppointmentBloc>().state;
//     if (currentState.mapController != null) {
//       await currentState.mapController!.animateCamera(
//         CameraUpdate.newLatLngZoom(selectedLocation, 15),
//       );
//       _moveMapToLocation(context, selectedLocation);
//     }
//   });
// }
// void _moveMapToLocation(BuildContext context, LatLng location) {
//   final mapController = context.read<AppointmentBloc>().state.mapController;
//   if (mapController != null) {
//     mapController.animateCamera(
//       CameraUpdate.newLatLngZoom(location, 15),
//     );
//   }
// }

//   Future<void> _getCurrentLocation(BuildContext context) async {
//     context.read<AppointmentBloc>().add(SetLocationLoadingEvent(true));

//     try {
//       // Check location permission
//       LocationPermission permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           throw Exception('Location permissions are denied');
//         }
//       }

//       if (permission == LocationPermission.deniedForever) {
//         throw Exception('Location permissions are permanently denied');
//       }

//       // Get current position
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       LatLng currentLatLng = LatLng(position.latitude, position.longitude);

//       // Get address from coordinates
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );

//       String address = '';
//       if (placemarks.isNotEmpty) {
//         Placemark placemark = placemarks.first;
//         address =
//             '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}';
//       }

//       // Update bloc state
//       context.read<AppointmentBloc>().add(SetCurrentLocationEvent(
//             location: currentLatLng,
//             address: address,
//           ));
//     } catch (e) {
//       context.read<AppointmentBloc>().add(SetLocationErrorEvent(e.toString()));
//     }
//   }

//   void _enterManually(BuildContext context) {
//     context.read<AppointmentBloc>().add(ToggleMapViewEvent(true));
//   }

//   Future<void> _onMapTap(BuildContext context, LatLng tappedLocation) async {
//     try {
//       // Get address from tapped coordinates
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         tappedLocation.latitude,
//         tappedLocation.longitude,
//       );

//       String address = '';
//       if (placemarks.isNotEmpty) {
//         Placemark placemark = placemarks.first;
//         address =
//             '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}';
//       }

//       context.read<AppointmentBloc>().add(SetLocationEvent(
//             location: tappedLocation,
//             address: address,
//           ));
//     } catch (e) {
//       context.read<AppointmentBloc>().add(
//           SetLocationErrorEvent('Failed to get address for selected location'));
//     }
//   }

//   void _confirmLocation(BuildContext context) {
//     final state = context.read<AppointmentBloc>().state;
//     if (state.selectedLocation != null && state.selectedAddress != null) {
//       open(context, BookAppointmentScreen());
      
//       // Navigate back with location data or handle confirmation
//       // Navigator.pop(context, {
//       //   'location': state.selectedLocation,
//       //   'address': state.selectedAddress,
//       // });
//     }
//   }
// }