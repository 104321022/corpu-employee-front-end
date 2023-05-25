import 'package:reactive_forms/reactive_forms.dart';

class CreateAssessmentForm {
  static String staffId = 'staff_id';
  static String employeeId = 'employee_id';
  static String courseCode = 'course_code';
  static String details = 'details';
  static String dueDate = 'due_date';
  static String question1 = 'question1';
  static String question2 = 'question2';
  static String question3 = 'question3';
  static String question4 = 'question4';
  static String question5 = 'question5';

  static FormGroup get createAssessmentForm => fb.group(
        {
          staffId: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          employeeId: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          courseCode: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          details: fb.group({
            dueDate: FormControl<String>(
              validators: [
                Validators.required,
              ],
            ),
            question1: FormControl<String>(),
            question2: FormControl<String>(),
            question3: FormControl<String>(),
            question4: FormControl<String>(),
            question5: FormControl<String>(),
          }),
        },
      );
}
