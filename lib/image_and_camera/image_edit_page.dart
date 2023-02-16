import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart' as impk;
import 'package:path/path.dart';
import 'package:showing/theme/font.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:intl/intl.dart';

import 'color_filter_generator.dart';
import 'image_save_page.dart';
import '../page/homepage.dart';

class ImageEditPage extends StatefulWidget {
  const ImageEditPage({super.key, required this.imagePath});
  final String imagePath;

  ImageEditPageState createState() =>
      ImageEditPageState(imagePath: this.imagePath);
}

class ImageEditPageState extends State<ImageEditPage> {
  ImageEditPageState({
    Key? key,
    required this.imagePath,
  });

  final String imagePath;
  final String albumName = 'Media';

  String dateFormat = DateFormat("HH:mm:ss\nyyyy/MM/DD").format(DateTime.now());

  File? _image;

  int selectedMode = 0; // 0: 미선택, 1: 필터 선택, 2: 편집 선택, 3: crop 선택
  int selectedEditMode =
      0; // selectedMode가 2일때, 0: 미선택, 1: brightness 선택 2: saturation 선택 3: hue 선택

  double _minAvailableBrightnessOffset = 0.0;
  double _maxAvailableBrightnessOffset = 1.0;
  double _currentBrightnessOffset = 0.0;

  double _minAvailableSaturationOffset = 0.0;
  double _maxAvailableSaturationOffset = 1.0;
  double _currentSaturationOffset = 0.0;

  double _minAvailableHueOffset = 0.0;
  double _maxAvailableHueOffset = 1.0;
  double _currentHueOffset = 0.0;

  Future getImage(impk.ImageSource imageSource) async {
    final image = await impk.ImagePicker().pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
  }

  late final List<bool> _selectedColorFilter = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List colorFilterList = [
    ColorFilter.mode(Colors.transparent, BlendMode.dstOver),
    ColorFilter.mode(Colors.black, BlendMode.color),
    ColorFilter.mode(Colors.red, BlendMode.color),
    ColorFilter.mode(Colors.orange, BlendMode.color),
    ColorFilter.mode(Colors.yellow, BlendMode.color),
    ColorFilter.mode(Colors.green, BlendMode.color),
    ColorFilter.mode(Colors.blue, BlendMode.color),
    ColorFilter.mode(Colors.indigo, BlendMode.color),
    ColorFilter.mode(Colors.purple, BlendMode.color),
  ];

  List colorFilterTextList = [
    'none',
    'black',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'indigo',
    'purple'
  ];

  int selectedColorFilter = 0;

  Widget ImageFilter({brightness, saturation, hue, child}) {
    return ColorFiltered(
        colorFilter:
            ColorFilter.matrix(ColorFilterGenerator.brightnessAdjustMatrix(
          value: brightness,
        )),
        child: ColorFiltered(
            colorFilter:
                ColorFilter.matrix(ColorFilterGenerator.saturationAdjustMatrix(
              value: saturation,
            )),
            child: ColorFiltered(
              colorFilter:
                  ColorFilter.matrix(ColorFilterGenerator.hueAdjustMatrix(
                value: hue,
              )),
              child: child,
            )));
  }

  Widget imageEditSelector(BuildContext context) {
    // 이미지 편집창을 총괄하는 위젯
    if (selectedMode == 0) {
      // 미선택
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedMode = 1;
              });
            },
            child: Column(
              children: [
                Text("필터"),
                Icon(Icons.color_lens),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedMode = 2;
              });
            },
            child: Column(
              children: [
                Text("수정"),
                Icon(Icons.imagesearch_roller),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedMode = 3;
              });
            },
            child: Column(
              children: [
                Text("컷팅"),
                Icon(Icons.crop),
              ],
            ),
          ),
        ],
      );
    } else if (selectedMode == 1) {
      // 1: 필터 선택
      return ListView.builder(
        itemCount: colorFilterList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedMode = 0;
                  selectedColorFilter = index;
                });
              },
              child: Column(
                children: [
                  Text(colorFilterTextList[index]),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 8,
                    width: MediaQuery.of(context).size.width / 8,
                    child: ColorFiltered(
                      colorFilter: colorFilterList[index],
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    } else if (selectedMode == 2) {
      // 2: 편집 선택
      if (selectedEditMode == 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedMode = 0;
                });
              },
              child: Column(
                children: [
                  Text("Back"),
                  Icon(Icons.arrow_back),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedEditMode = 1;
                });
              },
              child: Column(
                children: [
                  Text("Brightness"),
                  Icon(Icons.brightness_6),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedEditMode = 2;
                });
              },
              child: Column(
                children: [
                  Text("saturation"),
                  Icon(Icons.hub_rounded),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedEditMode = 3;
                });
              },
              child: Column(
                children: [
                  Text("hue"),
                  Icon(Icons.hub_outlined),
                ],
              ),
            ),
          ],
        );
      } else if (selectedEditMode == 1) {
        // 밝기 조절
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedEditMode = 0;
                  });
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(
              child: Slider(
                value: _currentBrightnessOffset,
                min: _minAvailableBrightnessOffset,
                max: _maxAvailableBrightnessOffset,
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                onChanged: (value) async {
                  setState(() {
                    _currentBrightnessOffset = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _currentBrightnessOffset.toStringAsFixed(1) + 'x',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      } else if (selectedEditMode == 2) {
        // saturation 조절
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedEditMode = 0;
                  });
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(
              child: Slider(
                value: _currentSaturationOffset,
                min: _minAvailableSaturationOffset,
                max: _maxAvailableSaturationOffset,
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                onChanged: (value) async {
                  setState(() {
                    _currentSaturationOffset = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _currentBrightnessOffset.toStringAsFixed(1) + 'x',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      } else if (selectedEditMode == 3) {
        // hue 조절
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedEditMode = 0;
                  });
                },
                icon: Icon(Icons.arrow_back)),
            Expanded(
              child: Slider(
                value: _currentHueOffset,
                min: _minAvailableHueOffset,
                max: _maxAvailableHueOffset,
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
                onChanged: (value) async {
                  setState(() {
                    _currentHueOffset = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _currentBrightnessOffset.toStringAsFixed(1) + 'x',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      } else {
        return Text("ERROR");
      }
    } else if (selectedMode == 3) {
      return Container();
    } else {
      return Text("ERROR");
    }
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
            'Filter',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          // Camera Front-Rear Controller
          IconButton(
            onPressed: () {
              dateFormat =
                  DateFormat("HH:mm:ss\nyyyy/MM/DD").format(DateTime.now());

              GallerySaver.saveImage(imagePath, albumName: albumName)
                  .then((value) => print('>>>> save value= $value'))
                  .catchError((err) {
                print('error :( $err');
              });

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ImageSavePage(
                    // Pass the automatically generated path to
                    // the DisplayPictureScreen widget.
                    imagePath: this.imagePath,
                    saveDate: this.dateFormat,
                  ),
                ),
              );
            },
            icon: Icon(Icons.check),
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
            child: ImageFilter(
              brightness: _currentBrightnessOffset,
              saturation: _currentSaturationOffset,
              hue: _currentHueOffset,
              child: ColorFiltered(
                  colorFilter: colorFilterList[selectedColorFilter],
                  child: Image.file(File(imagePath))),
            ),
          )),
          SizedBox(
              height: MediaQuery.of(context).size.height / 11,
              width: MediaQuery.of(context).size.width - 50,
              child: imageEditSelector(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  getImage(impk.ImageSource.gallery);
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
                  child: Image.asset('assets/images/showing_logo.png')),
            ],
          ),
        ],
      ),
    );
  }
}
