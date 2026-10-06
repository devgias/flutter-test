import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/features/user/user.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Name / email / company form shared by the add and edit pages.
///
/// The parent provides a [UserFormBloc] and decides what happens on submit.
class UserFormView extends StatefulWidget {
  final UserDetailEntity? initialUser;
  final String submitLabel;
  final void Function(UserFormEntity form) onSubmit;

  const UserFormView({
    super.key,
    this.initialUser,
    required this.submitLabel,
    required this.onSubmit,
  });

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
  static const _name = 'name';
  static const _email = 'email';
  static const _company = 'company';

  late final FormGroup _userForm;

  @override
  void initState() {
    final initialUser = widget.initialUser;

    _userForm = FormGroup({
      _name: FormControl<String>(
        value: initialUser?.name,
        validators: [Validators.required],
      ),
      _email: FormControl<String>(
        value: initialUser?.email,
        validators: [Validators.required, Validators.email],
      ),
      _company: FormControl<String>(value: initialUser?.company),
    });

    super.initState();
  }

  @override
  void dispose() {
    _userForm.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_userForm.valid) {
      _userForm.markAllAsTouched();

      return;
    }

    widget.onSubmit(
      UserFormEntity(
        name: _userForm.control(_name).value as String,
        email: _userForm.control(_email).value as String,
        company: _userForm.control(_company).value as String?,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final initialUser = widget.initialUser;

    return ReactiveForm(
      formGroup: _userForm,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          _UserFormHeader(user: initialUser),
          const Gap(32),
          const CustomTextField.reactive(
            formControlName: _name,
            label: 'Name',
            hintText: 'e.g. Tom Preston-Werner',
            prefixIcon: Icon(Icons.person_outline_rounded),
            textInputAction: TextInputAction.next,
          ),
          const Gap(20),
          const CustomTextField.reactive(
            formControlName: _email,
            label: 'Email',
            hintText: 'e.g. tom@mojombo.com',
            prefixIcon: Icon(Icons.alternate_email_rounded),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const Gap(20),
          const CustomTextField.reactive(
            formControlName: _company,
            label: 'Company',
            hintText: 'Optional',
            prefixIcon: Icon(Icons.business_outlined),
            textInputAction: TextInputAction.done,
          ),
          const Gap(40),
          BlocBuilder<UserFormBloc, UserFormState>(
            builder: (context, state) => CustomButton.elevated(
              isLoading: state.maybeWhen(
                orElse: () => false,
                submitting: () => true,
              ),
              icon: const Icon(Icons.check_rounded),
              label: widget.submitLabel,
              onPressed: _submit,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFormHeader extends StatelessWidget {
  final UserDetailEntity? user;

  const _UserFormHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageNetwork.avatar(
          user?.avatarUrl,
          name: user?.name ?? user?.login,
          size: 96,
        ),
        const Gap(16),
        Text(
          user == null ? 'New user' : '@${user!.login}',
          style: AppTextStyle.s16w700,
        ),
        const Gap(4),
        Text(
          user == null
              ? 'Fill in the details below'
              : 'ID ${user!.id} · ${user!.type}',
          style: AppTextStyle.s12w400.copyWith(color: AppColors.neutral400),
        ),
      ],
    );
  }
}
