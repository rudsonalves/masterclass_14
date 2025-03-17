import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:responsividade/ui/home/widgets/form_text.dart';
import 'package:responsividade/ui/home/widgets/input_row.dart';

enum Sex { male, female }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sex sex = Sex.female;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final employeeIdController = TextEditingController();
  final designationController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.sizeOf(context);
    log(width.toString());

    return Material(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(vertical: 46, horizontal: 18),
            decoration: BoxDecoration(border: Border.all(width: 2)),
            child: Column(
              spacing: 18,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputRow(label: 'First name:', controller: firstNameController),
                InputRow(label: 'Last name:', controller: lastNameController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        value: Sex.male,
                        groupValue: sex,
                        title: FormText(label: 'Male'),
                        onChanged: (value) => _toggleSex(),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: RadioListTile(
                        value: Sex.female,
                        groupValue: sex,
                        title: FormText(label: 'Female'),
                        onChanged: (value) => _toggleSex(),
                      ),
                    ),
                  ],
                ),
                InputRow(
                  label: 'Employee ID:',
                  controller: employeeIdController,
                ),
                InputRow(
                  label: 'Designation:',
                  controller: designationController,
                ),
                InputRow(
                  label: 'Phone Number:',
                  controller: phoneNumberController,
                ),
                OutlinedButton(
                  onPressed: _submit,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: FormText(label: 'Submit'),
                ),
              ],
            ),
          ),
          Positioned(
            top: 3,
            left: 42,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              color: colorScheme.onPrimary,
              child: Center(child: FormText(label: 'Employee Details')),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSex() {
    setState(() {
      sex = (sex == Sex.male) ? Sex.female : Sex.male;
    });
  }

  void _submit() {
    log('First Name: ${firstNameController.text}');
    log('Last Name: ${lastNameController.text}');
    log('Sex: ${sex.name}');
    log('Employee ID: ${employeeIdController.text}');
    log('Designation: ${designationController.text}');
    log('Phone Number: ${phoneNumberController.text}');
  }
}
