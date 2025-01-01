import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class CancelAppointmentScreen extends StatefulWidget {
  const CancelAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<CancelAppointmentScreen> createState() =>
      _CancelAppointmentScreenState();
}

class _CancelAppointmentScreenState extends State<CancelAppointmentScreen> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/allappointments');
            }
          },
        ),
        centerTitle: true,
        title: const Text(
          'Cancel Appointment',
          style: TextStyle(
            color: Color.fromRGBO(26, 94, 192, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundLight, // Light blue background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose a Reason:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildRadioOption('Rescheduling'),
            _buildRadioOption('Weather Conditions'),
            _buildRadioOption('Unexpected Work'),
            _buildRadioOption('Others'),
            const SizedBox(height: 20),
            if (selectedReason == 'Others') ...[
              const Text(
                'Please provide your reason:',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter Your Reason Here...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ],
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle cancellation logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(26, 94, 192, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Cancel Appointment',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedReason = value;
        });
      },
      child: Row(
        children: [
          Radio<String>(
            activeColor: Colors.blue,
            value: value,
            groupValue: selectedReason,
            onChanged: (newValue) {
              setState(() {
                selectedReason = newValue!;
              });
            },
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
