import 'package:drawingai/app/data/drawCommand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DrawingController dcontroller =
      DrawingController(config: DrawConfig(contentType: Type));
  // Rx<Color> selectedColor = Colors.red.obs;
  // RxDouble strokeWidth = 10.0.obs;
  // RxList<DrawCommand> commands = <DrawCommand>[].obs;
  // final currentPoints = <Offset>[];
  // void selectColor(Color color) {
  //   selectedColor.value = color;
  // }

  // RxInt lastUpdateTime = 0.obs;

  // // Timestamp of the last drawing update
  // RxInt lastDrawingTime = 0.obs;
  // bool newSegmentStarted = false;
  // void setStrokeWidth(double width) {
  //   strokeWidth.value = width;
  // }

  // void addCommand(DrawCommand command) {
  //   commands.add(command);
  //   // commands.refresh();
  // }

  // void undo() {
  //   if (commands.isNotEmpty) {
  //     commands.removeLast();
  //   }
  // }

  // void clearCanvas() {
  //   commands.clear();
  //   commands.refresh();
  // }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
