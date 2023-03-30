import '../models/photo.dart';
import '../providers/photo_provider.dart';

class PhotoRepository {
  final DataProvider _dataProvider = DataProvider();

  Future<List<Photo>> getPhotos() async {
    final PhotoList photoList = await _dataProvider.fetchPhotos();
    return photoList.photos;
  }
}