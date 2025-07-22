import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_config.dart';
import '../../../shared/widgets/video_player_widget.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({Key? key}) : super(key: key);

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  // Demo video data
  final List<Map<String, dynamic>> _demoVideos = [
    {
      'id': '1',
      'username': 'jane_doe',
      'displayName': 'Jane Doe',
      'caption': 'Amazing sunset view! 🌅 #nature #beautiful',
      'likesCount': 1234,
      'commentsCount': 89,
      'sharesCount': 45,
      'isLiked': false,
      'isVerified': true,
      'profileImage': 'https://via.placeholder.com/150',
      'videoUrl': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_1mb.mp4',
    },
    {
      'id': '2',
      'username': 'john_smith',
      'displayName': 'John Smith',
      'caption': 'Dancing to my favorite song! 💃 #dance #music #fun',
      'likesCount': 2156,
      'commentsCount': 234,
      'sharesCount': 78,
      'isLiked': true,
      'isVerified': false,
      'profileImage': 'https://via.placeholder.com/150',
      'videoUrl': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_2mb.mp4',
    },
    {
      'id': '3',
      'username': 'foodie_lover',
      'displayName': 'Foodie Lover',
      'caption': 'Trying this amazing recipe! 🍕 #food #cooking #delicious',
      'likesCount': 987,
      'commentsCount': 156,
      'sharesCount': 34,
      'isLiked': false,
      'isVerified': true,
      'profileImage': 'https://via.placeholder.com/150',
      'videoUrl': 'https://sample-videos.com/zip/10/mp4/SampleVideo_1280x720_5mb.mp4',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _demoVideos.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final video = _demoVideos[index];
          return _buildVideoItem(video);
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // TODO: Switch to Following feed
            },
            child: const Text(
              'Following',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          TextButton(
            onPressed: () {
              // TODO: Switch to For You feed
            },
            child: const Text(
              'For You',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.live_tv_outlined,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            // TODO: Navigate to live streams
          },
        ),
      ],
    );
  }

  Widget _buildVideoItem(Map<String, dynamic> video) {
    return Stack(
      children: [
        // Video Player (Placeholder)
        Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.surfaceVariant,
          child: const Center(
            child: Icon(
              Icons.play_circle_filled,
              size: 80,
              color: AppColors.secondary,
            ),
          ),
        ),
        
        // Gradient Overlay
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.videoOverlayGradient,
            ),
          ),
        ),
        
        // Content Overlay
        Positioned(
          right: 12,
          bottom: 80,
          child: _buildActionButtons(video),
        ),
        
        // Video Info
        Positioned(
          left: 12,
          right: 80,
          bottom: 80,
          child: _buildVideoInfo(video),
        ),
      ],
    );
  }

  Widget _buildActionButtons(Map<String, dynamic> video) {
    return Column(
      children: [
        // Profile Image
        GestureDetector(
          onTap: () {
            // TODO: Navigate to user profile
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.textPrimary,
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: AppColors.surfaceVariant,
              child: Icon(
                Icons.person,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Like Button
        GestureDetector(
          onTap: () {
            // TODO: Toggle like
          },
          child: Column(
            children: [
              Icon(
                video['isLiked'] ? Icons.favorite : Icons.favorite_border,
                color: video['isLiked'] ? AppColors.liked : AppColors.textPrimary,
                size: 30,
              ),
              const SizedBox(height: 4),
              Text(
                _formatCount(video['likesCount']),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Comment Button
        GestureDetector(
          onTap: () {
            // TODO: Show comments
          },
          child: Column(
            children: [
              const Icon(
                Icons.mode_comment_outlined,
                color: AppColors.textPrimary,
                size: 30,
              ),
              const SizedBox(height: 4),
              Text(
                _formatCount(video['commentsCount']),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Share Button
        GestureDetector(
          onTap: () {
            // TODO: Share video
          },
          child: Column(
            children: [
              const Icon(
                Icons.share_outlined,
                color: AppColors.textPrimary,
                size: 30,
              ),
              const SizedBox(height: 4),
              Text(
                _formatCount(video['sharesCount']),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Save Button
        GestureDetector(
          onTap: () {
            // TODO: Toggle save
          },
          child: const Icon(
            Icons.bookmark_border,
            color: AppColors.textPrimary,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildVideoInfo(Map<String, dynamic> video) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Username
        Row(
          children: [
            Text(
              '@${video['username']}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (video['isVerified'])
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.verified,
                  color: AppColors.secondary,
                  size: 16,
                ),
              ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Caption
        Text(
          video['caption'],
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        
        const SizedBox(height: 8),
        
        // Music/Audio Info (if available)
        Row(
          children: [
            const Icon(
              Icons.music_note,
              color: AppColors.textSecondary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                'Original audio',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else {
      return count.toString();
    }
  }
}
