import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/gallery_state.dart';
import '../widgets/photo_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryState = context.watch<GalleryState>();
    final photos = galleryState.photos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: const Color.fromARGB(255, 211, 128, 128)
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 1, // Membuat item menjadi kotak sempurna
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          final isLiked = galleryState.isLiked(photo.id);

          return PhotoGridItem(
            photo: photo,
            isLiked: isLiked,
            onLikeToggle: () {
              galleryState.toggleLike(photo.id);
            },
          );
        },
      ),
    );
  }
}