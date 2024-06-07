// lib/models/doctor_data.dart

import '../models/doctor.dart';

List<Doctor> doctors = [
  Doctor(
    name: 'Doctor A',
    specialization: 'Cardiology',
    rating: 4.5,
    image: 'https://via.placeholder.com/150', // Provide image URL here
    description: 'Description of Doctor A', // Provide description here
  ),
  Doctor(
    name: 'Doctor B',
    specialization: 'Neurology',
    rating: 4.0,
    image: 'https://via.placeholder.com/150', // Provide image URL here
    description: 'Description of Doctor B', // Provide description here
  ),
  // Add more doctors with image and description...
];
