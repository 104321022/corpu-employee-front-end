import 'package:reactive_forms/reactive_forms.dart';

class AssessmentDetailsForms {
  static String assessmentIdControl = 'assessment_id';
  static String detailsControl = 'details';
  static String dueDate = 'due_date';
  static String statusControl = 'status';
  static String submitDateControl = 'submit_date';
  static String question1Control = 'question1';
  static String question2Control = 'question2';
  static String question3Control = 'question3';
  static String question4Control = 'question4';
  static String question5Control = 'question5';
  static String answer1Control = 'answer1';
  static String answer2Control = 'answer2';
  static String answer3Control = 'answer3';
  static String answer4Control = 'answer4';
  static String answer5Control = 'answer5';

  static FormGroup get assessmentDetailsForm => fb.group(
        {
          assessmentIdControl: FormControl<int>(
            validators: [
              Validators.required,
            ],
          ),
          detailsControl: fb.group({
            dueDate: FormControl<String>(),
            statusControl: FormControl<String>(
              validators: [
                Validators.required,
              ],
            ),
            submitDateControl: FormControl<String>(
              validators: [
                Validators.required,
              ],
            ),
            question1Control: FormControl<String>(),
            question2Control: FormControl<String>(),
            question3Control: FormControl<String>(),
            question4Control: FormControl<String>(),
            question5Control: FormControl<String>(),
            answer1Control: FormControl<String>(),
            answer2Control: FormControl<String>(),
            answer3Control: FormControl<String>(),
            answer4Control: FormControl<String>(),
            answer5Control: FormControl<String>(),
          }),
        },
      );
}
