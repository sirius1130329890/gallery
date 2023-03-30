import 'package:flutter/cupertino.dart';

import '../../data/models/photo.dart';
import '../../data/repositories/photo_repository.dart';

class PhotoBloc extends ChangeNotifier {
  final PhotoRepository _photoRepository = PhotoRepository();

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchPhotos() async {
    try {
      _photos = await _photoRepository.getPhotos();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}