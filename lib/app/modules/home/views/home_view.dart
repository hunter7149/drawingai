import 'package:drawingai/app/data/drawCommand.dart';
import 'package:drawingai/app/data/myPainter.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
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
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      Color color = await showColorPickerDialog(
                          context, controller.selectedColor.value);
                      print(color);
                      controller.stokeColorUpdater(color: color);
                    },
                    child: customButton(icon: Icons.edit),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // controller.dcontroller.clear();
                    },
                    child: customButton(icon: FontAwesomeIcons.eraser),
                  ),
                  Obx(
                    () => Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      // height: 60,
                      child: Column(children: [
                        Text(
                          "Size: (${controller.strokeWidth.value})",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.decreaseStrokeWidth();
                                controller.dcontroller.setStyle(
                                    strokeWidth: controller.strokeWidth.value);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.increaseStrokeWidth();
                                controller.dcontroller.setStyle(
                                    strokeWidth: controller.strokeWidth.value);
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  customButtonWithImage(asset: "assets/images/curve.png"),
                  SizedBox(
                    height: 10,
                  ),
                  customButtonWithImage(asset: "assets/images/slash.png"),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(icon: FontAwesomeIcons.circle),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(icon: FontAwesomeIcons.square),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(icon: CupertinoIcons.triangle),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(icon: CupertinoIcons.triangle_righthalf_fill)
                ],
              ),
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.width > 600 ? 18 : 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(color: Colors.grey.shade400),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          // width: MediaQuery.of(context).size.width - 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.dcontroller.undo();
                                  },
                                  child: CustomBorderedButton(
                                      title: "Undo",
                                      icon: FontAwesomeIcons.undo),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.dcontroller.redo();
                                  },
                                  child: CustomBorderedButton(
                                      title: "Redo",
                                      icon: FontAwesomeIcons.redo),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.dcontroller.clear();
                                  },
                                  child: CustomBorderedButton(
                                      title: "Clear",
                                      icon: FontAwesomeIcons.noteSticky),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.lockStatusUpdater();
                                  },
                                  child: CustomBorderedButton(
                                      title: "Lock",
                                      icon: FontAwesomeIcons.unlock,
                                      noBorder: true),
                                )
                              ]),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var image = await controller.dcontroller
                                      .getImageData();
                                  print(image.runtimeType);
                                },
                                child: CustomBorderedButton(
                                    title: "Download",
                                    icon: Icons.download,
                                    noBorder: true),
                              )
                            ],
                          ),
                        ),
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

  static CustomBorderedButton(
      {required String title,
      required IconData icon,
      bool? noBorder,
      double? hPadding}) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:
              LinearGradient(colors: [Color(0xFF5800A5), Color(0xFFA60053)])),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hPadding ?? 16, vertical: 10),
        decoration: noBorder == null
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade900)
            : noBorder
                ? BoxDecoration()
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade900),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ]),
      ),
    );
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
