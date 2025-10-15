import 'package:flutter/material.dart';
import '../models/photo_item.dart';

class GalleryState extends ChangeNotifier {
  final List<PhotoItem> _photos = [
    PhotoItem(
      id: '1',
      imageUrl: 'https://i.pinimg.com/736x/60/cd/9f/60cd9f72d81eccef3c0e6ac1dddf7108.jpg',
      title: '',
      description: '',
    ),
    PhotoItem(
      id: '2',
      imageUrl: 'https://i.pinimg.com/736x/20/51/fc/2051fc1e998f2d0089675fae029d76a0.jpg',
      title: '',
      description: '',
    ),
    PhotoItem(
      id: '3',
      imageUrl: 'https://i.pinimg.com/1200x/70/1e/45/701e455f4e6504e32c6b8461f12892b8.jpg',
      title: '',
      description: '',
    ),
    PhotoItem(
      id: '4',
      imageUrl: 'https://i.pinimg.com/736x/c3/4b/15/c34b1593772228f873a810aef1571352.jpg',
      title: '',
      description: '',
    ),
     PhotoItem(
      id: '5',
      imageUrl: 'https://i.pinimg.com/1200x/ec/73/16/ec7316268a6aa7f154fb397c24b0ffcc.jpg',
      title: '',
      description: '',
    ),
    PhotoItem(
      id: '6',
      imageUrl: 'https://i.pinimg.com/1200x/a8/b1/57/a8b157f1b7017dd2f6e02b93ec92db65.jpg',
      title: '',
      description: '',
    ),
  ];

  // Set untuk menyimpan ID foto yang di-like
  final Set<String> _likedPhotoIds = {};

  // Getter untuk mengakses daftar foto dari luar
  List<PhotoItem> get photos => _photos;

  // Getter untuk mengakses foto yang di-like
  Set<String> get likedPhotoIds => _likedPhotoIds;

  // Fungsi untuk mengecek apakah sebuah foto di-like
  bool isLiked(String photoId) {
    return _likedPhotoIds.contains(photoId);
  }

  // Fungsi untuk toggle like/unlike
  void toggleLike(String photoId) {
    if (isLiked(photoId)) {
      _likedPhotoIds.remove(photoId);
    } else {
      _likedPhotoIds.add(photoId);
    }
    // Beri tahu widget yang "mendengarkan" bahwa ada perubahan data!
    notifyListeners();
  }
}