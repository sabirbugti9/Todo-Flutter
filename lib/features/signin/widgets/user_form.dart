import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/styles/text_styles.dart';
import 'package:tasky/features/signin/widgets/sign_up_button.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _yearsofexpernce = TextEditingController();
  final TextEditingController _seniority = TextEditingController();

  bool _obscureText = true; // State for password visibility

  final List<String> _seniorityLevels = [
    'fresh',
    'junior',
    'midLevel',
    'senior'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Phone Number Field
              IntlPhoneField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: '123 456 7890',
                  labelStyle: CustomstextStyels.font20black700Wight
                      .copyWith(fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                initialCountryCode: 'EG', // Default country code
                onChanged: (phone) {
                  // Log the phone number (for debugging if needed)
                  print('Complete phone number: ${phone.completeNumber}');
                },
                onCountryChanged: (country) {
                  // Log the country change (for debugging if needed)
                  print('Country changed to: ${country.name}');
                },
                validator: (value) {
                  if (value == null || value.number.isEmpty) {
                    return 'Please enter a valid phone number';
                  } else if (!value.completeNumber.startsWith('+20')) {
                    return 'Phone number must start with +20';
                  } else if (value.number.length != 9) {
                    return 'Phone number must be 9 digits';
                  }
                  return null; // Input is valid
                },
              ),

              // Experience Field
              TextFormField(
                controller: _yearsofexpernce,
                decoration: InputDecoration(
                  labelText: 'Years of experience...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your years of experience';
                  } else if (int.tryParse(value) == null ||
                      int.parse(value) < 0) {
                    return 'Please enter a valid number of years';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Seniority Level Dropdown
              DropdownButtonFormField<String>(
                value: null, // No initial value
                items: _seniorityLevels
                    .map((level) => DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _seniority.text = value!; // Update controller
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Choose experience level',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your seniority level';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Password Field
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
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Sign-Up Button
              SignUpButton(
                formKey: _formKey,
                nameController: _nameController,
                passwordController: _passwordController,
                yearsOfExperienceController: _yearsofexpernce,
                experienceLevelController: _seniority,
                addressController: _addressController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
