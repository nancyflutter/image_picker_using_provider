import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImagePickerProvider extends ChangeNotifier {
  final List<File> _selectedImages = [];

  List<File> get selectedImages => _selectedImages;

  void addImage(File image) {
    _selectedImages.add(image);
    notifyListeners();
  }

  void removeImage(File image) {
    _selectedImages.remove(image);
    notifyListeners();
  }

  void clearImages() {
    _selectedImages.clear();
    notifyListeners();
  }

  void pickImage(BuildContext context) async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Provider.of<ImagePickerProvider>(context, listen: false).addImage(File(pickedImage.path));
    }
  }
}
