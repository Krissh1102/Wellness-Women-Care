import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/res/colors.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int obhQuantity = 1;
  int panadolQuantity = 2;

  double obhPrice = 9.99;
  double panadolPrice = 19.99;
  double tax = 1.00;

  @override
  Widget build(BuildContext context) {
    double subtotal =
        (obhPrice * obhQuantity) + (panadolPrice * panadolQuantity);
    double total = subtotal + tax;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCartItem(
                image: 'assets/images/Image (1).png',
                name: 'OBH Combi',
                size: '75ml',
                price: obhPrice,
                quantity: obhQuantity,
                onDecrement: () {
                  setState(() {
                    if (obhQuantity > 1) obhQuantity--;
                  });
                },
                onIncrement: () {
                  setState(() {
                    obhQuantity++;
                  });
                },
              ),
              _buildCartItem(
                image: 'assets/images/Image (1).png',
                name: 'Panadol',
                size: '70ml',
                price: panadolPrice,
                quantity: panadolQuantity,
                onDecrement: () {
                  setState(() {
                    if (panadolQuantity > 1) panadolQuantity--;
                  });
                },
                onIncrement: () {
                  setState(() {
                    panadolQuantity++;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildPaymentDetail(subtotal, tax, total),
              SizedBox(height: 20),
              Divider(),
              _buildPaymentMethod(),
              SizedBox(height: 20),
              _buildTotalAndCheckout(total),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String name,
    required String size,
    required double price,
    required int quantity,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
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
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  size,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.remove_circle_outline, color: Colors.blue),
                      onPressed: onDecrement,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: Colors.blue),
                      onPressed: onIncrement,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '\$${(price * quantity).toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.delete_outline, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPaymentDetail(double subtotal, double tax, double total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Detail',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: TextStyle(color: Colors.grey)),
            Text('\$${subtotal.toStringAsFixed(2)}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Taxes', style: TextStyle(color: Colors.grey)),
            Text('\$${tax.toStringAsFixed(2)}'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VISA',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Change', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTotalAndCheckout(double total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ],
    );
  }
}
