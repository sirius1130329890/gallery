import 'package:flutter/material.dart';
import 'package:gallery/presentation/pages/photo_screen.dart';
import 'package:gallery/presentation/widgets/photo_card.dart';
import 'package:provider/provider.dart';

import '../blocs/photo_bloc.dart';

class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.watch<PhotoBloc>().isLoading) {
      context.watch<PhotoBloc>().fetchPhotos();
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Unsplash Gallery'),
        ),
        body: context.watch<PhotoBloc>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: context.watch<PhotoBloc>().photos.length,
                itemBuilder: (context, index) {
                  final photo = context.watch<PhotoBloc>().photos[index];
                  return PhotoCard(
                      photo: photo,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotoScreen(photo: photo),
                          ),
                        );
                      });
                },
              ));
  }
}
