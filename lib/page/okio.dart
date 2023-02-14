import 'package:flutter/material.dart';
import 'package:showing/photo/photolist.dart';
import 'package:showing/theme/font.dart';

import '../image_and_camera/take_picture_page.dart';

class OkioPage extends StatefulWidget {
  const OkioPage({Key? key}) : super(key: key);

  @override
  State<OkioPage> createState() => _OkioPageState();
}

class _OkioPageState extends State<OkioPage> {
  int itemIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                      okioPhoto[itemIndex].image,
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TakePicturePage(),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 21),
              SizedBox(
                  height: 71,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: okioPhoto.length,
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
                                      icon: Image.asset(okioPhoto[index].image),
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
                            okioPhoto[itemIndex].title,
                            style: Lora_Title_Large(),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                okioPhoto[itemIndex].desc1,
                                style: Lora_Body_Semibold(),
                              ),
                              Text(
                                okioPhoto[itemIndex].desc2,
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
