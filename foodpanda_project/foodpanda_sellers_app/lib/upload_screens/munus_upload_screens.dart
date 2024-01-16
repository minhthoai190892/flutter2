import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MenusUploadScreen extends StatefulWidget {
  const MenusUploadScreen({super.key});

  @override
  State<MenusUploadScreen> createState() => _MenusUploadScreenState();
}

class _MenusUploadScreenState extends State<MenusUploadScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  takeImage(BuildContext  mContent) {
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
              'Capture with Camera',
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
        title: const Text(
          'Add New Menu',
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
                  'Add New Menu',
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
}
