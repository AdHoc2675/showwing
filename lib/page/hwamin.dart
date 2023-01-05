import 'package:flutter/material.dart';
import 'package:showwing/theme/font.dart';
import 'package:showwing/photo/photolist.dart';

class HwaminPage extends StatefulWidget {
  const HwaminPage({Key? key}) : super(key: key);

  @override
  State<HwaminPage> createState() => _HwaminPageState();
}

class _HwaminPageState extends State<HwaminPage> {
  @override
  Widget build(BuildContext context) {
    final List<bool> _selectedPhoto = <bool>[true, false, false, false];
    int itemIndex = 0;

    return Scaffold(
      appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 20.92),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }))),
      body: SingleChildScrollView(
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
                  onTap: () {}),
            ),
            const SizedBox(height: 21),
            SizedBox(
                height: MediaQuery.of(context).size.height / 11,
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
                                    icon: Image.asset(hwaminPhoto[index].image),
                                    onPressed: () {
                                      setState(() {
                                        itemIndex = index;
                                      });
                                      print('$itemIndex');
                                    }),
                              ),
                            ),
                          )
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
