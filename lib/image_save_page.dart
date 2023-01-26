import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:share_plus/share_plus.dart';

import 'package:showwing/theme/font.dart';

import 'page/homepage.dart';

class ImageSavePage extends StatefulWidget {
  const ImageSavePage(
      {super.key, required this.imagePath, required this.saveDate});
  final String imagePath;
  final String saveDate;

  @override
  ImageSavePageState createState() =>
      ImageSavePageState(imagePath: this.imagePath, saveDate: this.saveDate);
}

class ImageSavePageState extends State<ImageSavePage> {
  ImageSavePageState({
    Key? key,
    required this.imagePath,
    required this.saveDate,
  });

  final String imagePath;
  final String saveDate;
  final String albumName = 'Media';

  File? _image;
  XFile? _imageXFile;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() async {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Saved',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          // Camera Front-Rear Controller
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
            icon: Column(
              children: [
                Icon(
                  Icons.check,
                  size: 28.5,
                ),
                Text(
                  "finish",
                  style: Lora_Label_Small(),
                ),
              ],
            ),
          )
        ],
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, bottom: 10),
            child: Image.file(File(imagePath)),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                saveDate,
                style: Noto_Body2_Large(),
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Column(
                      children: [
                        Icon(MdiIcons.autoFix),
                        Text(
                          'Edit',
                          style: Lora_Label_Small(),
                        )
                      ],
                    ),
                  )),
              InkWell(
                  onTap: () {
                    _imageXFile = XFile(File(imagePath).path);
                    Share.shareXFiles([_imageXFile!]);
                  },
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Column(
                      children: [
                        Icon(Icons.ios_share),
                        Text(
                          'Share',
                          style: Lora_Label_Small(),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
