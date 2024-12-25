import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmacyScreen extends StatefulWidget {
  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  final List<Map<String, dynamic>> popularProducts = [
    {
      'name': 'Panadol',
      'details': '20pcs',
      'price': '\$15.99',
      'image': 'assets/images/Image (1).png',
    },
    {
      'name': 'Bodrex Herbal',
      'details': '100ml',
      'price': '\$7.99',
      'image': 'assets/images/Image (1).png',
    },
    {
      'name': 'Konidin',
      'details': '3pcs',
      'price': '\$5.99',
      'image': 'assets/images/Image (1).png',
    },
  ];

  final List<Map<String, dynamic>> saleProducts = [
    {
      'name': 'OBH Combi',
      'details': '75ml',
      'price': '\$10.99',
      'oldPrice': '\$12.00',
      'image': 'assets/images/Image (2).png',
    },
    {
      'name': 'Betadine',
      'details': '50ml',
      'price': '\$6.99',
      'oldPrice': '\$8.00',
      'image': 'assets/images/Image (2).png',
    },
    {
      'name': 'Bodrexin',
      'details': '75ml',
      'price': '\$7.99',
      'oldPrice': '\$9.00',
      'image': 'assets/images/Image (2).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pharmacy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
        actions: [
          IconButton(
            icon: Image.asset('assets/images/Group.png'),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search drugs, category...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Trusted Source for\nWomen’s Health Essentials',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Upload Prescription',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/glasses-medications-around-clipboard 1.png',
                    height: 137,
                    width: 167,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildSectionHeader(context, 'Popular Product'),
            _buildProductList(popularProducts, hasOldPrice: false),
            _buildSectionHeader(context, 'Product on Sale'),
            _buildProductList(saleProducts, hasOldPrice: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See all',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(List<Map<String, dynamic>> products,
      {bool hasOldPrice = false}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0, bottom: 16),
            child: Container(
              width: 140,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      product['image'],
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product['details'],
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        product['price'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (hasOldPrice) ...[
                        SizedBox(width: 4),
                        Text(
                          product['oldPrice'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
