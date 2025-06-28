import 'dart:io';

import 'package:flutter/foundation.dart';

class ImageState with ChangeNotifier {
  File? _image;

  File? get image => _image;

  void setImage(File? newImage) {
    _image = newImage;
    notifyListeners();
  }

  void clear() {
    _image = null;
    notifyListeners();
  }
}
