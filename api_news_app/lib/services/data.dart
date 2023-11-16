import 'package:api_news_app/constraints/image_manager.dart';
import 'package:api_news_app/models/category_model.dart';

List<CategoryModel> getCategoryList() {
  List<CategoryModel> category = [
    CategoryModel(categoryName: 'Business', image: ImageManager.imageBusiness),
    CategoryModel(
        categoryName: 'Entertainment', image: ImageManager.imageEntertaiment),
    CategoryModel(categoryName: 'General', image: ImageManager.imageGeneral),
    CategoryModel(categoryName: 'Health', image: ImageManager.imageHealthcare),
    CategoryModel(categoryName: 'Sport', image: ImageManager.imageSports),
    CategoryModel(
        categoryName: 'Science', image: ImageManager.imageDataScience),
  ];
  return category;
}
