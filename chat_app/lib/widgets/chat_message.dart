import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  void setupPushNotifications() async {
    final fcm = FirebaseMessaging.instance;
    //thiết lập cho phép người dùng nhận và sử lý thông báo
    await fcm.requestPermission();
    final token = await fcm.getToken();
    String tokens = token!;
    print("Token: $tokens");
    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final authenticationUser = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              'No Messages',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        final loadedMessage = snapshot.data!.docs;
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: 0, left: 13, right: 13),
            reverse: true,
            itemCount: loadedMessage.length,
            itemBuilder: (context, index) {
              final chatMessage = loadedMessage[index].data();
              final nextChatMessage = index + 1 < loadedMessage.length
                  ? loadedMessage[index + 1].data()
                  : null;
              final currentMessageUserId = chatMessage['userId'];
              final nextMessageUserId =
                  nextChatMessage != null ? nextChatMessage['userId'] : null;
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;
              if (nextUserIsSame) {
                return MessageBubble.next(
                    message: chatMessage['text'],
                    isMe: authenticationUser.uid == currentMessageUserId);
              } else {
                return MessageBubble.first(
                    userImage: chatMessage['userImage'],
                    username: chatMessage['userName'],
                    message: chatMessage['text'],
                    isMe: authenticationUser.uid == currentMessageUserId);
              }
            });
      },
    );
  }
}
