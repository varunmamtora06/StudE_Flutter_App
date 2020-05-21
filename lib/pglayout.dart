import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'countDown.dart';

class pgLayout extends StatefulWidget {

  String barTitle,pic,heading,descrip,songName;
  pgLayout({this.barTitle,this.pic,this.heading,this.descrip,this.songName});


  @override
  _pgLayoutState createState() => _pgLayoutState(barTitle,pic,heading,descrip,songName);
}

class _pgLayoutState extends State<pgLayout> {

  String barTitle,pic,heading,descrip,songName;
  _pgLayoutState(this.barTitle,this.pic,this.heading,this.descrip,this.songName);

  int timeCount;bool showPicker=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCFF2 ),
//      appBar: AppBar(title: Text(barTitle),
//        backgroundColor: Color(0xff6A1352 ),
//      ),
//      resizeToAvoidBottomPadding: false,//bcuz while selecting custom time rendderflex overflow was there

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(

                    icon: Icon(

                      Icons.arrow_back,
                      size: 50,
                      color: Color(0xff6A1352 ),
                    ),
                    onPressed: ()=>Navigator.pop(context),
                  ),
                ],
              ),
            ),

            //heading is below

            Container(
//              margin: EdgeInsets.all(),
              width: 350,
              height: 100,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow:[ BoxShadow(
                    offset: Offset(12,12),
                    blurRadius: 15,
                  )
                  ]
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Container(
//            color: Colors.greenAccent,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,

                      child: SvgPicture.asset(
                        pic,
                        fit: BoxFit.contain,

                      ),
                    ),

                  ),
                  Text(heading,
                    style:TextStyle(
                      fontSize: 40,

                    ) ,

                  )
                ],
              ),

            ),

            //despriptn is below

            Container(
//              margin: EdgeInsets.all(),
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.white,
                  boxShadow:[ BoxShadow(
                    offset: Offset(5,10),
                    blurRadius: 15,
                  )]
              ),
              child: Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Center(

                  child: Text(descrip,

                    style: TextStyle(
                      fontSize: 25,

                    ),
                    textAlign: TextAlign.justify,

                  ),
                ),
              ),
            ),

            /*timers are below*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[


                InkWell(
                  child: Container(
//              margin: EdgeInsets.all(),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white,
                      boxShadow:[
                        BoxShadow(
                            offset: Offset(5,5),
                            blurRadius: 15,
                            spreadRadius: 0.5
                        ),
//
                      ],

                    ),
                    child: Center(
                      child: Text('10',
                        style: TextStyle(
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      timeCount=10;
                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>countDown(timeCount:timeCount,showPicker: false,showTimer:true,songName: songName)));
                  },
                ),





                InkWell(
                  child: Container(
//              margin: EdgeInsets.all(),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white,
                      boxShadow:[
                        BoxShadow(
                            offset: Offset(5,5),
                            blurRadius: 15,
                            spreadRadius: 0.5
                        ),
//
                      ],

                    ),
                    child: Center(
                      child: Text('30',

                        style: TextStyle(

                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ),
                  onTap: (){
                    setState(() {
                      timeCount=30;
                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>countDown(timeCount:timeCount,showPicker: false,showTimer:true,songName: songName)));

                  },
                ),



                InkWell(
                  child: Container(
//              margin: EdgeInsets.all(),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white,
                      boxShadow:[
                        BoxShadow(
                            offset: Offset(5,5),
                            blurRadius: 15,
                            spreadRadius: 0.5
                        ),
//
                      ],

                    ),
                    child: Center(
                      child: Text('45',
                        style: TextStyle(
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: (){
                    setState(() {
                      timeCount=45;
                    });
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>countDown(timeCount:timeCount,showPicker:false,showTimer:true,songName: songName)));
                  },
                ),


                InkWell(
                  child: Container(
//              margin: EdgeInsets.all(),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Colors.white,
                      boxShadow:[
                        BoxShadow(
                            offset: Offset(5,5),
                            blurRadius: 15,
                            spreadRadius: 0.5
                        ),
//
                      ],

                    ),
                    child: Center(

                      child: Text('?',
                        style: TextStyle(
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: (){

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>countDown(showPicker: true,showTimer:false,songName: songName)));
                  },
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
