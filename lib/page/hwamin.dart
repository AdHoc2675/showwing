import 'package:flutter/material.dart';
import 'package:showwing/theme/font.dart';
import 'package:showwing/photo/photolist.dart';

import '../take_pictuer_page2.dart';
import '../take_picture_page.dart';

class HwaminPage extends StatefulWidget {
  const HwaminPage({Key? key}) : super(key: key);

  @override
  State<HwaminPage> createState() => _HwaminPageState();
}

class _HwaminPageState extends State<HwaminPage> {
  @override
  Widget build(BuildContext context) {
    int itemIndex = 0;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60.0,
          leading: Padding(
              padding: const EdgeInsets.only(left: 20.92),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 375,
                height: 388,
                child: InkWell(
                    child: Image.asset(
                      hwaminPhoto[itemIndex].image,
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TakePicturePage2(),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 21),
              SizedBox(
                  height: 71,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: hwaminPhoto.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 19),
                                child: SizedBox(
                                  width: 69,
                                  height: 71,
                                  child: IconButton(
                                      icon:
                                          Image.asset(hwaminPhoto[index].image),
                                      onPressed: () {
                                        setState(() {
                                          itemIndex = index;
                                        });
                                      }),
                                ),
                              ),
                            )
                          ],
                        );
                      })),
              SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(19, 35, 0, 0),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hwaminPhoto[itemIndex].title,
                            style: Lora_Title_Large(),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hwaminPhoto[itemIndex].desc1,
                                style: Lora_Body_Semibold(),
                              ),
                              Text(
                                hwaminPhoto[itemIndex].desc2,
                                style: Inter(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
