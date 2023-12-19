import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter/models/models.dart';
import 'package:instagram_flutter/providers/user_provider.dart';
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
  final TextEditingController _editingController = TextEditingController();
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
            onPressed: ()  {
              Navigator.pop(context);
            
            },
          ),
        ],
      ),
    );
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
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              backgroundColor: mobileBackgroundColor,
              actions: [
                TextButton(
                  onPressed: () {},
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a caption...',
                          border: InputBorder.none,
                        ),
                        maxLength: 8,
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
