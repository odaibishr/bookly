import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CashedNetwrokImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWiget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
