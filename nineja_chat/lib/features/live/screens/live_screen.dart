import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  final String videoId;
  const LiveScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live $videoId')),
      body: const Center(
        child: Text('Live Screen - Coming Soon!'),
      ),
    );
  }
}
