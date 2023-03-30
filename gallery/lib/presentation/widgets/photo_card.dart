import 'package:flutter/material.dart';

import '../../data/models/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  const PhotoCard({
    required this.photo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: photo.id,
              child: Image.network(
                photo.imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by ${photo.author}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}