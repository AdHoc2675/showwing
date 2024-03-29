import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoModel {
  const PhotoModel(this.image, this.title, this.desc1, this.desc2, this.season,
      this.time, this.location, this.weather, this.camera, this.keyword);
  final String image;
  final String title;
  final String desc1;
  final String desc2;
  final String season;
  final String time;
  final String location;
  final String weather;
  final String camera;
  final String keyword;
}

const hwaminPhoto = [
  PhotoModel(
    'assets/images/hwamin1.png',
    'Selfie',
    'Indoor Selfie',
    '실내에서 바깥 배경보다\n인물 위주의 사진을 찍고 싶을 때\n주로 사용하고 있어요',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/hwamin2.png',
    'Sea',
    'Sunset view',
    '햇빛이 비추는 바다를 찍을 때,\n눈에 담기는 바다 사진을 찍고 싶을 때,\n이 필터를 사용해요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/hwamin3.png',
    'Mood',
    'Natural sight view',
    '흐릇한 감성으로 몽롱한 느낌을\n표현하고 싶을 때, 추천하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/hwamin4.png',
    'Nature',
    'Forest view',
    '햇빛을 찍을 때,\n자연의 프레쉬함을 나타내고 \n싶을 때 사용하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
];

const mingPhoto = [
  PhotoModel(
    'assets/images/ming1.png',
    'Selfie',
    'Indoor Selfie',
    '실내에서 바깥 배경보다\n인물 위주의 사진을 찍고 싶을 때\n주로 사용하고 있어요',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/ming2.png',
    'Sea',
    'Sunset view',
    '햇빛이 비추는 바다를 찍을 때,\n눈에 담기는 바다 사진을 찍고 싶을 때,\n이 필터를 사용해요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/ming3.png',
    'Mood',
    'Natural sight view',
    '흐릇한 감성으로 몽롱한 느낌을\n표현하고 싶을 때, 추천하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/ming4.png',
    'Nature',
    'Forest view',
    '햇빛을 찍을 때,\n자연의 프레쉬함을 나타내고 \n싶을 때 사용하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
];

const okioPhoto = [
  PhotoModel(
    'assets/images/okio1.png',
    'Selfie',
    'Indoor Selfie',
    '실내에서 바깥 배경보다\n인물 위주의 사진을 찍고 싶을 때\n주로 사용하고 있어요',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/okio2.png',
    'Sea',
    'Sunset view',
    '햇빛이 비추는 바다를 찍을 때,\n눈에 담기는 바다 사진을 찍고 싶을 때,\n이 필터를 사용해요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/okio3.png',
    'Mood',
    'Natural sight view',
    '흐릇한 감성으로 몽롱한 느낌을\n표현하고 싶을 때, 추천하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/okio4.png',
    'Nature',
    'Forest view',
    '햇빛을 찍을 때,\n자연의 프레쉬함을 나타내고 \n싶을 때 사용하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
];

const sullendinPhoto = [
  PhotoModel(
    'assets/images/sullendin1.png',
    'Selfie',
    'Indoor Selfie',
    '실내에서 바깥 배경보다\n인물 위주의 사진을 찍고 싶을 때\n주로 사용하고 있어요',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/sullendin2.png',
    'Sea',
    'Sunset view',
    '햇빛이 비추는 바다를 찍을 때,\n눈에 담기는 바다 사진을 찍고 싶을 때,\n이 필터를 사용해요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/sullendin3.png',
    'Mood',
    'Natural sight view',
    '흐릇한 감성으로 몽롱한 느낌을\n표현하고 싶을 때, 추천하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/sullendin4.png',
    'Nature',
    'Forest view',
    '햇빛을 찍을 때,\n자연의 프레쉬함을 나타내고 \n싶을 때 사용하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
];

const boyPhoto = [
  PhotoModel(
    'assets/images/boy1.png',
    'Selfie',
    'Indoor Selfie',
    '실내에서 바깥 배경보다\n인물 위주의 사진을 찍고 싶을 때\n주로 사용하고 있어요',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/boy2.png',
    'Sea',
    'Sunset view',
    '햇빛이 비추는 바다를 찍을 때,\n눈에 담기는 바다 사진을 찍고 싶을 때,\n이 필터를 사용해요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/boy3.png',
    'Mood',
    'Natural sight view',
    '흐릇한 감성으로 몽롱한 느낌을\n표현하고 싶을 때, 추천하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  ),
  PhotoModel(
    'assets/images/boy4.png',
    'Nature',
    'Forest view',
    '햇빛을 찍을 때,\n자연의 프레쉬함을 나타내고 \n싶을 때 사용하는 필터예요.',
    'Summer',
    '09:00 pm',
    'Seoul',
    'Sunny',
    'Phone SE3, iPhone 12',
    '#시티팝 #생일케이크',
  )
];

class newFilter extends StatefulWidget {
  const newFilter({Key? key}) : super(key: key);

  @override
  State<newFilter> createState() => _newFilterState();
}

class _newFilterState extends State<newFilter> {
  int activeIndex = 0;

  List newFilter = [
    'assets/images/main1.jpg',
    'assets/images/main2.jpg',
    'assets/images/main3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 299,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              }),
          items: [for (var item in newFilter) Image.asset(item)].toList(),
        ),
        Positioned(
            top: 500,
            left: MediaQuery.of(context).size.width / 3,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: newFilter.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: Colors.black,
                      dotWidth: 8,
                      dotHeight: 8,
                    )))),
      ],
    );
  }
}
