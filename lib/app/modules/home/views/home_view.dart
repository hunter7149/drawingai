import 'package:drawingai/app/data/drawCommand.dart';
import 'package:drawingai/app/data/myPainter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.grey.shade900),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                customButton(icon: Icons.edit_outlined),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    controller.dcontroller.clear();
                  },
                  child: customButton(icon: FontAwesomeIcons.eraser),
                ),
                SizedBox(
                  height: 60,
                ),
                customButtonWithImage(asset: "assets/images/curve.png"),
                SizedBox(
                  height: 10,
                ),
                customButton(icon: Icons.draw)
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          // decoration: BoxDecoration(color: Colors.grey),
                          )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: DrawingBoard(
                        controller: controller.dcontroller,
                        background: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.white),
                        showDefaultActions: false,

                        /// 开启默认操作选项
                        showDefaultTools: false,

                        /// 开启默认工具栏
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Column(
      //   children: [
      //     // Canvas area
      //     Obx(
      //       () => Container(
      //         height: 400,
      //         width: double.maxFinite,
      //         // color: Colors.white,
      //         child: GestureDetector(
      //           behavior: HitTestBehavior.translucent,
      //           onPanUpdate: (details) {
      //             RenderBox renderBox =
      //                 context.findRenderObject() as RenderBox;

      //             // Add the current point to the list of points
      //             controller.currentPoints
      //                 .add(renderBox.globalToLocal(details.globalPosition));
      //             // controller.currentPoints.add(details.globalPosition);

      //             // Create a new DrawCommand when a certain number of points are accumulated
      //             if (controller.currentPoints.length >= 2) {
      //               controller.addCommand(
      //                 DrawCommand(
      //                   List.from(controller.currentPoints),
      //                   controller.selectedColor.value,
      //                   controller.strokeWidth.value,
      //                 ),
      //               );

      //               // Clear the current points list after creating a DrawCommand
      //               controller.currentPoints.clear();
      //             }
      //           },
      //           child: CustomPaint(
      //             painter: MyPainter(controller.commands.value),
      //           ),
      //         ),
      //       ),
      //     ), // Controls
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () => controller.undo(),
      //           child: Text('Undo'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () => controller.clearCanvas(),
      //           child: Text('Clear Canvas'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             // Save image logic
      //             // You can use the image library or flutter_image_compress to save the image.
      //           },
      //           child: Text('Download'),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    ));
  }

  static customButton({required IconData icon}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.purple),
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(5)),
      child: Icon(
        icon,
        color: Colors.grey.shade100,
        size: 40,
      ),
    );
  }

  static customButtonWithImage({required String asset}) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.purple),
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(5)),
        child: Image.asset(
          asset,
          height: 40,
          color: Colors.white,
        ));
  }
}
