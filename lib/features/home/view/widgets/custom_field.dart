import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_x/features/home/controller/home_controller.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onTap,
  });
  final String hintText;
  final TextEditingController? controller;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: (value) {
        Get.put(HomeController()).updateSearchString(value.trim());
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
