import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pratibha_clone/screens/exam_screen.dart';
import 'package:pratibha_clone/widgets/custom_card.dart';
import 'package:pratibha_clone/widgets/drawer.dart';

final List<String> imgList = [
  'assets/images/n1.png',
  'assets/images/o1.png',
  'assets/images/p1.png'
];

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'Today';

  int _current = 0;
  late Timer t;

  final PageController _imgPageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    t = Timer.periodic(const Duration(milliseconds: 1600), (Timer timer) {
      return setState(() {
        if (_current == imgList.length - 1) {
          _current = 0;
        } else {
          _current++;
        }

        _imgPageController.animateToPage(_current,
            duration: const Duration(milliseconds: 400), curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    t.cancel();
    _imgPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      drawer: MyDrawer(email: widget.email),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
        title: Image.asset(
          'assets/icons/final.png',
          fit: BoxFit.fitHeight,
        ),
        centerTitle: true,
        actions: [
          DropdownButton<String>(
            //value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 30,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Today', 'Yesterday', '2 days ago']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                PageView(
                  controller: _imgPageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset(
                      'assets/images/n1.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      'assets/images/o1.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Image.asset(
                      'assets/images/p1.png',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExamScreen()));
                    },
                    child: const CustomCard(
                        imageName: 'assets/icons/1.png',
                        text: '3 Years UPSC Question Papers'),
                  ),
                  const CustomCard(
                      imageName: 'assets/icons/2.png',
                      text: 'Previous 25 Year Question Papers'),
                  const CustomCard(
                      imageName: 'assets/icons/3.png',
                      text: 'All India Mock Tests'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  CustomCard(
                      imageName: 'assets/icons/4.png',
                      text: 'Review Bookmarks'),
                  CustomCard(
                      imageName: 'assets/icons/5.png',
                      text: 'Attempt Incorrect Questions'),
                  CustomCard(
                      imageName: 'assets/icons/6.png',
                      text: 'Performance Summary'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomCard(
                      imageName: 'assets/icons/7.png',
                      text: 'Critical Thinking'),
                  CustomCard(
                      imageName: 'assets/icons/8.png', text: 'Review Progress'),
                ],
              ),
            ],
          )
        ],
      ),
      // bottomNavigationBar: const TabBar(
      //   tabs: [
      //     Tab(icon: Icon(Icons.upload)),
      //     Tab(icon: Icon(Icons.upload))
      //     ],
      // ),
    );
  }
}
