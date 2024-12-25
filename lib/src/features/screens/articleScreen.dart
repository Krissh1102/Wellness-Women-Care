import 'package:flutter/material.dart';
import 'package:wellnes/src/res/colors.dart';

class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String timeAgo;
  final Color cardColor;
  final IconData icon;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.timeAgo,
    required this.cardColor,
    required this.icon,
  });
}

class TopArticlesScreen extends StatelessWidget {
  TopArticlesScreen({Key? key}) : super(key: key);

  final List<ArticleModel> articles = [
    ArticleModel(
      author: 'Markham Heid',
      title: 'How Sunlight, the Immune System, and Covid-19 Interact',
      description:
          'For thousands of years, people have recognized that the sun plays a role in the emergence and transmission of viruses',
      timeAgo: '20 hrs',
      cardColor: Colors.blue.shade50,
      icon: Icons.sunny,
    ),
    ArticleModel(
      author: 'Kelli Okumura',
      title: 'Get in Shape: Japanese Rule to a Healthy Diet',
      description:
          'From bamboo shoots to cultivated interest in nutrition, food, and how we can optimize our health and well-being',
      timeAgo: '18 hrs',
      cardColor: Colors.orange.shade50,
      icon: Icons.restaurant,
    ),
    // Add more articles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Top Articles',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: article.cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        article.author,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const Text(' • '),
                      Text(
                        article.timeAgo,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
