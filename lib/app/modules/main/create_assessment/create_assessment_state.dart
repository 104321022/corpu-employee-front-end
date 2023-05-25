part of 'create_assessment_cubit.dart';

class CreateAssessmentState extends Equatable {
  const CreateAssessmentState({
    this.loading = false,
    this.message = '',
    this.apiResponseStatus,
    this.courses = const [],
    this.applicants = const [],
  });

  final bool loading;
  final String message;
  final ApiResponseStatus? apiResponseStatus;
  final List courses;
  final List applicants;

  @override
  List<Object?> get props => [
        loading,
        message,
        apiResponseStatus,
        courses,
        applicants,
      ];

  CreateAssessmentState copyWith({
    bool? loading,
    String? message,
    ApiResponseStatus? apiResponseStatus,
    List? courses,
    List? applicants,
  }) {
    return CreateAssessmentState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      courses: courses ?? this.courses,
      applicants: applicants ?? this.applicants,
    );
  }
}
