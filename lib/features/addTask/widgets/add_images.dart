import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/core/styles/color_manger.dart';
import 'package:tasky/core/styles/text_styles.dart';

class AddImages extends StatefulWidget {
  const AddImages({
    super.key,
  });

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  File? _selectedImage;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      } else {
        // User canceled the picker
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: DottedBorder(
        color: ColorsManger.primaryColor,
        strokeWidth: 2,
        dashPattern: [3, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        child: GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _selectedImage != null
                    ? SizedBox(
                        child: Image.file(
                        _selectedImage!,
                      ))
                    : Image.asset('assets/images/png/image.png'),
                SizedBox(
                  width: 5.0,
                ),
                _selectedImage != null
                    ? SizedBox()
                    : Text(
                        'Add Img',
                        style: CustomstextStyels.font14ForMediumTasks
                            .copyWith(fontSize: 20),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
