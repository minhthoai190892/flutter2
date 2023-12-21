// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/models/models.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
import 'package:instagram_flutter/resources/resources.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/util.dart';
import 'package:provider/provider.dart';

class AddPostCreen extends StatefulWidget {
  const AddPostCreen({super.key});

  @override
  State<AddPostCreen> createState() => _AddPostCreenState();
}

class _AddPostCreenState extends State<AddPostCreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  _selectImage(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Create a post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a photo'),
            onPressed: () async {
              Navigator.pop(context);
              Uint8List file = await pickImage(source: ImageSource.camera);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from gellery'),
            onPressed: () async {
              Navigator.pop(context);
              Uint8List file = await pickImage(source: ImageSource.gallery);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void postImage(
      {required String uid,
      required String username,
      required String profImage}) async {
    setState(() {
      isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
          description: _descriptionController.text,
          file: _file!,
          username: username,
          profImage: profImage,
          uid: uid);
      if (res == 'success') {
        setState(() {
          isLoading = false;
        });
        showSnackBar(content: 'Posted', context: context);
        clearImage();
      } else {
        showSnackBar(content: res, context: context);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnackBar(content: e.toString(), context: context);
    }
  }

  clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
              onPressed: () => _selectImage(context),
              icon: const Icon(Icons.upload),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Post to'),
              centerTitle: true,
              leading: IconButton(
                onPressed: clearImage,
                icon: const Icon(Icons.arrow_back),
              ),
              backgroundColor: mobileBackgroundColor,
              actions: [
                TextButton(
                  onPressed: () => postImage(
                      uid: user.uid,
                      username: user.username,
                      profImage: user.photoUrl),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                isLoading ? const LinearProgressIndicator() : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Write a caption...',
                          border: InputBorder.none,
                        ),
                        // maxLength: 8,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                                image: MemoryImage(_file!)),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 10,
                    )
                  ],
                )
              ],
            ),
          );
  }
}
