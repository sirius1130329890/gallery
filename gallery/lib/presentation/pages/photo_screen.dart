import 'package:flutter/material.dart';

import '../../data/models/photo.dart';

class PhotoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: photo.id,
          child: Image.network(
            photo.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}