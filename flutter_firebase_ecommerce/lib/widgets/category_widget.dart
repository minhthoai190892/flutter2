import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_ecommerce/models/category_model.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categories').get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: Get.height / 5,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No category found!'),
          );
        }
        if (snapshot.data != null) {
          return SizedBox(
            height: Get.height / 5.5,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  CategoriesModel categoriesModel = CategoriesModel(
                    categoryId: data['categoryId'],
                    categoryImage: data['categoryImage'],
                    categoryName: data['categoryName'],
                    createdAt: data['createdAt'],
                    updatedAt: data['updatedAt'],
                  );
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: FillImageCard(
                          borderRadius: 20.0,
                          width: Get.width / 4,
                          heightImage: Get.height / 12,
                          imageProvider: CachedNetworkImageProvider(
                              categoriesModel.categoryImage),
                          title:
                              Center(child: Text(categoriesModel.categoryName)),
                       
                        ),
                      ),
                    ],
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
