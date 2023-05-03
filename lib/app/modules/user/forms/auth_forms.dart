import 'package:reactive_forms/reactive_forms.dart';

class AuthForms {
  static String emailControl = 'email';
  static String passwordControl = 'password';
  static String firstNameControl = 'first_name';
  static String lastNameControl = 'last_name';
  static String contactNoControl = 'contact_no';
  static String userTypeControl = 'user_type';

  static FormGroup get signInForm => fb.group(
        {
          emailControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          passwordControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
        },
      );

  static FormGroup get signUpForm => fb.group(
        {
          firstNameControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          lastNameControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          emailControl: FormControl<String>(
            validators: [
              Validators.email,
              Validators.required,
            ],
          ),
          contactNoControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          passwordControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
          userTypeControl: FormControl<String>(
            validators: [
              Validators.required,
            ],
          ),
        },
      );
}
