// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/model/items_model.dart';
import 'package:image_picker/image_picker.dart';

import 'package:foodpanda_sellers_app/global/global.dart';
import 'package:foodpanda_sellers_app/model/menus_model.dart';
import 'package:foodpanda_sellers_app/widgets/progress_bar.dart';

import '../widgets/error_dialog_widget.dart';

class ItemUploadScreen extends StatefulWidget {
  const ItemUploadScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Menus model;
  @override
  State<ItemUploadScreen> createState() => _MenusUploadScreenState();
}

class _MenusUploadScreenState extends State<ItemUploadScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController shortInforController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  bool uploading = false;
  String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  takeImage(BuildContext mContent) {
    return showDialog(
      context: mContent,
      builder: (context) => SimpleDialog(
        title: const Text(
          'Menu Image',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
        ),
        children: [
          SimpleDialogOption(
            onPressed: () {
              captureImageWithCamera(ImageSource.camera);
            },
            child: const Text(
              'Capture with Camera',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              captureImageWithCamera(ImageSource.gallery);
            },
            child: const Text(
              'Capture with Gallery',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SimpleDialogOption(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  captureImageWithCamera(ImageSource source) async {
    Navigator.pop(context);
    // lấy hình ảnh
    imageXFile = await _picker.pickImage(
      source: source,
      maxHeight: 720,
      maxWidth: 1280,
    );
    setState(() {
      imageXFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return imageXFile == null
        ? defaultScreen(context)
        : itemsUploadFormScreen();
  }

  Scaffold defaultScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'Add New Item',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shop_two,
                color: Colors.white,
                size: 200,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                ),
                onPressed: () {
                  takeImage(context);
                },
                child: const Text(
                  'Upload New Item',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemsUploadFormScreen() {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: uploading ? null : () => validateUploadForm(),
            child: const Text(
              'Add',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 18,
                fontFamily: 'Varela',
                letterSpacing: 3,
              ),
            ),
          ),
        ],
        title: const Text(
          'Upload New Item',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: ListView(
        children: [
          uploading == true ? linearProgress() : const Text(''),
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(
                          imageXFile!.path,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.perm_device_information,
              color: Colors.cyan,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: shortInforController,
                decoration: const InputDecoration(
                  hintText: 'Item Information',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.title,
              color: Colors.cyan,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Item Title',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.description,
              color: Colors.cyan,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Item Description',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.price_change,
              color: Colors.cyan,
            ),
            title: SizedBox(
              width: 250,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: 'Item Price',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.amber,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  clearMenuUploadForm() {
    setState(() {
      shortInforController.clear();
      titleController.clear();
      descriptionController.clear();
      priceController.clear();
      imageXFile = null;
    });
  }

  void validateUploadForm() async {
    setState(() {
      uploading = true;
    });
    if (imageXFile != null) {
      if (shortInforController.text.isNotEmpty &&
          titleController.text.isNotEmpty &&
          descriptionController.text.isNotEmpty &&
          priceController.text.isNotEmpty) {
        setState(() {
          uploading = true;
        });
        // upload image
        String downloadUrl = await uploadImage(File(imageXFile!.path));
        // save info to firebase
        saveInfo(downloadUrl, shortInforController.text, titleController.text,
            descriptionController.text, priceController.text);
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              const ErrorDialogWidget(message: 'Please enter all fields'),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const ErrorDialogWidget(message: 'Please pick a image for Menu.'),
      );
    }
  }

  Future<String> uploadImage(File file) async {
    Reference reference = firebaseStorage.ref().child('items');
    UploadTask uploadTask = reference.child('$uniqueIdName.jpg').putFile(
        file,
        SettableMetadata(
          contentType: "image/jpeg",
        ));
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void saveInfo(String downloadUrl, String shortInfo, String titleItem,
      String description, String price) {
    ItemsModel itemsModel = ItemsModel(
        itemId: uniqueIdName,
        menuId: widget.model.menuId,
        sellerUID: sharedPreferences!.getString('uid')!,
        sellerName: sharedPreferences!.getString('name')!,
        shortInfo: shortInfo,
        longDescription: description,
        price: int.parse(price),
        title: titleItem,
        publishedDate: DateTime.now(),
        status: 'available',
        thumbnailUrl: downloadUrl);
    final ref = firebaseFirestore
        .collection('sellers')
        .doc(sharedPreferences!.getString('uid'))
        .collection('menus')
        .doc(widget.model.menuId)
        .collection('items');
    ref.doc(uniqueIdName).set(itemsModel.toMap());
    final itemRef = firebaseFirestore.collection('items');
    itemRef.doc(uniqueIdName).set(itemsModel.toMap());
    clearMenuUploadForm();
    setState(() {
      uniqueIdName = '';
      uploading = false;
    });
  }
}
