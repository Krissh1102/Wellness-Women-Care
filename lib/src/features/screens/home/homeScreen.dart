import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnes/src/utils/app_icon.dart';

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
        elevation: 1,
        title: AppIcon(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 8,
                top: 12,
              ),
              width: double.infinity,
              height: 200,
              color: Color.fromRGBO(226, 235, 246, 1),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(),
                      Text('Welcome back to Well Women Care!',
                          style: GoogleFonts.chewy(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                      Text(
                        'Let’s continue prioritizing your health together.',
                        style: GoogleFonts.poiretOne(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/images/home/beautiful-female-doctor-white-coat-standing-arms-crossed-white-wall 1.png',
                    width: 163,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search doctor, drugs, articles...",
                      hintStyle: TextStyle(fontSize: 14), // Smaller text size
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCategoryButton(
                            'assets/images/home/Group 165.png',
                            "Nearby Clinic",
                            () {
                              context.go('/clinic');
                            },
                          ),
                          _buildCategoryButton(
                            'assets/images/home/Group 166.png',
                            "Pharmacy",
                            () {
                              context.go('/pharmacy');
                            },
                          ),
                          _buildCategoryButton(
                            'assets/images/home/Group 167.png',
                            "Teleconsultation",
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Medication Management",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Container(
                    color: Colors.white, // Blue background for the grid
                    padding: EdgeInsets.all(8),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildFeatureCard(
                          "Get reminders for your pills.",
                          'assets/images/home/Icon.png',
                          () {},
                        ),
                        _buildFeatureCard(
                          "Find out about your medicine.",
                          'assets/images/home/Icon (1).png',
                          () {},
                        ),
                        _buildFeatureCard(
                          "Keep track of what you take.",
                          'assets/images/home/Icon (2).png',
                          () {},
                        ),
                        _buildFeatureCard(
                          "Track your period cycle.",
                          'assets/images/home/Icon (3).png',
                          () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Health articles",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            context.go('/article');
                          },
                          child: Text('See More'))
                    ],
                  ),
                  SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Image.asset(
                      'assets/images/Rectangle 460.png',
                      width: 62,
                      height: 53,
                    ),
                    title: Text(
                      "The 25 Healthiest Fruits You Can Eat",
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      "Jul 10, 2023",
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.bookmark_border, color: Colors.black),
                      onPressed: () {},
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.all(8),
                    leading: Image.asset(
                      'assets/images/Rectangle 460.png',
                      width: 62,
                      height: 53,
                      fit: BoxFit.cover,
                    ), // Replace with actual asset
                    title: Text(
                      "The Impact of COVID-19 on Healthcare",
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      "Jul 8, 2023",
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.bookmark_border, color: Colors.black),
                      onPressed: () {},
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      String image, String label, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.55,
              child: Image.asset(
                image,
                width: 120,
                height: 160,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      String title, String image, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(10, 197, 236, 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
            Spacer(),
            Row(
              children: [
                Text('Learn more'),
                Icon(
                  Icons.arrow_forward_outlined,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
