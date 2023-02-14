import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showing/theme/font.dart';

import '../photo/photolist.dart';
import '../image_and_camera/image_edit_page.dart';
import '../image_and_camera/take_picture_page.dart';
import 'package:showing/photo/mainlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final picker = ImagePicker();

  File? _imageFromGallery;

  Future getImage(ImageSource imageSource) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 21.5),
          child: IconButton(
            icon: const Icon(Icons.photo_camera_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TakePicturePage(),
                ),
              );
            },
          ),
        ),
        title: Center(
          child: Text(
            'Home',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.5),
              child: IconButton(
                icon: const Icon(Icons.photo_outlined),
                onPressed: () async {
                  final image =
                      await picker.pickImage(source: ImageSource.gallery);
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImageEditPage(
                        // Pass the automatically generated path to
                        // the DisplayPictureScreen widget.
                        imagePath: image!.path,
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.5),
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: newFilter(),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 30.0),
                width: MediaQuery.of(context).size.width,
                child: DefaultTabController(length: 5, child: _tabBar)),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    padding: const EdgeInsets.only(top: 17),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        tabphoto(),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        isScrollable: true,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        tabs: [
          Container(
              width: 48,
              child: Center(child: Text('All', style: Lora_Body_Large()))),
          Container(
              width: 48,
              child: Center(child: Text('Hot', style: Lora_Body_Large()))),
          Container(
              width: 48,
              child: Center(child: Text('Selfie', style: Lora_Body_Large()))),
          Container(
              width: 48,
              child: Center(child: Text('Food', style: Lora_Body_Large()))),
          Container(
              width: 48,
              child: Center(child: Text('Scene', style: Lora_Body_Large()))),
        ],
      );
}
