// lib/models/doctor.dart

class Doctor {
  final String name;
  final String specialization;
  final double rating;
  final String image;
  final String description;

  Doctor({
    required this.name,
    required this.specialization,
    required this.rating,
    required this.image,
    required this.description,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'],
      image: json['image'],
      description: json['description'],
    );
  }
}
