import 'package:flutter/material.dart';

import '../model/category.dart';


final categories = {
  Categories.vegetables: Category(
    title: 'Vegetables',
    color: const Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    title: 'Fruit',
    color: const Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    title: 'Meat',
    color: const Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    title: 'Dairy',
    color: const Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    title: 'Carbs',
    color: const Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    title: 'Sweets',
    color: const Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    title: 'Spices',
    color: const Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    title: 'Convenience',
    color: const Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    title: 'Hygiene',
    color: const Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    title: 'Other',
    color: const Color.fromARGB(255, 0, 225, 255),
  ),
};
