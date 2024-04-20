import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticateUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        // lang nghe thay doi tu 1 CSDL tu xa
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'createAt',
              descending: true,
            )
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          // cho nhan du lieu
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text("No messages found."),
            );
          }

          if (chatSnapshots.hasError) {
            return const Center(
              child: Text("Something went wrong..."),
            );
          }

          final loadedMessages = chatSnapshots.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 40,
              left: 13,
              right: 13,
            ),
            reverse: true, // dao nguoc tu duoi len
            itemCount: loadedMessages.length,
            itemBuilder: (ctx, index) {
              final chatMessage = loadedMessages[index].data();
              final nextChatMessage = index + 1 < loadedMessages.length
                  ? loadedMessages[index + 1].data()
                  : null;

              final currentMessageUserID = chatMessage['userID'];
              final nextMessageUserID =
                  nextChatMessage != null ? nextChatMessage['userID'] : null;

              final nextUserIsSame = currentMessageUserID == nextMessageUserID;

              if (nextUserIsSame) {
                return MessageBubble.next(
                  message: chatMessage['text'],
                  isMe: authenticateUser!.uid == currentMessageUserID,
                );
              } else {
                return MessageBubble.first(
                    userImage: chatMessage['userImage'],
                    username: chatMessage['userName'],
                    message: chatMessage['text'],
                    isMe: authenticateUser!.uid == currentMessageUserID);
              }
            },
          );
        });
  }
}
