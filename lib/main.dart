import 'package:flutter/material.dart';
import 'package:food_recognizer_app/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'providers/image_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ImageState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
