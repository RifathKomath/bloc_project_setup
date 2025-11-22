// import 'package:equatable/equatable.dart';

// import '../../domain/entity/doctor_allocation_entity.dart';
// import '../../domain/entity/doctor_list_entity.dart';

// class SearchDoctorState extends Equatable {
//   final  List<DoctorEntity>? doctorList;
//   final List<DoctorEntity> filteredDoctors;
//   final String searchQuery;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isError;
//   final String error;
//   final String status;

//   // Allocation related states
//   final bool isAllocating;
//   final bool isAllocationSuccess;
//   final String allocationError;
//   final DoctorAllocationEntity? allocationData;

//   const SearchDoctorState({
//     this.doctorList,
//     this.filteredDoctors = const [],
//     this.searchQuery = '',
//     this.isLoading = false,
//     this.isError = false,
//     this.isSuccess = false,
//     this.error = '',
//     this.status = 'A',
//     this.isAllocating = false,
//     this.isAllocationSuccess = false,
//     this.allocationError = '',
//     this.allocationData,
//   });

//   SearchDoctorState copyWith({
//      List<DoctorEntity>? doctorList,
//     List<DoctorEntity>? filteredDoctors,
//     String? searchQuery,
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isError,
//     String? error,
//     String? status,
//      bool? isAllocating,
//     bool? isAllocationSuccess,
//     String? allocationError,
//     DoctorAllocationEntity? allocationData,
//   }) {
//     return SearchDoctorState(
//       doctorList: doctorList ?? this.doctorList,
//       filteredDoctors: filteredDoctors ?? this.filteredDoctors,
//       searchQuery: searchQuery ?? this.searchQuery,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       error: error ?? this.error,
//       status: status ?? this.status,
//       isError: isError ?? this.isError,
//       isAllocating: isAllocating ?? this.isAllocating,
//       isAllocationSuccess: isAllocationSuccess ?? this.isAllocationSuccess,
//       allocationError: allocationError ?? this.allocationError,
//       allocationData: allocationData ?? this.allocationData,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     doctorList,
//     filteredDoctors,
//     searchQuery,
//     isLoading,
//     isSuccess,
//     isError,
//     error,
//     status,
//       isAllocating,
//     isAllocationSuccess,
//     allocationError,
//     allocationData,
//   ];
// }