import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/signin/cubit/sign_in_cubit.dart';
import 'package:tasky/features/signin/cubit/sign_in_state.dart';
import 'package:tasky/features/signin/data/models/signIn_request.dart';

class SignUpButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController yearsOfExperienceController;
  final TextEditingController experienceLevelController;
  final TextEditingController addressController;

  const SignUpButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.passwordController,
    required this.yearsOfExperienceController,
    required this.experienceLevelController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          // Show a loading indicator
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signing up...')),
          );
        } else if (state is SignInSuccess) {
          // Show success message and navigate
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sign Up sucssefuly, ${state.response.displayName}! Now go and login ',
              ),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to home app screen
        } else if (state is SignInFailure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (formKey.currentState!.validate()) {
              final signInCubit = context.read<SignInCubit>();

              final signinRequest = SigninRequest(
                phone: nameController.text,
                password: passwordController.text,
                displayName: nameController.text,
                experienceYears:
                    int.tryParse(yearsOfExperienceController.text) ?? 0,
                address: addressController.text,
                level: experienceLevelController.text,
              );

              signInCubit.signIn(signinRequest);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Please fill all required fields correctly.')),
              );
            }
          },
          child: Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManger.primaryColor,
            ),
            child: Center(
              child: state is SignInLoading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      'Sign Up',
                      style: CustomstextStyels.font15White700Wight,
                    ),
            ),
          ),
        );
      },
    );
  }
}
