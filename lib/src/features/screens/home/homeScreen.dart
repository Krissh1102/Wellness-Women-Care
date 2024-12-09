import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/avatar.jpg'), // Add your avatar image here
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back to Well Women Care!",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text(
                  "Let's continue prioritizing our healthcare!",
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search doctor, drugs, articles...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryButton(Icons.local_hospital, "Nearby Clinic"),
                  _buildCategoryButton(Icons.local_pharmacy, "Pharmacy"),
                  _buildCategoryButton(Icons.video_call, "Teleconsultation"),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Medication Management",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildFeatureCard("Get reminders for your pills.", Icons.alarm),
                  _buildFeatureCard("Find out about your medicine.", Icons.info),
                  _buildFeatureCard("Keep track of what you take.", Icons.checklist),
                  _buildFeatureCard("Track your period cycle.", Icons.calendar_today),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Health articles",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              ListTile(
                leading: Image.asset('assets/article1.jpg', width: 50, height: 50), // Replace with actual asset
                title: Text("The 25 Healthiest Fruits You Can Eat"),
                subtitle: Text("Jul 10, 2023"),
              ),
              ListTile(
                leading: Image.asset('assets/article2.jpg', width: 50, height: 50), // Replace with actual asset
                title: Text("The Impact of COVID-19 on Healthcare"),
                subtitle: Text("Jul 8, 2023"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue[50],
          child: Icon(icon, color: Colors.blue),
        ),
        SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildFeatureCard(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}