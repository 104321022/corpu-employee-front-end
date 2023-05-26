import 'package:reactive_forms/reactive_forms.dart';

class StaffForms {
  static const String userIdControl = 'user_id';
  static const String firstNameControl = 'first_name';
  static const String lastNameControl = 'last_name';
  static const String emailControl = 'email_name';
  static const String contactControl = 'contact_no';
  static const String detailsControl = 'details';
  static const String bioControl = 'bio';
  static const String hobbyControl = 'hobby';
  static const String fieldControl = 'field';
  static const String experienceControl = 'experience';
  static const String skillsControl = 'skills';
  static const String addressControl = 'address';

  static FormGroup get staffProfileForm => fb.group(
        {
          userIdControl: FormControl<int>(
            validators: [
              Validators.required,
            ],
          ),
          firstNameControl: FormControl<String>(
            validators: [
              Validators.required,
              Validators.pattern(r'[a-zA-Z ]'),
            ],
          ),
          lastNameControl: FormControl<String>(
            validators: [
              Validators.required,
              Validators.pattern(r'[a-zA-Z ]'),
            ],
          ),
          emailControl: FormControl<String>(
            validators: [
              Validators.required,
              Validators.email,
            ],
          ),
          contactControl: FormControl<String>(
            validators: [
              Validators.required,
              Validators.number,
              Validators.minLength(10),
              Validators.maxLength(10),
            ],
          ),
          detailsControl: fb.group(
            {
              bioControl: FormControl<String>(),
              hobbyControl: FormControl<String>(),
              experienceControl: FormControl<String>(),
              skillsControl: FormControl<String>(),
              addressControl: FormControl<String>(),
            },
          ),
        },
      );
}
