import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../patient_screens/patient_screen2.dart';
import 'dart:convert';

class PatientScreen1 extends StatefulWidget {
  @override
  _PatientScreen1State createState() => _PatientScreen1State();
}

class _PatientScreen1State extends State<PatientScreen1> {
  // ignore: unused_field
  String _selectedFilter = 'None';
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    fetchDoctors().then((doctors) {
      setState(() {
        _doctors = doctors;
      });
    });
  }

  Future<List<Doctor>> fetchDoctors() async {
    final String data = await DefaultAssetBundle.of(context).loadString('assets/doctor_data.json');
    final List<dynamic> jsonList = json.decode(data);
    return jsonList.map((e) => Doctor.fromJson(e)).toList();
  }

  void _filterDoctors(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'Filter by ratings') {
        _doctors.sort((a, b) => b.rating.compareTo(a.rating));
      } else if (filter == 'Filter by name') {
        _doctors.sort((a, b) => a.name.compareTo(b.name));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF13235A),
                ),
                child: Text(
                  'SAPDOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('Categories'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Appointment'),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Text('Chat'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/screen1',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('SAPDOS'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual image
              radius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello!\nSatish',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              color: Color(0xFF13235A),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Doctor's List",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onSelected: (value) {
                      _filterDoctors(value);
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Filter by ratings', 'Filter by name'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3, // Adjust crossAxisCount based on screen width
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2.5, // Adjust to reduce height
                ),
                itemCount: _doctors.length, // Total number of doctors
                itemBuilder: (context, index) {
                  return DoctorCard(doctor: _doctors[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientScreen2(doctor: doctor),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(doctor.image), // Use doctor's image
                radius: 20,
              ),
              SizedBox(height: 10),
              Text(
                doctor.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // Adjust font size
                ),
              ),
              Text(
                doctor.specialization,
                style: TextStyle(
                  fontSize: 12, // Adjust font size
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  Icon(Icons.star_half, color: Colors.orange, size: 16),
                  Icon(Icons.star_border, size: 16),
                  SizedBox(width: 5),
                  Text(
                    '${doctor.rating}',
                    style: TextStyle(fontSize: 12), // Adjust font size
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
