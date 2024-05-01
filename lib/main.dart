import 'package:flutter/material.dart';
import 'package:image_picker_using_provider/business_logic/image_picker_provider.dart';
import 'package:image_picker_using_provider/ui/image_picker_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePickerProvider>( create: (context) => ImagePickerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Picker Demo using provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
