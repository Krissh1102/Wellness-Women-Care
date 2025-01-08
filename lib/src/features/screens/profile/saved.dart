import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class MySavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Color.fromRGBO(26, 94, 192, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SavedItem(
            imageUrl: 'assets/images/Image (1).png',
            title:
                'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
            date: 'Jun 10, 2023',
            timeToRead: '5 min read',
            price: null,
          ),
          SavedItem(
            imageUrl: 'assets/images/Image (2).png',
            title: 'OBH Combi 75ml',
            date: '',
            timeToRead: '',
            price: '\$9.99',
          ),
        ],
      ),
    );
  }
}

class SavedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String timeToRead;
  final String? price;

  const SavedItem({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.timeToRead,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 9),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(12), // Rounded borders
      ),
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset(
                  imageUrl,
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      SizedBox(height: 5),
                      Text(date.isNotEmpty ? '$date • $timeToRead' : '',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
                if (price != null)
                  Text(price!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Icon(Icons.bookmark,
                color: Color.fromRGBO(26, 94, 192, 1)), // Blue saved icon
          ),
        ],
      ),
    );
  }
}
