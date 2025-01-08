import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class Teleconsultationscreen extends StatelessWidget {
  const Teleconsultationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
          ),
          title: const Text(
            'Doctors',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon:
                    const Icon(Icons.filter_alt_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for doctors',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 170 / 200,
                ),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCard(doctor: doctor);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          height: 70,
          child: Center(
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Icon(Icons.chat_bubble_outline),
                  const SizedBox(height: 4),
                  const Text('Chat'),
                ],
              ),
            ),
          ),
        ));
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/doctor-details'),
      child: Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 38,
              backgroundImage: NetworkImage(doctor.image),
            ),
            const SizedBox(height: 8),
            Text(
              doctor.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              doctor.speciality,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  '${doctor.rating} (${doctor.reviews} reviews)',
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String speciality;
  final double rating;
  final int reviews;
  final String image;

  Doctor({
    required this.name,
    required this.speciality,
    required this.rating,
    required this.reviews,
    required this.image,
  });
}

final List<Doctor> doctors = [
  Doctor(
    name: 'Dr. Bellamy N',
    speciality: 'Virologist',
    rating: 4.5,
    reviews: 135,
    image: 'https://via.placeholder.com/150',
  ),
  Doctor(
    name: 'Dr. Mensah T',
    speciality: 'Oncologist',
    rating: 4.3,
    reviews: 130,
    image: 'https://via.placeholder.com/150',
  ),
  Doctor(
    name: 'Dr. Klimisch J',
    speciality: 'Surgeon',
    rating: 4.5,
    reviews: 135,
    image: 'https://via.placeholder.com/150',
  ),
  Doctor(
    name: 'Dr. Martinez K',
    speciality: 'Pediatrician',
    rating: 4.3,
    reviews: 130,
    image: 'https://via.placeholder.com/150',
  ),
  Doctor(
    name: 'Dr. Marc M',
    speciality: 'Rheumatologist',
    rating: 4.3,
    reviews: 130,
    image: 'https://via.placeholder.com/150',
  ),
  Doctor(
    name: 'Dr. O\'Boyle J',
    speciality: 'Radiologist',
    rating: 4.5,
    reviews: 135,
    image: 'https://via.placeholder.com/150',
  ),
];
