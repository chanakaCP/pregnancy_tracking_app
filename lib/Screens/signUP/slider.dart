import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/Screens/signUP/sliderControl.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/Screens/home/home.dart';

class SliderPage extends StatefulWidget {
  User loginUser;
  SliderPage(this.loginUser);
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _slidePages = [
    SliderControl(
        description: "Every week during pregnancy, We provide you with important information",
        imagePath: "images/slider1.jpg"),
    SliderControl(
        description: "We plan a healthy diet for you during pregnancy",
        imagePath: "images/slider2.jpg"),
    SliderControl(
        description: "We monitor the progress of you and you`r baby during pregnancy",
        imagePath: "images/slider3.jpg")
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _slidePages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return _slidePages[index];
              },
            ),
            Positioned(
              top: 25.0,
              right: 25.0,
              child: Container(
                height: 30.0,
                width: 70.0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.green[50]),
                  ),
                  color: Colors.green[50],
                  textColor: Colors.black87,
                  splashColor: Colors.green[200],
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(this.widget.loginUser.userId),
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: InkWell(
                        onTap: () {
                          (_currentPage == 0)
                              ? Navigator.pop(context)
                              : _controller.previousPage(
                                  duration: Duration(milliseconds: 800),
                                  curve: Curves.easeInOutQuint,
                                );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 40.0,
                          alignment: Alignment.bottomRight,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            size: 40.0,
                            color: Colors.teal[500],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        _slidePages.length,
                        (int index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 10.0,
                            width: (index == _currentPage) ? 30.0 : 10.0,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 30.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.green[300]
                                  : Colors.green[300].withOpacity(0.5),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 40.0,
                          alignment: Alignment.center,
                          width: (_currentPage == _slidePages.length - 1) ? 100.0 : 40.0,
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: (_currentPage == _slidePages.length - 1)
                              ? Text(
                                  "Start",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Icon(
                                  Icons.chevron_right,
                                  size: 40.0,
                                  color: Colors.teal[500],
                                ),
                        ),
                        onTap: () {
                          if (_currentPage == _slidePages.length - 1) {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(this.widget.loginUser.userId),
                              ),
                            );
                          } else {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOutQuint,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
