// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_food_delivery_ecommerce/constants/image_manager.dart';

class UnboardContent {
  final String image;
  final String title;
  final String description;
  UnboardContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnboardContent> contents = [
  UnboardContent(
      image: ImageManager.screen1,
      title: 'Select from Our\n  Best menu',
      description: 'Pick your food form our menu\n More than 35 times'),
  UnboardContent(
      image: ImageManager.screen2,
      title: 'Easy and Online Payment',
      description: 'You can pay cash on delivery and Card payment available'),
  UnboardContent(
      image: ImageManager.screen3,
      title: 'Quick Delivery at Your Doorstep',
      description: 'Delivery your food at your \n Doorstep')
];
