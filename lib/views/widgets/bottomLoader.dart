import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({
    super.key,
    required this.hasError,
    required this.onRetry,
  });

  final bool hasError;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: hasError
            ? TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Gagal memuat, coba lagi'),
        )
            : const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}