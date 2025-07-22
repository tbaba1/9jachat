import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text('Upload'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Camera Option
                _buildUploadOption(
                  icon: Icons.camera_alt_outlined,
                  title: 'Camera',
                  subtitle: 'Record a new video',
                  onTap: () {
                    Get.snackbar(
                      'Info',
                      'Camera feature coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Gallery Option
                _buildUploadOption(
                  icon: Icons.photo_library_outlined,
                  title: 'Gallery',
                  subtitle: 'Choose from gallery',
                  onTap: () {
                    Get.snackbar(
                      'Info',
                      'Gallery upload coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
                
                const SizedBox(height: 24),
                
                // Live Stream Option
                _buildUploadOption(
                  icon: Icons.live_tv_outlined,
                  title: 'Go Live',
                  subtitle: 'Start live streaming',
                  onTap: () {
                    Get.snackbar(
                      'Info',
                      'Live streaming coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Upload Guidelines
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upload Guidelines',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '• Videos should be 15 seconds to 3 minutes long\n'
                  '• Use good lighting and clear audio\n'
                  '• Add engaging captions and hashtags\n'
                  '• Follow community guidelines\n'
                  '• Original content performs better',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: AppColors.secondary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
