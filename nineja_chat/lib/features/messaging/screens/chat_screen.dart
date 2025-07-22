import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;
  const ChatScreen({Key? key, required this.chatId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat $chatId')),
      body: const Center(
        child: Text('Chat Screen - Coming Soon!'),
      ),
    );
  }
}
