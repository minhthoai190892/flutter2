import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../models/category_model.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Category'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('categories').get(),
        builder: (context, snapshot) {
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
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.19),
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
                        width: Get.width / 2.3,
                        heightImage: Get.height / 10,
                        imageProvider: CachedNetworkImageProvider(
                            categoriesModel.categoryImage),
                        title:
                            Center(child: Text(categoriesModel.categoryName)),
                      ),
                    ),
                  ],
                );
              },
            );

            // SizedBox(
            //   height: Get.height / 5.5,
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: snapshot.data!.docs.length,
            //       itemBuilder: (context, index) {
            //         var data = snapshot.data!.docs[index];
            //         CategoriesModel categoriesModel = CategoriesModel(
            //           categoryId: data['categoryId'],
            //           categoryImage: data['categoryImage'],
            //           categoryName: data['categoryName'],
            //           createdAt: data['createdAt'],
            //           updatedAt: data['updatedAt'],
            //         );
            //         return Row(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.all(5),
            //               child: FillImageCard(
            //                 borderRadius: 20.0,
            //                 width: Get.width / 4,
            //                 heightImage: Get.height / 12,
            //                 imageProvider: CachedNetworkImageProvider(
            //                     categoriesModel.categoryImage),
            //                 title: Center(
            //                     child: Text(categoriesModel.categoryName)),
            //               ),
            //             ),
            //           ],
            //         );
            //       }),
            // );
          }
          return Container();
        },
      ),
    );
  }
}
