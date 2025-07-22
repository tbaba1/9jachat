import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment_outlined),
            onPressed: () {
              // TODO: Start new chat
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return _buildChatItem(index);
        },
      ),
    );
  }

  Widget _buildChatItem(int index) {
    final isOnline = index % 3 == 0;
    final hasUnread = index % 4 == 0;
    
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.surfaceVariant,
            child: Text(
              'U${index + 1}',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.online,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.background,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        'User ${index + 1}',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        _getLastMessage(index),
        style: TextStyle(
          color: hasUnread ? AppColors.textPrimary : AppColors.textSecondary,
          fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _getTimeAgo(index),
            style: TextStyle(
              color: hasUnread ? AppColors.secondary : AppColors.textTertiary,
              fontSize: 12,
            ),
          ),
          if (hasUnread)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        // TODO: Navigate to chat screen
      },
    );
  }

  String _getLastMessage(int index) {
    final messages = [
      'Hey! How are you doing?',
      'Thanks for the follow! ❤️',
      'Did you see my latest video?',
      'Let\'s collaborate soon!',
      'Amazing content as always 🔥',
      'You\'re so talented!',
      'Can we do a duet?',
      'Love your style!',
      'Where did you film that?',
      'Great job on the dance!',
    ];
    return messages[index % messages.length];
  }

  String _getTimeAgo(int index) {
    final times = [
      'now', '2m', '5m', '1h', '3h', '1d', '2d', '1w', '2w', '1m'
    ];
    return times[index % times.length];
  }
}
