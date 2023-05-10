part of 'employee_dashboard_cubit.dart';

class EmployeeDashboardState extends Equatable {
  const EmployeeDashboardState({
    this.loading = false,
    this.message = '',
    this.apiResponseStatus,
    this.selectedIndex = 0,
    this.currentPageTitle = '',
  });

  final bool loading;
  final String message;
  final ApiResponseStatus? apiResponseStatus;
  final int selectedIndex;
  final String currentPageTitle;

  @override
  List<Object?> get props => [
        loading,
        message,
        apiResponseStatus,
        selectedIndex,
        currentPageTitle,
      ];

  EmployeeDashboardState copyWith({
    bool? loading,
    String? message,
    ApiResponseStatus? apiResponseStatus,
    int? selectedIndex,
    String? currentPageTitle,
  }) {
    return EmployeeDashboardState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      apiResponseStatus: apiResponseStatus ?? this.apiResponseStatus,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentPageTitle: currentPageTitle ?? this.currentPageTitle,
    );
  }
}
