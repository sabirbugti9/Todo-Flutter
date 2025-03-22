import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/login/widgets/signin_button.dart';

class EmailPasswordTextField extends StatefulWidget {
  const EmailPasswordTextField({super.key});

  @override
  State<EmailPasswordTextField> createState() => _EmailPasswordTextFieldState();
}

class _EmailPasswordTextFieldState extends State<EmailPasswordTextField> {
  bool _obscureText = true; // State for password visibility
  final _formKey = GlobalKey<FormState>(); // Form key to validate form
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Assign form key for validation
      child: Column(
        children: [
          // Phone Field
          IntlPhoneField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: '   123 456_7890 ',
              labelStyle: CustomstextStyels.font20black700Wight
                  .copyWith(fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            initialCountryCode: 'EG', // Default country code
            onChanged: (phone) {
              // Just print the complete phone number, no need to modify the controller text
              print('Complete phone number: ${phone.completeNumber}');
            },
            validator: (phone) {
              if (phone == null || phone.number.isEmpty) {
                return 'Please enter a valid phone number';
              } else if (!phone.completeNumber.startsWith('+20')) {
                return 'Phone number must start with +20';
              } else if (phone.number.length != 9) {
                return 'Phone number must be 9 digits';
              }
              return null; // Input is valid
            },
          ),

          SizedBox(height: 8.h), // Space between fields

          // Password TextField
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Password...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    _obscureText
                        ? 'assets/images/svg/eye.svg'
                        : 'assets/images/svg/eye.svg',
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },
          ),

          SizedBox(height: 30.h),

          // Login Button
          SigninButton(
            phoneontroller: _phoneController,
            passwordController: _passwordController,
          ),

          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
