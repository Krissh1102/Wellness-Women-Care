import 'package:flutter/material.dart';
import 'package:wellnes/src/res/colors.dart';

class HelpCenterScreen extends StatefulWidget {
  late final bool isContactPage;

  HelpCenterScreen({
    super.key,
    this.isContactPage = false,
  });

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(8, 46, 61, 1),
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Text(
                    'Help Center',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'How Can We Help You?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tab Buttons
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !widget.isContactPage
                            ? Colors.blue[800]
                            : Colors.lightBlue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Handle FAQ button press
                      },
                      child: Text(
                        'FAQ',
                        style: TextStyle(
                          color: !widget.isContactPage
                              ? Colors.white
                              : Colors.blue[800],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.isContactPage
                            ? Colors.blue
                            : Colors.lightBlue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.isContactPage = !widget.isContactPage;
                        });
                        // Handle Contact Us button press
                      },
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color:
                              widget.isContactPage ? Colors.white : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: widget.isContactPage
                    ? const ContactUsContent()
                    : const FaqContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqContent extends StatelessWidget {
  const FaqContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Category Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryPill('Popular Topic', true),
                _buildCategoryPill('General', false),
                _buildCategoryPill('Services', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // FAQ Items
          _buildFaqItem('Lorem ipsum dolor sit amet?', true),
          _buildFaqItem('Lorem ipsum dolor sit amet?', false),
          _buildFaqItem('Lorem ipsum dolor sit amet?', false),
          _buildFaqItem('Lorem ipsum dolor sit amet?', false),
          _buildFaqItem('Lorem ipsum dolor sit amet?', false),
          _buildFaqItem('Lorem ipsum dolor sit amet?', false),
        ],
      ),
    );
  }

  Widget _buildCategoryPill(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        shape: StadiumBorder(side: BorderSide(color: Colors.grey)),
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue[800],
          ),
        ),
        backgroundColor: isSelected ? Colors.blue[800] : Colors.blue[50],
      ),
    );
  }

  Widget _buildFaqItem(String question, bool isExpanded) {
    return Card(
      elevation: 0,
      child: ExpansionTile(
        backgroundColor: Colors.blue[50],
        collapsedBackgroundColor: Colors.blue[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(question),
        initiallyExpanded: isExpanded,
        children: isExpanded
            ? const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et nibh non orci et lorem. Sed fringunt tortor eleifend et diam. Aenean in sagittis magna, ut faucubt diam.',
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildContactItem(
            icon: Icons.headset_mic,
            title: 'Customer Service',
            color: Colors.blue[100]!,
          ),
          _buildContactItem(
            icon: Icons.language,
            title: 'Website',
            color: Colors.blue[100]!,
          ),
          _buildContactItem(
            icon: Icons.message,
            title: 'Whatsapp',
            color: Colors.blue[100]!,
          ),
          _buildContactItem(
            icon: Icons.facebook,
            title: 'Facebook',
            color: Colors.blue[100]!,
          ),
          _buildContactItem(
            icon: Icons.camera_alt,
            title: 'Instagram',
            color: Colors.blue[100]!,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
