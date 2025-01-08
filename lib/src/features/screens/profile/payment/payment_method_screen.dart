import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellnes/src/features/screens/profile/payment/addCard.dart';
import 'package:wellnes/src/res/colors.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedPaymentMethod = "Add New Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
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
        centerTitle: true,
        title: const Text(
          'Saved',
          style: TextStyle(
            color: Color.fromRGBO(26, 94, 192, 1),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: Credit & Debit Card
            Text(
              "Credit & Debit Card",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card, color: Colors.black, size: 50),
                      SizedBox(width: 16),
                      Text("Kotak Bank", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Default",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Handle "Subscription" container tap
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Subscription",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(100, 25),
                      ),
                      onPressed: () {
                        // Handle "Edit" button logic
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
            SizedBox(height: 16),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: RadioListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                activeColor: Colors.black,
                value: "Add New Card",
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCardScreen()),
                    );
                  });
                },
                title: Row(
                  children: [
                    Icon(Icons.add, color: Colors.black),
                    SizedBox(width: 8),
                    Text("Add New Card"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Section: More Payment Options
            Text(
              "More Payment Option",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildPaymentOption("Apple Pay", Icons.apple, "Apple Pay"),
            _buildPaymentOption("Paypal", Icons.payment, "Paypal"),
            _buildPaymentOption(
                "Google Pay", Icons.g_translate_outlined, "Google Pay"),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: RadioListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        activeColor: Colors.black,
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: (value) {
          setState(() {
            selectedPaymentMethod = value!;
          });
        },
        title: Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
