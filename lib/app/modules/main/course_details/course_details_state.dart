part of 'course_details_cubit.dart';

class CourseDetailsState extends Equatable {
  const CourseDetailsState({
    this.loading = false,
    this.message = '',
    this.apiResponseStatus,
    this.userType,
  });

  final bool loading;
  final String message;
  final ApiResponseStatus? apiResponseStatus;
  final String? userType;

  @override
  List<Object?> get props => [
        loading,
        message,
        apiResponseStatus,
        userType,
      ];

  CourseDetailsState copyWith({
    bool? loading,
    String? message,
    ApiResponseStatus? apiResponseStatus,
    String? userType,
  }) {
    return CourseDetailsState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      userType: userType ?? this.userType,
    );
  }
}
