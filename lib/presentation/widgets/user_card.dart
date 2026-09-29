import 'package:flutter/material.dart';
import 'package:gias_flutter_test/core/constants/color_constants.dart';
import 'package:gias_flutter_test/core/constants/text_style_constants.dart';

class UserCard extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final int userId;
  final VoidCallback? onTap;

  const UserCard({
    super.key,
    required this.username,
    required this.avatarUrl,
    required this.userId,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConstants.grey200),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.black03,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: ColorConstants.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    avatarUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 48,
                        height: 48,
                        color: ColorConstants.grey300,
                        child: const Icon(Icons.person, color: ColorConstants.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyleConstants.geistMonoBold.copyWith(
                          fontSize: 16,
                          color: ColorConstants.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'id: $userId | github.com/$username',
                        style: TextStyleConstants.geistRegular.copyWith(
                          fontSize: 13,
                          color: ColorConstants.grey600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right_rounded, color: ColorConstants.grey400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
