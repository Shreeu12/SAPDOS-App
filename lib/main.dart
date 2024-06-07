import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapdos/doctor_screen/doctor_screen1.dart';
import 'package:sapdos/doctor_screen/doctor_screen2.dart';
import 'bloc/app_bloc.dart';
import 'login_screens/login_screen1.dart';
import 'login_screens/login_screen2.dart';
import 'login_screens/login_screen3.dart';
import 'patient_screens/patient_screen1.dart'; // Import the patient screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAPDOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppBloc(),
        child: Screen1(),
      ),
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/doctor_screen/doctor_screen1.dart': (context) => DoctorScreen1(),
        '/doctor_screen/doctor_screen2': (context) => DoctorScreen2(),
        '/patient_screens/patient_screen1.dart': (context) => PatientScreen1(), // Add the patient screen route
      },
    );
  }
}
