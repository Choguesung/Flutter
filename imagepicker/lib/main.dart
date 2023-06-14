import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object Dimensions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ObjectDimensionsPage(),
    );
  }
}

class ObjectDimensionsPage extends StatefulWidget {
  @override
  _ObjectDimensionsPageState createState() => _ObjectDimensionsPageState();
}

class _ObjectDimensionsPageState extends State<ObjectDimensionsPage> {
  File? _imageFile;
  double? _width;
  double? _height;

  Future<void> _getImageAndProcess() async {
    final imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (imageFile == null) return;

    final tempDir = await getTemporaryDirectory();
    final imagePath = '${tempDir.path}/temp.jpg';

    await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      imagePath,
      quality: 90,
    );

    final file = File(imagePath);
    final decodedImage = await decodeImageFromList(file.readAsBytesSync());

    setState(() {
      _imageFile = file;
      _width = decodedImage.width.toDouble();
      _height = decodedImage.height.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Dimensions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null) ...[
              Image.file(_imageFile!),
              SizedBox(height: 16),
            ],
            if (_width != null && _height != null) ...[
              Text('Width: $_width'),
              SizedBox(height: 8),
              Text('Height: $_height'),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImageAndProcess,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
