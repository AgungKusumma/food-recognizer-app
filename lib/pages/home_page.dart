import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_recognizer_app/providers/image_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final permission = source == ImageSource.camera
        ? Permission.camera
        : Permission.photos;

    if (await permission.request().isGranted) {
      final picked = await ImagePicker().pickImage(source: source);
      if (picked != null) {
        final file = File(picked.path);
        context.read<ImageState>().setImage(file);
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Permission denied")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = context.watch<ImageState>().image;

    return Scaffold(
      appBar: AppBar(title: const Text('Food Recognizer')),
      body: Center(
        child: image == null
            ? const Text("No image selected")
            : Image.file(image),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "camera",
            onPressed: () => _pickImage(context, ImageSource.camera),
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: () => _pickImage(context, ImageSource.gallery),
            child: const Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}
