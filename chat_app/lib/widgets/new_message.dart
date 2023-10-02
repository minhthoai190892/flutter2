import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();
  @override
  void dispose() {
    // giải phóng bộ nhớ khi không cần thiết nữa
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage =
        _messageController.text; //lấy tin nhắn được nhập trong TextField
    if (enteredMessage.trim().isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus(); //đóng bàn phím mobile
    //xóa văn bản khi đã được gửi
    _messageController.clear();
    //Get information current user entered
    final currentUser = FirebaseAuth.instance.currentUser!;
    //Get username from FirebaseFirestore
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    //send to firebase
    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': currentUser.uid,
      'userName': userData.data()!['username'],
      'userImage': userData.data()!['image_url'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization:
                  TextCapitalization.sentences, //Viếc hoa chữ cái đầu mỗi câu
              autofocus: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
