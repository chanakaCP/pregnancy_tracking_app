import 'package:flutter/material.dart';
import 'package:pregnancy_tracking_app/services/authService.dart';
import 'package:pregnancy_tracking_app/models/user.dart';

class MobileVerfy extends StatefulWidget {
  MobileVerfy(this.loginUser);
  String userId;
  User loginUser;

  @override
  _MobileVerfyState createState() => _MobileVerfyState();
}

class _MobileVerfyState extends State<MobileVerfy> {
  final AuthService _authService = AuthService();
  @override
  void initState() {
    print(this.widget.userId);
    _authService.verifyPhone(this.widget.loginUser, context);
    super.initState();
  }

  String smsCode;
  int pinIndex = 0;
  List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController firstPinController = TextEditingController();
  TextEditingController secondPinController = TextEditingController();
  TextEditingController thirdPinController = TextEditingController();
  TextEditingController fourthPinController = TextEditingController();
  TextEditingController fifthPinController = TextEditingController();
  TextEditingController sixthPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      height: 100.0,
                      top: 0.0,
                      right: 0.0,
                      child: Image.asset(
                        'images/pageDeco/top2.png',
                        color: Color.fromRGBO(174, 213, 129, 0.6),
                      ),
                    ),
                    Positioned(
                      height: 100.0,
                      bottom: 0.0,
                      left: 0.0,
                      child: Image.asset(
                        'images/pageDeco/bottom2.png',
                        color: Color.fromRGBO(197, 225, 165, 0.6),
                      ),
                    ),
                    Positioned(
                      top: 35.0,
                      left: 35.0,
                      child: Center(
                        child: Text(
                          "Verify Phone",
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 95.0, left: 55.0, right: 55.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: RichText(
                              text: TextSpan(
                                text: "Please type the verification code send to ",
                                children: <TextSpan>[
                                  TextSpan(
                                    text: this.widget.userId,
                                    style: TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            height: 70.0,
                            width: double.infinity,
                            child: otpPinRow(),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            height: 40.0,
                            width: double.infinity,
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(color: Colors.green[400]),
                                ),
                                color: Colors.green[400],
                                textColor: Colors.white,
                                splashColor: Colors.green[200],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "Verify Now",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                ),
                                onPressed: () {
                                  _authService.signUp(this.smsCode, context);
                                }),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Didn`t get code ?   ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 75.0,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.green[50]),
                                    ),
                                    color: Colors.green[50],
                                    textColor: Colors.black54,
                                    splashColor: Colors.green[200],
                                    child: Text(
                                      "Resend",
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    onPressed: () {
                                      //******** resend code function ************
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(child: numberPad()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  numberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  keyboardNumber(
                      number: 1,
                      onKeyPressed: () {
                        numberSetup("1");
                      }),
                  keyboardNumber(
                      number: 2,
                      onKeyPressed: () {
                        numberSetup("2");
                      }),
                  keyboardNumber(
                      number: 3,
                      onKeyPressed: () {
                        numberSetup("3");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  keyboardNumber(
                      number: 4,
                      onKeyPressed: () {
                        numberSetup("4");
                      }),
                  keyboardNumber(
                      number: 5,
                      onKeyPressed: () {
                        numberSetup("5");
                      }),
                  keyboardNumber(
                      number: 6,
                      onKeyPressed: () {
                        numberSetup("6");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  keyboardNumber(
                      number: 7,
                      onKeyPressed: () {
                        numberSetup("7");
                      }),
                  keyboardNumber(
                      number: 8,
                      onKeyPressed: () {
                        numberSetup("8");
                      }),
                  keyboardNumber(
                      number: 9,
                      onKeyPressed: () {
                        numberSetup("9");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 50.0,
                    child: SizedBox(),
                  ),
                  keyboardNumber(
                      number: 0,
                      onKeyPressed: () {
                        numberSetup("0");
                      }),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      splashColor: Colors.green[100],
                      padding: EdgeInsets.all(5.0),
                      onPressed: () {
                        clearPin();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      height: 90.0,
                      child: Icon(
                        Icons.backspace,
                        color: Colors.green[300].withOpacity(0.8),
                        // fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  numberSetup(String textNumber) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) {
      pinIndex++;
    }
    setPin(pinIndex, textNumber);
    currentPin[pinIndex - 1] = textNumber;
    String strPin = "";
    currentPin.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 6) {
      this.smsCode = strPin;
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        firstPinController.text = text;
        break;
      case 2:
        secondPinController.text = text;
        break;
      case 3:
        thirdPinController.text = text;
        break;
      case 4:
        fourthPinController.text = text;
        break;
      case 5:
        fifthPinController.text = text;
        break;
      case 6:
        sixthPinController.text = text;
        break;
      default:
    }
  }

  otpPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        pinNumber(textEditingController: firstPinController),
        pinNumber(textEditingController: secondPinController),
        pinNumber(textEditingController: thirdPinController),
        pinNumber(textEditingController: fourthPinController),
        pinNumber(textEditingController: fifthPinController),
        pinNumber(textEditingController: sixthPinController),
      ],
    );
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }
}

class pinNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  pinNumber({this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      child: TextField(
        showCursor: false,
        style: TextStyle(
          color: Colors.green[800],
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
        ),
        controller: textEditingController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          filled: true,
          fillColor: Colors.green[100],
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class keyboardNumber extends StatelessWidget {
  final int number;
  final Function() onKeyPressed;

  keyboardNumber({this.number, this.onKeyPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green[300].withOpacity(0.8),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        splashColor: Colors.green[700],
        padding: EdgeInsets.all(5.0),
        onPressed: onKeyPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        height: 90.0,
        child: Text(
          "$number",
          style: TextStyle(
            fontSize: 23.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
