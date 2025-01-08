import 'package:flutter/material.dart';
import 'package:wellnes/src/features/screens/chat/chat_details_screen.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const Spacer(),
                  const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey[400],
                  ),
                ],
              ),
            ),
            // Chat list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ChatListItem(
                    name: _getDummyData()[index]['name']!,
                    message: _getDummyData()[index]['message']!,
                    time: '2 min ago',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatDetailScreen(),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Bottom navigation
            BottomNavigationBar(
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone),
                  label: 'Calls',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getDummyData() {
    return [
      {'name': 'Alex Linderson', 'message': 'How are you today?'},
      {'name': 'Team Align', 'message': 'Don\'t miss to attend the meeting.'},
      {'name': 'John Ahraham', 'message': 'Don\'t miss to attend the meeting.'},
      {'name': 'Sabila Sayma', 'message': 'How are you today?'},
      {'name': 'John Borino', 'message': 'How are you today?'},
    ];
  }
}

// Chat List Item Widget
class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;

  const ChatListItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[400],
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey[400]),
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey[400], fontSize: 12),
      ),
    );
  }
}
