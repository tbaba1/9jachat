import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  final String? userId;
  const ProfileScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('@current_user'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          _buildProfileHeader(),
          
          // Stats
          _buildStats(),
          
          // Action Buttons
          _buildActionButtons(),
          
          const SizedBox(height: 16),
          
          // Tab Bar
          TabBar(
            controller: _tabController,
            indicatorColor: AppColors.secondary,
            labelColor: AppColors.textPrimary,
            unselectedLabelColor: AppColors.textSecondary,
            tabs: const [
              Tab(icon: Icon(Icons.grid_on_outlined)),
              Tab(icon: Icon(Icons.favorite_border)),
              Tab(icon: Icon(Icons.bookmark_border)),
            ],
          ),
          
          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildVideosGrid(),
                _buildLikedVideos(),
                _buildSavedVideos(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Profile Picture
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: AppColors.accentGradient,
              ),
              border: Border.all(
                color: AppColors.secondary,
                width: 3,
              ),
            ),
            child: const CircleAvatar(
              radius: 37,
              backgroundColor: AppColors.surfaceVariant,
              child: Icon(
                Icons.person,
                size: 40,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Profile Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  '@johndoe',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Content creator 🎬\nLiving my dreams ✨\nDM for collabs 📩',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Following', '234'),
          _buildStatItem('Followers', '12.4K'),
          _buildStatItem('Likes', '89.2K'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Get.snackbar(
                  'Info',
                  'Edit profile feature coming soon!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton(
            onPressed: () {
              Get.snackbar(
                'Info',
                'Share profile feature coming soon!',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: const Icon(Icons.share),
          ),
        ],
      ),
    );
  }

  Widget _buildVideosGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.6,
      ),
      itemCount: 24,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              // Video thumbnail placeholder
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.surfaceVariant,
                  child: const Icon(
                    Icons.play_arrow,
                    color: AppColors.secondary,
                    size: 30,
                  ),
                ),
              ),
              // Views count
              Positioned(
                bottom: 4,
                left: 4,
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 12,
                    ),
                    Text(
                      '${(index + 1) * 123}K',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLikedVideos() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: 16),
          Text(
            'Liked videos',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Videos you liked will appear here',
            style: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedVideos() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 80,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: 16),
          Text(
            'Saved videos',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Videos you saved will appear here',
            style: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(Icons.settings_outlined, 'Settings', () {
                Navigator.pop(context);
                Get.snackbar(
                  'Info',
                  'Settings feature coming soon!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
              _buildMenuItem(Icons.qr_code_outlined, 'QR Code', () {
                Navigator.pop(context);
                Get.snackbar(
                  'Info',
                  'QR Code feature coming soon!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
              _buildMenuItem(Icons.analytics_outlined, 'Analytics', () {
                Navigator.pop(context);
                Get.snackbar(
                  'Info',
                  'Analytics feature coming soon!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }),
              _buildMenuItem(Icons.logout_outlined, 'Logout', () {
                Navigator.pop(context);
                Get.offAllNamed('/login');
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      onTap: onTap,
    );
  }
}
