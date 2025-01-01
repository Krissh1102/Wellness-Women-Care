import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class TopArticlesScreen extends StatelessWidget {
  final List<Article> articles = [
    Article(
      author: 'Markham Heid',
      readTime: '10 min read',
      date: '20 Nov',
      title: 'How Sunlight, the Immune System, and Covid-19 Interact',
      description:
          'For thousands of years, humans have recognized that the sun plays a role in the emergence and transmission of viruses.',
      image: 'assets/images/image-removebg-preview 1 (1).png',
    ),
    Article(
      author: 'Kaki Okumura',
      readTime: '7 min read',
      date: '12 Oct',
      title: 'Get in Shape: Japanese Rule to a Healthy Diet',
      description:
          'I\'m no biohacker, but I have a profound interest in nutrition, food, and how we can optimize our health and well-being.',
      image: 'assets/images/image-removebg-preview 1 (1).png',
    ),
    Article(
      author: 'Markham Heid',
      readTime: '5 min read',
      date: '23 Oct',
      title: '3 Hobbies That Can Improve Your Memory',
      description:
          'For thousands of years, humans have recognized that the sun plays a role in the emergence and transmission of viruses.',
      image: 'assets/images/image-removebg-preview 1 (1).png',
    ),
    Article(
      author: 'Dr. Christine Bradstreet',
      readTime: '7 min read',
      date: '20 Nov',
      title: 'The Science Behind Improving Your Immune System',
      description:
          'Today I will talk about that science about your immune system that nobody ever talks about.',
      image: 'assets/images/image-removebg-preview 1 (1).png',
    ),
    Article(
      author: 'Rebeka Ratry',
      readTime: '13 min read',
      date: '23 Aug',
      title: '4 Habits Everyone Needs for Better Mental Health',
      description: 'You are what you habitually do.',
      image: 'assets/images/image-removebg-preview 1 (1).png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
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
        toolbarHeight: 100,
        title: const Text(
          'Top Articles',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  '${article.author}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                '  •  ${article.readTime}  •  ${article.date}',
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article.description,
                            style: const TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 100,
                      height: 122,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          article.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Article {
  final String author;
  final String readTime;
  final String date;
  final String title;
  final String description;
  final String image;

  Article({
    required this.author,
    required this.readTime,
    required this.date,
    required this.title,
    required this.description,
    required this.image,
  });
}
