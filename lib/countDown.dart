import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

//
import 'package:assets_audio_player/assets_audio_player.dart';


//import 'package:study/pglayout.dart';
//import 'home.dart';

class countDown extends StatefulWidget {
  int timeCount;
  String songName;
  bool showPicker = true,
      showTimer = false;

  countDown({this.timeCount, this.showPicker, this.showTimer, this.songName});

  @override
  _countDownState createState() =>
      _countDownState(timeCount, showPicker, showTimer, songName);
}

class _countDownState extends State<countDown> {
  int hour = 0,
      minutes = 0,
      seconds = 0;
  String songName;
  bool started = true,
      stopped = true,
      checktimer = true;

  int timefortimer = 0;

  String timetodisp = "";

  int timeCount;
  bool showPicker = true,
      showTimer = false;

  _countDownState(this.timeCount, this.showPicker, this.showTimer,
      this.songName);

  AssetsAudioPlayer myPlayer = AssetsAudioPlayer();

  bool isPlay = true;


  void start() {
    setState(() {
      started = false;
      stopped = false;
      checktimer = true;
    });
    timefortimer = (hour * 3600) + (minutes * 60) + seconds;
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (Timer t) {
      setState(() {
        if (timefortimer < 1 || checktimer == false) {
          t.cancel();
          checktimer = true;
          timetodisp = "";
          timefortimer = 0;
          started = true;
          stopped = true;
          myPlayer.stop();
          myPlayer.dispose();


          /*to handle timer screen crash when back arrow was pressed following is this solution*/


          Navigator.pop(context);
        } else if (timefortimer < 60) {
          timetodisp = timefortimer.toString();
          timefortimer -= 1;

          if (isPlay == false) {
            myPlayer.play();
          }

          /*to handle timer screen crash when back arrow was pressed following is this solution*/


        } else if (timefortimer < 3600) {
          int m = timefortimer ~/ 60;
          int s = timefortimer - (60 * m);
          timetodisp = m.toString() + ":" + s.toString();
          timefortimer -= 1;

          if (isPlay == false) {
            myPlayer.play();
          }

          /*to handle timer screen crash when back arrow was pressed following is this solution*/


        } else {
          int h = timefortimer ~/ 3600;
          int t = timefortimer - (3600 * h);
          int m = t ~/ 60;
          int s = t - (60 * m);

          timetodisp = h.toString() + ":" + m.toString() + ":" + s.toString();

          timefortimer -= 1;

          if (isPlay == false) {
            myPlayer.play();
          }

          /*to handle timer screen crash when back arrow was pressed following is this solution*/


        }
//      timetodisp=timefortimer.toString();
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = true;
      checktimer = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCFF2),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 50,
                      color: Color(0xff6A1352),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Visibility(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 80.0, top: 20.0),
                            child: Text(
                              'HH',
                              style: TextStyle(
                                fontSize: 45.0,
                                color: Color(0xffFFCFF2),
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(textTheme: TextTheme(headline1: TextStyle(color: Color(0xffFFCFF2)))),//to change the number picker color
                            child: NumberPicker.integer(
                              initialValue: hour,
                              minValue: 0,
                              maxValue: 23,
                              onChanged: (val) {
                                setState(() {
                                  hour = val;
                                });
                              },

                            ),

                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff6A1352),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(12, 12),
                              blurRadius: 15,
                            )
                          ]),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 80.0, top: 20.0),
                            child: Text(
                              'MM',
                              style: TextStyle(
                                fontSize: 45.0,
                                color: Color(0xffFFCFF2),
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(textTheme: TextTheme(headline1: TextStyle(color: Color(0xffFFCFF2)))),
                            child: NumberPicker.integer(
                              initialValue: minutes,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (val) {
                                setState(() {
                                  minutes = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff6A1352),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(12, 12),
                              blurRadius: 15,
                            )
                          ]),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 80.0, top: 20.0),
                            child: Text(
                              'SS',
                              style: TextStyle(
                                fontSize: 45.0,
                                color: Color(0xffFFCFF2),
                              ),
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(textTheme: TextTheme(headline1: TextStyle(color: Color(0xffFFCFF2)))),
                            child: NumberPicker.integer(
                              initialValue: seconds,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (val) {
                                setState(() {
                                  seconds = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xff6A1352),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(12, 12),
                              blurRadius: 15,
                            )
                          ]),
                    ),
                  ],
                ),
                visible: showPicker),
            Visibility(
              child: Container(
                width: 300,
                height: 300,
                child: Center(
                  child: Text(
                    timetodisp,
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Color(0xffFFCFF2),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    color: Color(0xff6A1352),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(12, 12),
                        blurRadius: 15,
                      )
                    ]),
              ),
              visible: showTimer,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    color: Colors.green,
                    onPressed: () {
                      //debugPrint('$timeCount');
                      if (timeCount != null) {
                        minutes = timeCount;
                        started ? start() : null;
                      }
                      started ? start() : null;
                      showPicker = false;
                      showTimer = true;
                      myPlayer.open(
                        Audio("assets/songs/$songName.mp3"),
                        showNotification: false,
                        autoStart: true,
                        respectSilentMode: true,
                      );
                      myPlayer.play();

                      //----------------------------------------------
                      isPlay = myPlayer.isPlaying.value;


                      //---------


                    },
                    child: Text(
                      "Start",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    color: Colors.red,
                    onPressed: () {
                      stopped ? null : stop();
                      myPlayer.stop();
                      myPlayer.dispose();
                    },
                    child: Text(
                      "Stop",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
