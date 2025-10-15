import 'package:flutter/material.dart';
import '../models/photo_item.dart';

class GalleryState extends ChangeNotifier {
  final List<PhotoItem> _photos = [
    PhotoItem(
      id: '1',
      imageUrl: 'https://picsum.photos/id/10/400/400',
      title: 'Pemandangan Hutan',
      description: 'Foto hutan pinus yang diambil pada pagi hari yang sejuk.',
    ),
    PhotoItem(
      id: '2',
      imageUrl: 'https://picsum.photos/id/20/400/400',
      title: 'Jalanan Berliku',
      description: 'Jalan aspal di pegunungan dengan pemandangan indah di sekelilingnya.',
    ),
    PhotoItem(
      id: '3',
      imageUrl: 'https://picsum.photos/id/30/400/400',
      title: 'Secangkir Kopi',
      description: 'Menikmati secangkir kopi hangat di sebuah kafe pada sore hari.',
    ),
    PhotoItem(
      id: '4',
      imageUrl: 'https://picsum.photos/id/40/400/400',
      title: 'Laptop & Bekerja',
      description: 'Suasana kerja yang tenang dan produktif di depan laptop.',
    ),
     PhotoItem(
      id: '5',
      imageUrl: 'https://picsum.photos/id/50/400/400',
      title: 'Pantai Tropis',
      description: 'Pemandangan pantai dengan pasir putih dan air laut yang jernih.',
    ),
    PhotoItem(
      id: '6',
      imageUrl: 'https://picsum.photos/id/60/400/400',
      title: 'Gunung Bersalju',
      description: 'Puncak gunung megah yang tertutup oleh salju abadi.',
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