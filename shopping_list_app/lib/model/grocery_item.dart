// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopping_list_app/model/category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;
  GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });
}
