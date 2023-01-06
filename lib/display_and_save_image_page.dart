import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showwing/theme/font.dart';

import 'page/homepage.dart';

class DisplayAndSaveImagePage extends StatefulWidget {
  const DisplayAndSaveImagePage({super.key, required this.imagePath});
  final String imagePath;

  DisplayAndSaveImagePageState createState() =>
      DisplayAndSaveImagePageState(imagePath: this.imagePath);
}

class DisplayAndSaveImagePageState extends State<DisplayAndSaveImagePage> {
  DisplayAndSaveImagePageState({
    Key? key,
    required this.imagePath,
  });

  final String imagePath;
  final String albumName = 'Media';

  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            '',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          // Camera Front-Rear Controller
          IconButton(
            onPressed: () {
              GallerySaver.saveImage(imagePath, albumName: albumName)
                  .then((value) => print('>>>> save value= $value'))
                  .catchError((err) {
                print('error :( $err');
              });
            },
            icon: Icon(Icons.save),
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
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width - 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Text(
                      "Selfie",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Sea",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Mood",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Natuer",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Insta",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Example",
                      style: Noto_Label_Large(),
                    ),
                    Icon(
                      Icons.rectangle,
                      size: 70,
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  getImage(ImageSource.gallery);
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.black45,
                      size: 60,
                    ),
                    Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 75,
                    height: 75,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainPage()),
                        (route) => false);
                  },
                  child: Image.asset('assets/images/showwing_logo.png')),
            ],
          ),
        ],
      ),
    );
  }
}
