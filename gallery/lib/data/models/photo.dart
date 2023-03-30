class Photo {
  final String id;
  final String author;
  final String imageUrl;
  final String fullSizeImageUrl;
  final String description;

  Photo({
    required this.id,
    required this.author,
    required this.imageUrl,
    required this.fullSizeImageUrl,
    required this.description,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      author: json['user']['name'],
      imageUrl: json['urls']['raw'],
      fullSizeImageUrl: json['urls']['full'],
      description: json['description'] ?? '',
    );
  }
}

class PhotoList {
  final List<Photo> photos;

  PhotoList({required this.photos});

  factory PhotoList.fromJson(List<dynamic> json) {
    List<Photo> photos = json.map((photo) => Photo.fromJson(photo)).toList();
    return PhotoList(photos: photos);
  }
}