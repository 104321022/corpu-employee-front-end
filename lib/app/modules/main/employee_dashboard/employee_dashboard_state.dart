part of 'employee_dashboard_cubit.dart';

class EmployeeDashboardState extends Equatable {
  const EmployeeDashboardState({
    this.loading = false,
    this.message = '',
    this.apiResponseStatus,
    this.selectedIndex = 0,
    this.currentPageTitle = '',
    this.courses,
    this.assessments,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  final bool loading;
  final String message;
  final ApiResponseStatus? apiResponseStatus;
  final int selectedIndex;
  final String currentPageTitle;
  final List? courses;
  final List? assessments;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  @override
  List<Object?> get props => [
        loading,
        message,
        apiResponseStatus,
        selectedIndex,
        currentPageTitle,
        courses,
        assessments,
        firstName,
        lastName,
        email,
        phone,
      ];

  EmployeeDashboardState copyWith({
    bool? loading,
    String? message,
    ApiResponseStatus? apiResponseStatus,
    int? selectedIndex,
    String? currentPageTitle,
    List? courses,
    List? assessments,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return EmployeeDashboardState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentPageTitle: currentPageTitle ?? this.currentPageTitle,
      courses: courses ?? this.courses,
      assessments: assessments ?? this.assessments,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
