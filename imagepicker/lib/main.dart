import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

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
  String _imagePath = 'asset/img/food/box3.jpeg';
  double? _width;
  double? _height;
  double? _depth;

  @override
  void initState() {
    super.initState();
    _getImageSize();
  }

  Future<void> _getImageSize() async {
    final ByteData byteData = await rootBundle.load(_imagePath);
    final File file = File('${(await getTemporaryDirectory()).path}/box3.jpeg');
    await file.writeAsBytes(byteData.buffer.asUint8List());

    final image = img.decodeImage(file.readAsBytesSync());
    final grayImage = img.grayscale(image!);
    final blurredImage = img.gaussianBlur(grayImage, 5);
    final cannyEdges = img.copyCrop(img.gaussianBlur(blurredImage, 5), 0, 0, image.width, image.height);
    final contours = img.findContours(cannyEdges);

    double maxArea = 0;
    img.BoundingRect? maxBoundingBox;

    for (var contour in contours) {
      final area = contour.length;
      if (area > maxArea) {
        maxArea = area;
        maxBoundingBox = img.findBoundingRect(contour);
      }
    }

    setState(() {
      _width = maxBoundingBox?.width.toDouble() / 10; // cm로 변환
      _height = maxBoundingBox?.height.toDouble() / 10; // cm로 변환
      _depth = maxArea / 10; // cm로 변환
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
            Image.asset(_imagePath),
            SizedBox(height: 16),
            Text('Width: ${_width?.toStringAsFixed(2) ?? "N/A"} cm'),
            SizedBox(height: 8),
            Text('Height: ${_height?.toStringAsFixed(2) ?? "N/A"} cm'),
            SizedBox(height: 8),
            Text('Depth: ${_depth?.toStringAsFixed(2) ?? "N/A"} cm'),
          ],
        ),
      ),
    );
  }
}
