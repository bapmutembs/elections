import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TextEditingController datePickerController = TextEditingController();

ShowDatePicker({required BuildContext context}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    lastDate: DateTime.now(),
    firstDate: DateTime(1880),
    initialDate: DateTime.now(),
  );
  if (pickedDate == null) return;
  datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
}