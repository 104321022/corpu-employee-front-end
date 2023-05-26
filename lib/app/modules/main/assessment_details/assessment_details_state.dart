part of 'assessment_details_cubit.dart';

class AssessmentDetailsState extends Equatable {
  const AssessmentDetailsState({
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

  AssessmentDetailsState copyWith({
    bool? loading,
    String? message,
    ApiResponseStatus? apiResponseStatus,
    String? userType,
  }) {
    return AssessmentDetailsState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      userType: userType ?? this.userType,
    );
  }
}
