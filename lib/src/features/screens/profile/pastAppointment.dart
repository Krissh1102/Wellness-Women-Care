import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class AllAppointmentsScreen extends StatefulWidget {
  const AllAppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AllAppointmentsScreen> createState() => _AllAppointmentsScreenState();
}

class _AllAppointmentsScreenState extends State<AllAppointmentsScreen> {
  String _selectedFilter = 'Upcoming';
  final List<String> _filters = ['Complete', 'Upcoming', 'Cancelled'];

  // Separate lists for different filters
  final List<Map<String, dynamic>> _completeAppointments = [
    {
      'name': 'Dr. Olivia Turner, M.D.',
      'specialty': 'Geriatric Endocrinology',
      'rating': 5,
      'image': 'assets/images/allappointment.png',
      'status': 'Complete',
      'liked': false,
    },
    {
      'name': 'Dr. Alexander Bennett, Ph.D.',
      'specialty': 'Geriatric Medicine',
      'rating': 4,
      'image': 'assets/images/allappointment.png',
      'status': 'Complete',
      'liked': false,
    },
  ];

  final List<Map<String, dynamic>> _upcomingAppointments = [
    {
      'name': 'Dr. Emily Carter, M.D.',
      'specialty': 'Cardiology',
      'rating': 4,
      'image': 'assets/images/allappointment.png',
      'status': 'Upcoming',
      'day-date': 'Wednesday, 29th Dec',
      'time-slot': '1:00 AM - 8:00 AM',
    },
    {
      'name': 'Dr. Ethan Miller, Ph.D.',
      'specialty': 'Neurology',
      'rating': 5,
      'image': 'assets/images/allappointment.png',
      'status': 'Upcoming',
      'day-date': 'Monday, 20th Dec',
      'time-slot': '10:00 AM - 11:00 AM',
    },
  ];

  final List<Map<String, dynamic>> _cancelledAppointments = [
    {
      'name': 'Dr. Sophia Martinez, Ph.D.',
      'specialty': 'General Surgery',
      'rating': 3,
      'image': 'assets/images/allappointment.png',
      'status': 'Cancelled',
    },
    {
      'name': 'Dr. Michael Brown, M.D.',
      'specialty': 'Orthopedics',
      'rating': 4,
      'image': 'assets/images/allappointment.png',
      'status': 'Cancelled',
    },
  ];

  List<Map<String, dynamic>> get _appointments {
    switch (_selectedFilter) {
      case 'Complete':
        return _completeAppointments;
      case 'Upcoming':
        return _upcomingAppointments;
      case 'Cancelled':
        return _cancelledAppointments;
      default:
        return [];
    }
  }

  void _likeAppointment(int index) {
    if (_selectedFilter == 'Complete') {
      setState(() {
        for (var i = 0; i < _completeAppointments.length; i++) {
          _completeAppointments[i]['liked'] = i == index;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
        centerTitle: true,
        title: const Text(
          'All Appointment',
          style: TextStyle(
            color: Color.fromRGBO(26, 94, 192, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  _filters.map((filter) => _buildFilterChip(filter)).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _appointments.length,
              itemBuilder: (context, index) {
                final appointment = _appointments[index];
                if (_selectedFilter == 'Complete') {
                  return _buildAppointmentCard_Complete(appointment, index);
                } else if (_selectedFilter == 'Upcoming') {
                  return _buildAppointmentCard_upcoming(appointment, index);
                } else if (_selectedFilter == 'Cancelled') {
                  return _buildAppointmentCard_cancel(appointment, index);
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String filter) {
    final isSelected = _selectedFilter == filter;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[800] : const Color(0x4A0AC5EC),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue[800],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard_Complete(
      Map<String, dynamic> appointment, int index) {
    final isComplete = _selectedFilter == 'Complete';
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        color: const Color.fromRGBO(10, 197, 236, 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 31,
                backgroundImage: AssetImage(appointment['image']),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['name'],
                      style: const TextStyle(
                        color: Color.fromRGBO(21, 101, 192, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment['specialty'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.blue, size: 10),
                              const SizedBox(width: 4),
                              Text(appointment['rating'].toString(),
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 10)),
                            ],
                          ),
                        ),
                        if (isComplete) const SizedBox(width: 10),
                        if (isComplete)
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              onTap: () => _likeAppointment(index),
                              child: Icon(
                                appointment['liked'] ?? false
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: appointment['liked'] ?? false
                                    ? Colors.blue
                                    : Colors.grey,
                                size: 10,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text('Re-Book',
                      style: TextStyle(
                        color: Color.fromRGBO(21, 101, 192, 1),
                      )),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text('Add Review',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard_upcoming(
      Map<String, dynamic> appointment, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        color: const Color.fromRGBO(10, 197, 236, 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 31,
                backgroundImage: AssetImage(appointment['image']),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['name'],
                      style: const TextStyle(
                        color: Color.fromRGBO(21, 101, 192, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment['specialty'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 4),
                              Text(appointment['day-date'].toString(),
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 10)),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 4),
                              Text(appointment['time-slot'].toString(),
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text('Details',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Spacer(),
              ElevatedButton.icon(
                  onPressed: () {
                    context.go('/cancelappointment');
                  },
                  label: Icon(
                    Icons.close,
                    color: Colors.blue,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard_cancel(
      Map<String, dynamic> appointment, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        color: const Color.fromRGBO(10, 197, 236, 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 31,
                backgroundImage: AssetImage(appointment['image']),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['name'],
                      style: const TextStyle(
                        color: Color.fromRGBO(21, 101, 192, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      appointment['specialty'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text('Add Review',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
