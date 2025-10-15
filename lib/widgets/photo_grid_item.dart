import 'package:flutter/material.dart';
import '../models/photo_item.dart';

class PhotoGridItem extends StatelessWidget {
  final PhotoItem photo;
  final bool isLiked;
  final VoidCallback onLikeToggle;

  const PhotoGridItem({
    super.key,
    required this.photo,
    required this.isLiked,
    required this.onLikeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: GridTile(
        footer: GridTileBar(
          title: Text(
            photo.title,
            style: const TextStyle(fontSize: 14),
          ),
          trailing: IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.redAccent : Colors.white,
            ),
            onPressed: onLikeToggle,
          ),
        ),
        child: Image.network(
          photo.imageUrl,
          fit: BoxFit.cover,
          // Menambahkan loading builder untuk user experience yang lebih baik
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          // Menambahkan error builder jika gambar gagal dimuat
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 48, color: Colors.grey);
          },
        ),
      ),
    );
  }
}