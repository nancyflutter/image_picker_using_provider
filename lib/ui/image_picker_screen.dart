import 'package:flutter/material.dart';
import 'package:image_picker_using_provider/business_logic/image_picker_provider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Demo'),
        actions: [
          IconButton(
            tooltip: "Clear all",
            icon: const Icon(Icons.clear),
            onPressed: () {
              Provider.of<ImagePickerProvider>(context, listen: false).clearImages();
            },
          ),
        ],
      ),
      body: Consumer<ImagePickerProvider>(
        builder: (context, imageProvider, _) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: imageProvider.selectedImages.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () {
                    ImagePickerProvider().pickImage(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.add),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Remove Image'),
                        content: const Text('Do you want to remove this image?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<ImagePickerProvider>(context, listen: false).removeImage(imageProvider.selectedImages[index - 1]);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Remove'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: FileImage(imageProvider.selectedImages[index - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
