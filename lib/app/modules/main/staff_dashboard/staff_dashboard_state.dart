part of 'staff_dashboard_cubit.dart';

class StaffDashboardState extends Equatable {
  const StaffDashboardState({
    this.coursesLoading = false,
    this.assessmentsLoading = false,
    this.profileLoading = false,
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
    this.editMode = false,
  });

  final bool coursesLoading;
  final bool assessmentsLoading;
  final bool profileLoading;
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
  final bool editMode;

  @override
  List<Object?> get props => [
        coursesLoading,
        assessmentsLoading,
        profileLoading,
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
        editMode,
      ];

  StaffDashboardState copyWith({
    bool? coursesLoading,
    bool? assessmentsLoading,
    bool? profileLoading,
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
    bool? editMode,
  }) {
    return StaffDashboardState(
      coursesLoading: coursesLoading ?? this.coursesLoading,
      assessmentsLoading: assessmentsLoading ?? this.assessmentsLoading,
      profileLoading: profileLoading ?? this.profileLoading,
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
      editMode: editMode ?? this.editMode,
    );
  }
}
