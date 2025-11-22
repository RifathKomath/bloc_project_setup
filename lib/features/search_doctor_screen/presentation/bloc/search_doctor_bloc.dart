// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../../domain/usecase/doctor_usecase.dart';
// import 'search_doctor_state.dart';

// part 'search_doctor_event.dart';

// class SearchDoctorBloc extends Bloc<SearchDoctorEvent, SearchDoctorState> {
//   final DoctorUsecase doctorUsecase;
//   SearchDoctorBloc({required this.doctorUsecase})
//       : super(const SearchDoctorState()) {

//     on<FetchDoctorsEvent>(_fetchDoctors);
//     on<SearchDoctorsEvent>(_searchDoctors);
//     on<UpdateStatusEvent>(_updateStatus);
//     on<AllocateDoctorEvent>(_allocateDoctor);

//   }
//   Future<void> _fetchDoctors(
//       FetchDoctorsEvent event, Emitter<SearchDoctorState> emit) async {
//     try {
//       emit(state.copyWith(isLoading: true, error: ''));

//       final doctorList = await doctorUsecase.getDoctor(status: state.status);

//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: true,
//         doctorList: doctorList.data,
//         filteredDoctors: doctorList.data,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         isLoading: false,
//         isSuccess: false,
//         error: e.toString(),
//       ));
//     }
//   }

//   Future<void> _searchDoctors(
//       SearchDoctorsEvent event, Emitter<SearchDoctorState> emit) async {
//     try {
//       final query = event.query.toLowerCase();

//       // Only update search query without filtering if no doctors loaded yet
//       if (state.doctorList == null) {
//         emit(state.copyWith(searchQuery: query));
//         return;
//       }

//       if (query.isEmpty) {
//         emit(state.copyWith(
//           searchQuery: query,
//           filteredDoctors: state.doctorList!,
//         ));
//       } else {
//         final filteredDoctors = state.doctorList!.where((doctor) {
//           final doctorName = doctor.fullName?.toLowerCase() ?? '';

//           return doctorName.contains(query);
//         }).toList();

//         emit(state.copyWith(
//           searchQuery: query,
//           filteredDoctors: filteredDoctors,
//         ));
//       }
//     } catch (e) {
//       emit(state.copyWith(error: e.toString()));
//     }
//   }

//   Future<void> _updateStatus(
//       UpdateStatusEvent event, Emitter<SearchDoctorState> emit) async {
//     emit(state.copyWith(status: event.status));
//     add(FetchDoctorsEvent());
//   }

//   Future<void> _allocateDoctor(
//       AllocateDoctorEvent event, Emitter<SearchDoctorState> emit) async {
//     try {
//       emit(state.copyWith(
//           isAllocating: true, allocationError: '', isAllocationSuccess: false));

//       final response =
//           await doctorUsecase.allocateDoctor(doctorId: event.doctorId,);


//           if(response.success==true){
//              emit(state.copyWith(
//         isAllocating: false,
//         isAllocationSuccess: true,
//         allocationData: response,
//         allocationError: '',
//       ));

//           }else{
//              emit(state.copyWith(
//         isAllocating: false,
//         isAllocationSuccess: false,
//         allocationError: response.message,
//       ));

//           }

     
//     } catch (e) {
//       emit(state.copyWith(
//         isAllocating: false,
//         isAllocationSuccess: false,
//         allocationError: "Error in allocation ",
//       ));
//     }
//   }
// }
