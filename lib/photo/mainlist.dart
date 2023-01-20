import 'package:flutter/material.dart';
import '../theme/font.dart';

class mainlist {
  const mainlist(this.image, this.id);
  final String image;
  final String id;
}

const HotPhoto = [
  mainlist('assets/images/hwamin1.png', '@Hwamini'),
  mainlist('assets/images/ming1.png', '@Ming'),
  mainlist('assets/images/okio1.png', '@Okio'),
  mainlist('assets/images/sullendin1.png', '@sullendin'),
  mainlist('assets/images/boy1.png', '@boy'),
  mainlist('assets/images/hwamin2.png', '@Hwamini'),
];
const SelfiePhoto = [
  mainlist('assets/images/hwamin3.png', '@Hwamini'),
  mainlist('assets/images/ming3.png', '@Ming'),
  mainlist('assets/images/okio3.png', '@Okio'),
  mainlist('assets/images/sullendin3.png', '@sullendin'),
  mainlist('assets/images/boy3.png', '@boy'),
  mainlist('assets/images/hwamin4.png', '@Hwamini'),
];
const FoodPhoto = [
  mainlist('assets/images/hwamin2.png', '@Hwamini'),
  mainlist('assets/images/ming2.png', '@Ming'),
  mainlist('assets/images/okio2.png', '@Okio'),
  mainlist('assets/images/sullendin2.png', '@sullendin'),
  mainlist('assets/images/boy2.png', '@boy'),
  mainlist('assets/images/hwamin3.png', '@Hwamini'),
];
const ScenePhoto = [
  mainlist('assets/images/hwamin4.png', '@Hwamini'),
  mainlist('assets/images/ming4.png', '@Ming'),
  mainlist('assets/images/okio4.png', '@Okio'),
  mainlist('assets/images/sullendin4.png', '@sullendin'),
  mainlist('assets/images/boy4.png', '@boy'),
  mainlist('assets/images/hwamin1.png', '@Hwamini'),
];
const allPhoto = [
  mainlist('assets/images/hwamin1.png', '@Hwamini'),
  mainlist('assets/images/ming2.png', '@Ming'),
  mainlist('assets/images/okio3.png', '@Okio'),
  mainlist('assets/images/sullendin4.png', '@sullendin'),
  mainlist('assets/images/boy2.png', '@boy'),
  mainlist('assets/images/hwamin1.png', '@Hwamini'),
];

List<Container> photolist = <Container>[
  Container(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _rowPhoto1,
          const SizedBox(height: 9),
          _rowPhoto2,
          const SizedBox(height: 9),
          _rowPhoto3,
          const SizedBox(height: 9),
        ],
      )),
  Container(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _rowPhoto4,
          const SizedBox(height: 9),
          _rowPhoto5,
          const SizedBox(height: 9),
          _rowPhoto6,
          const SizedBox(height: 9),
        ],
      )),
  Container(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _rowPhoto4,
          const SizedBox(height: 9),
          _rowPhoto5,
          const SizedBox(height: 9),
          _rowPhoto6,
          const SizedBox(height: 9),
        ],
      )),
  Container(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _rowPhoto4,
          const SizedBox(height: 9),
          _rowPhoto5,
          const SizedBox(height: 9),
          _rowPhoto6,
          const SizedBox(height: 9),
        ],
      )),
  Container(
      padding: const EdgeInsets.only(top: 27),
      child: Column(
        children: [
          _rowPhoto4,
          const SizedBox(height: 9),
          _rowPhoto5,
          const SizedBox(height: 9),
          _rowPhoto6,
          const SizedBox(height: 9),
        ],
      )),
];

class tabphoto extends StatelessWidget {
  const tabphoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 27),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/okio');
                },
                child: _rowPhoto1),
            const SizedBox(height: 9),
            _rowPhoto2,
            const SizedBox(height: 9),
            _rowPhoto3,
            const SizedBox(height: 9),
          ],
        ));
  }
}

Row get _rowPhoto1 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[0].image),
              Text(
                allPhoto[0].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[1].image),
              Text(
                allPhoto[1].id,
                style: Lora(),
              ),
            ])),
      ],
    );
Row get _rowPhoto2 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[2].image),
              Text(
                allPhoto[2].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[3].image),
              Text(
                allPhoto[3].id,
                style: Lora(),
              ),
            ])),
      ],
    );
Row get _rowPhoto3 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[4].image),
              Text(
                allPhoto[4].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(allPhoto[5].image),
              Text(
                allPhoto[5].id,
                style: Lora(),
              ),
            ])),
      ],
    );

Row get _rowPhoto4 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[0].image),
              Text(
                HotPhoto[0].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[1].image),
              Text(
                HotPhoto[1].id,
                style: Lora(),
              ),
            ])),
      ],
    );
Row get _rowPhoto5 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[2].image),
              Text(
                HotPhoto[2].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[3].image),
              Text(
                HotPhoto[3].id,
                style: Lora(),
              ),
            ])),
      ],
    );
Row get _rowPhoto6 => Row(
      children: [
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[4].image),
              Text(
                HotPhoto[4].id,
                style: Lora(),
              ),
            ])),
        const SizedBox(
          width: 14,
        ),
        SizedBox(
            width: 149,
            height: 232,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(HotPhoto[5].image),
              Text(
                HotPhoto[5].id,
                style: Lora(),
              ),
            ])),
      ],
    );
