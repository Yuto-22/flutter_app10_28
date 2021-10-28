
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class CashCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CashCard',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.person_outline,
                color: Colors.black,
                size: 40,
              ),
          ),

        ],
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(child: Introduction(),),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 50,
              width: 500,
              child: ElevatedButton(
                child: const Text('Get Free Cash Card'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

class Introduction extends StatefulWidget {
@override
_IntroductionState createState() => _IntroductionState();
}


class _IntroductionState extends State<Introduction> {

  final PageController controller = PageController(viewportFraction: 0.8);
  final _currentPageNotifier = ValueNotifier<int>(0);

  int currentPage = 0;
  final List<String> _imageList = [
    "assets/home_image.png",
    "assets/home_image.png",
    "assets/home_image.png",
    "assets/home_image.png",
  ];

  List<String> _textList = [
    'Bank With It',
    "Bank With It",
    "Bank With It",
    "Bank With It",
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int next = controller.page!.round();
      if (_currentPageNotifier != next) {
        setState(() {
          _currentPageNotifier.value = next;
        });
      }
    });
  }

  AnimatedContainer _createCardAnimate(String imagePath, bool active) {
    final double top = active ? 100 : 200;
    final double side = active ? 0 : 40;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 30.0, right: side, left: side),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: Image
              .asset(imagePath)
              .image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[

          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: _imageList.length,
              itemBuilder: (context, int currentIndex){
                bool active = currentIndex == currentPage;
                return _createCardAnimate(
                  _imageList[currentIndex],
                  active,
                );
              },
            ),
          ),
          Container(
            height: 80.0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  _textList[_currentPageNotifier.value],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            child: CirclePageIndicator(
              itemCount: _imageList.length,
              currentPageNotifier: _currentPageNotifier,
            ),
          ),
        ],
      ),
    );
  }
}