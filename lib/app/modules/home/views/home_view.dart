import 'package:expense_track/app/data/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io'; // Import dart:io for File operations
import '../controllers/home_controller.dart'; // Controller import

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Overview'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                controller.pickImage(); // Trigger image picker on tap
              },
              child: Obx(() {
                // Show selected image if available, else default image
                return CircleAvatar(
                  radius: 20,
                  backgroundImage: controller.selectedImagePath.value.isNotEmpty
                      ? FileImage(File(controller.selectedImagePath.value)) // Load from device
                      : AssetImage('assets/profile.jpg') as ImageProvider, // Default image
                );
              }),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewSection(),
            SizedBox(height: 20),
            _buildActionButtons(),
            _buildAPISection()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildOverviewSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildOverviewCard('Total Expense', controller.totalExpense),
        _buildOverviewCard('Monthly Balance', controller.monthlyBalance),
      ],
    );
  }

  Widget _buildOverviewCard(String title, RxDouble value) {
    return Obx(() => Column(
      children: [
        Text(title),
        SizedBox(height: 8),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton('Savings', Icons.savings),
        _buildActionButton('Remind', Icons.notifications),
        _buildActionButton('Budget', Icons.wallet),
      ],
    );
  }
  Widget _buildAPISection() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.articles.isEmpty) {
        return Center(
          child: Text('No articles found.'),
        );
      } else {
        return Expanded( // Wrap ListView in Expanded to make it scrollable
          child: ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              var article = controller.articles[index];
              print('articles : ${controller.articles[index]}');
              return ListTile(
                title: Text(article.title ?? 'No Title Available'), // Handle null title
                subtitle: Text(article.description ?? 'No Description Available'), // Handle null description
                trailing: article.urlToImage != null
                    ? Image.network(article.urlToImage!, width: 100, height: 100, fit: BoxFit.cover)
                    : SizedBox.shrink(), // If no image, leave empty
                onTap: () {
                  // Optionally, you can open the article's URL
                  print('Open article: ${article.url}');
                },
              );
            },
          ),
        );
      }
    });
  }



  Widget _buildActionButton(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings),
          label: 'Savings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
