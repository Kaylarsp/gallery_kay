import 'package:flutter/material.dart';
import 'package:gallery_kay/state/gallery_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final galleryState = Provider.of<GalleryState>(context);
    final photos = galleryState.photos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery App'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromRGBO(243, 126, 173, 1),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          final isLiked = galleryState.isLiked(photo.id);

          return GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(photo.title),
              trailing: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  galleryState.toggleLike(photo.id);
                },
              ),
            ),
            child: Image.network(
              photo.url,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}