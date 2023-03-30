import 'package:flutter/material.dart';
import 'package:gallery/presentation/blocs/photo_bloc.dart';
import 'package:gallery/presentation/pages/photo_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhotoBloc>(
        create: (context) => PhotoBloc(),
      child: MaterialApp(
        title: 'Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PhotoListScreen(),
      ),
    );
  }
}