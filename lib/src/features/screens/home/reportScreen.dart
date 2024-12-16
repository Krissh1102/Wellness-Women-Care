import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          "Reports",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 131,
              width: double.infinity,
              child: _buildReportCard(
                  "Heart rate", "97 bpm", Icons.favorite, Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildReportCard(
                    "Blood Group", "A+", Icons.bloodtype, Colors.pink),
                SizedBox(width: 16),
                _buildReportCard(
                    "Weight", "103 lbs", Icons.monitor_weight, Colors.amber),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Latest report",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildReportListItem("General report", "Jul 10, 2023"),
            _buildReportListItem("General report", "Jul 5, 2023"),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 8),
            Text(value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildReportListItem(String title, String date) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.insert_drive_file, color: Colors.blue, size: 40),
      title: Text(title, style: TextStyle(fontSize: 16)),
      subtitle: Text(date, style: TextStyle(color: Colors.grey)),
      trailing: Icon(Icons.more_vert),
    );
  }
}
