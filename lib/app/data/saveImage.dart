import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> saveImageToLocalFile(Uint8List binaryData) async {
  // Check if storage permission is granted
  var status = await Permission.storage.status;
  if (status != PermissionStatus.granted) {
    // Request storage permission
    status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Storage permission not granted');
    }
  }

  // Decode binary data to image
  img.Image? image = img.decodeImage(binaryData);

  // Get the local storage directory
  final directory = await getExternalStorageDirectory();
  if (directory == null) {
    throw Exception('Unable to access local storage directory');
  }

  // Generate a unique filename
  String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
  String filePath = '${directory.path}/$fileName';

  // Save the image to local storage
  File(filePath).writeAsBytesSync(img.encodeJpg(image!));

  // Print the file path (you can remove this in the final version)
  print('Image saved to: $filePath');
}

// Example usage:
// Uint8List binaryData = ... // Your binary data
// await saveImageToLocalFile(binaryData);
