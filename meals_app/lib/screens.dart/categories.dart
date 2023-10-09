import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // số cột
            childAspectRatio: 3 / 2, //tỷ lệ khung hình từ trên xuống
            crossAxisSpacing: 20, //khoảng cách
            mainAxisSpacing: 20, //khoảng cách
          ),
          children: const [
            Card(child: Text('1')),
            Card(child: Text('1')),
            Card(child: Text('1')),
            Card(child: Text('1')),
            Card(child: Text('1')),
            Card(child: Text('1')),
            Card(child: Text('1')),
          ],
        ),
      ),
    );
  }
}
