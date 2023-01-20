import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showwing/remove_bg_api_client..dart';

import 'main.dart';
import 'page/homepage.dart';
import 'theme/color_schemes.dart';
import 'theme/font.dart';
import 'image_edit_page.dart';

class TakePicturePage extends StatefulWidget {
  @override
  TakePicturePageState createState() => TakePicturePageState();
}

class TakePicturePageState extends State<TakePicturePage>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  final resolutionPresets = ResolutionPreset.values;
  ResolutionPreset currentResolutionPreset = ResolutionPreset.high;

  double _minAvailableZoom = 0.5;
  double _maxAvailableZoom = 10.0;
  double _currentZoomLevel = 1.0;

  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;

  FlashMode? _currentFlashMode;

  bool _isRearCameraSelected = true;

  bool isImageInvisible = false;

  bool valueforcommit = false;

  File? _imageFromGallery;
  final picker = ImagePicker();
  Uint8List? imageAsUint8List;
  String? imagePathAsString;
  bool isSilhouetteModeOn = false;

  double _currentImageOpacity = 0.5;

  Future getImage(ImageSource imageSource) async {
    try {
      final pickedImage = await picker.pickImage(source: imageSource);
      if (pickedImage != null) {
        _imageFromGallery =
            File(pickedImage.path); // 가져온 이미지를 _imageFromGallery에 저장
        imagePathAsString = pickedImage.path;
        imageAsUint8List = await pickedImage.readAsBytes();
        ;
      }
    } catch (e) {
      imageAsUint8List = null;
    }
  }

  Widget showImage() {
    return _imageFromGallery == null
        ? Text(' ')
        : isImageInvisible
            ? isSilhouetteModeOn
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(_currentImageOpacity),
                              BlendMode.srcIn),
                          image: MemoryImage(imageAsUint8List!),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(_currentImageOpacity),
                              BlendMode.dstATop),
                          image: MemoryImage(imageAsUint8List!),
                        ),
                      ),
                    ),
                  )
            : Text('');
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      currentResolutionPreset,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
      cameraController
          .getMaxZoomLevel()
          .then((value) => _maxAvailableZoom = value);

      cameraController
          .getMinZoomLevel()
          .then((value) => _minAvailableZoom = value);

      cameraController
          .getMinExposureOffset()
          .then((value) => _minAvailableExposureOffset = value);

      cameraController
          .getMaxExposureOffset()
          .then((value) => _maxAvailableExposureOffset = value);

      _currentFlashMode = controller!.value.flashMode;
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  @override
  @override
  void initState() {
    // Hide the status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    onNewCameraSelected(cameras[0]);
    super.initState();
    isImageInvisible = false;
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  Widget CameraBrightnessController() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _currentExposureOffset.toStringAsFixed(1) + 'x',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Container(
            height: 30,
            child: Slider(
              value: _currentExposureOffset,
              min: _minAvailableExposureOffset,
              max: _maxAvailableExposureOffset,
              activeColor: Colors.white,
              inactiveColor: Colors.white30,
              onChanged: (value) async {
                setState(() {
                  _currentExposureOffset = value;
                });
                await controller!.setExposureOffset(value);
              },
            ),
          ),
        ),
      ],
    );
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
            '',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          // Camera Front-Rear Controller
          IconButton(
            icon: const Icon(Icons.flip_camera_ios_outlined),
            onPressed: () async {
              setState(() {
                _isCameraInitialized = false;
              });
              onNewCameraSelected(
                cameras[_isRearCameraSelected ? 1 : 0],
              );
              setState(() {
                _isRearCameraSelected = !_isRearCameraSelected;
              });
            },
          )
        ],
      ),
      body: _isCameraInitialized
          ? Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                CameraPreview(controller!),

                                //Camera Brightness Controller
                                CameraBrightnessController(),
                              ],
                            ),

                            // Camera Resolution Controller
                            DropdownButton<ResolutionPreset>(
                              dropdownColor: Colors.black87,
                              underline: Container(),
                              value: currentResolutionPreset,
                              items: [
                                for (ResolutionPreset preset
                                    in resolutionPresets)
                                  DropdownMenuItem(
                                    child: Text(
                                      preset
                                          .toString()
                                          .split('.')[1]
                                          .toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: preset,
                                  )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  currentResolutionPreset = value!;
                                  _isCameraInitialized = false;
                                });
                                onNewCameraSelected(controller!.description);
                              },
                              hint: Text("Select item"),
                            ),
                          ],
                        ),
                        showImage(),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              print('hello');
                              setState(() {
                                isImageInvisible = !isImageInvisible;
                              });
                            },
                            hoverColor: Colors.transparent,
                            onHover: (value) {
                              setState(() {
                                isImageInvisible = value;
                              });
                              print(isImageInvisible);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.white60,
                                  size: 60,
                                ),
                                Image.asset('assets/images/reset_image.png'),
                              ],
                            )),
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: _currentImageOpacity,
                                min: 0,
                                max: 1,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white30,
                                onChanged: (value) async {
                                  setState(() {
                                    _currentImageOpacity = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _currentImageOpacity.toStringAsFixed(1) + 'x',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Camera Zoom Controller
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: _currentZoomLevel,
                                min: _minAvailableZoom,
                                max: _maxAvailableZoom,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white30,
                                onChanged: (value) async {
                                  setState(() {
                                    _currentZoomLevel = value;
                                  });
                                  await controller!.setZoomLevel(value);
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _currentZoomLevel.toStringAsFixed(1) + 'x',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Camera Flash Mode
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  _currentFlashMode = FlashMode.off;
                                });
                                await controller!.setFlashMode(
                                  FlashMode.off,
                                );
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black45,
                                    size: 50,
                                  ),
                                  Icon(
                                    Icons.flash_off,
                                    color: _currentFlashMode == FlashMode.off
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  _currentFlashMode = FlashMode.auto;
                                });
                                await controller!.setFlashMode(
                                  FlashMode.auto,
                                );
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black45,
                                    size: 50,
                                  ),
                                  Icon(
                                    Icons.flash_auto,
                                    color: _currentFlashMode == FlashMode.auto
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  _currentFlashMode = FlashMode.always;
                                });
                                await controller!.setFlashMode(
                                  FlashMode.always,
                                );
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black45,
                                    size: 50,
                                  ),
                                  Icon(
                                    Icons.flash_on,
                                    color: _currentFlashMode == FlashMode.always
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  _currentFlashMode = FlashMode.torch;
                                });
                                await controller!.setFlashMode(
                                  FlashMode.torch,
                                );
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black45,
                                    size: 50,
                                  ),
                                  Icon(
                                    Icons.highlight,
                                    color: _currentFlashMode == FlashMode.torch
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await getImage(ImageSource.gallery)
                            .then((value) => null);
                        imageAsUint8List = await RemoveBGApiClient()
                            .removeBgApi(imagePathAsString!);
                        setState(() {
                          isSilhouetteModeOn = true;
                          isImageInvisible = true;
                        });
                        print(isImageInvisible);
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
                      onTap: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await controller!.takePicture();

                          if (!mounted) return;

                          controller!.setFlashMode(FlashMode.off);

                          // If the picture was taken, display it on a new screen.
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ImageEditPage(
                                // Pass the automatically generated path to
                                // the DisplayPictureScreen widget.
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: Icon(
                        Icons.circle,
                        color: Colors.black45,
                        size: 75,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainPage()),
                              (route) => false);
                        },
                        child: Image.asset('assets/images/showwing_logo.png')),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}
