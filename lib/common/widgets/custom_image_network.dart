import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_quiz/common/common.dart';
import 'package:flutter_test_quiz/utils/utils.dart';

/// Circular avatar framed by a raised neumorphic ring.
///
/// Falls back to the [name] initials when the [url] is empty or fails.
class CustomImageNetwork extends StatelessWidget {
  final String? url;
  final String? name;
  final double size;

  const CustomImageNetwork.avatar(
    this.url, {
    super.key,
    this.name,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    final placeholder = _AvatarPlaceholder(name: name, size: size);

    return NeumorphicContainer(
      shape: BoxShape.circle,
      depth: 4,
      padding: const EdgeInsets.all(4),
      child: ClipOval(
        child: SizedBox.square(
          dimension: size,
          child: url.nullIfBlank == null
              ? placeholder
              : CachedNetworkImage(
                  imageUrl: url!,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => placeholder,
                  errorWidget: (_, _, _) => placeholder,
                  fadeInDuration: const Duration(milliseconds: 200),
                ),
        ),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  final String? name;
  final double size;

  const _AvatarPlaceholder({required this.name, required this.size});

  @override
  Widget build(BuildContext context) {
    final initials = name.initials;

    return NeumorphicContainer.pressed(
      shape: BoxShape.circle,
      child: Center(
        child: initials.isEmpty
            ? Icon(
                Icons.person_rounded,
                color: AppColors.neutral400,
                size: size / 2,
              )
            : Text(
                initials,
                style: AppTextStyle.s16w700
                    .copyWith(color: AppColors.primary400),
              ),
      ),
    );
  }
}
