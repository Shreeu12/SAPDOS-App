import 'package:flutter/material.dart';
import 'package:sapdos/models/doctor_data.dart';
import 'package:sapdos/patient_screens/patient_screen1.dart'; // Import the doctor_data.dart file

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length, // Now doctors list is accessible
      itemBuilder: (context, index) {
        return DoctorCard(doctor: doctors[index]);
      },
    );
  }
}
