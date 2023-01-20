import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showwing/theme/font.dart';

import '../image_edit_page.dart';
import '../take_picture_page.dart';

class MainPage extends StatefulWidget {
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
              padding: EdgeInsets.only(right: 16.5),
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
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/hwamin');
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 390,
                          width: double.infinity,
                          child: Container(
                              child: Image.asset(
                            'assets/images/hwamin.png',
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 18, 0, 0),
                          child: SizedBox(
                            width: 313,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hwamini',
                                  style: Lora_Title_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '@hwa.min',
                                  style: Lora_Label_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '햇빛에서 사진 찍는 것을 좋아해요.',
                                  style: Noto_Body2_Large(),
                                ),
                                Text(
                                  'I like to be taken photo in sunlight.',
                                  style: Noto_Body2_Large(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/ming');
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 390,
                          width: double.infinity,
                          child: Container(
                              child: Image.asset(
                            'assets/images/ming.png',
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(17, 18, 0, 0),
                          child: SizedBox(
                            width: 313,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Treeming Bird',
                                  style: Lora_Title_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '@tmb_ming',
                                  style: Lora_Label_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '어두운 감성으로 저만의 색감을 표현해요.',
                                  style: Noto_Body2_Large(),
                                ),
                                Text(
                                  '자연과 함께 사진을 많이 찍었어요.',
                                  style: Noto_Body2_Large(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                InkWell(
                  onTap: (() => Navigator.pushNamed(context, '/okio')),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 390,
                          width: double.infinity,
                          child: Container(
                              child: Image.asset(
                            'assets/images/okio.png',
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 18, 0, 0),
                          child: SizedBox(
                            width: 313,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kyong',
                                  style: Lora_Title_Large(),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '@0ki0h',
                                  style: Lora_Label_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '카페 가는 것을 좋아해요',
                                  style: Noto_Body2_Large(),
                                ),
                                Text(
                                  '주로 우드한 인테리어 카페를 많이 가는 것 같아요.',
                                  style: Noto_Body2_Large(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/din');
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 390,
                          width: double.infinity,
                          child: Container(
                              child: Image.asset(
                            'assets/images/sullendin.png',
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 18, 0, 0),
                          child: SizedBox(
                            width: 313,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Catgirl',
                                  style: Lora_Title_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '@sullendin',
                                  style: Lora_Label_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '스타일링 하는 것이 재밌어요.',
                                  style: Noto_Body2_Large(),
                                ),
                                Text(
                                  '다양한 포즈를 취하고 저만의 느낌을 주로 표현해요.',
                                  style: Noto_Body2_Large(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 58,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/boy');
                  },
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 390,
                          width: double.infinity,
                          child: Container(
                              child: Image.asset(
                            'assets/images/boy.png',
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(17, 18, 0, 0),
                          child: SizedBox(
                            width: 313,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dajung',
                                  style: Lora_Title_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '@awanderingboy',
                                  style: Lora_Label_Large(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '쇼핑몰 운영하면서 여러 포즈와 보정을 많이 경험했어요.',
                                  style: Noto_Body2_Large(),
                                ),
                                Text(
                                  '스타일링에 따른 보정 분위기도 저의 색으로 나타냈어요.',
                                  style: Noto_Body2_Large(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
