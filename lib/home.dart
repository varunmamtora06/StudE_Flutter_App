
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

import 'package:study/notePage.dart';
import 'package:study/pglayout.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color(0xffD52DA7),
        backgroundColor: Color(0xffFFCFF2 ),
      appBar: AppBar(
        title: Text("StudE"),
        backgroundColor: Color(0xff6A1352 ),
      ),

      body: GridView.count(

        crossAxisCount: 1,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: <Widget>[
          mygriditm(context,'Read','assets/images/readin.svg'),
          mygriditm(context,'Write','assets/images/writin.svg'),
          mygriditm(context,'Code','assets/images/codin.svg'),
          mygriditm(context,'Notes','assets/images/notin.svg'),
          mygriditm(context,'Meditate','assets/images/meditate.svg'),
        ],

      )


    );
  }
}

Widget mygriditm(BuildContext context,String task,String img)
{
  String readDescrip='1- Focus on speed first, your level of understanding will improve with practice.\n2- Use a guide (a finger, a pen, etc.) to avoid losing your spot.\n3- Increase your field of vision.\n4- Reduce eye movement.\n5- Don’t read out loud to yourself, remember your brain is faster than your tongue.';
  String writeDescrip='1- Know your goal and state it clearly.\n2- Language needs to be simple. Do not overuse shiny words.\n3- Try to analyze the things that you write.\n4- Good grammar and punctuation are very important.';
  String codeDescrip='1- Use Meaningful Names for variables,functions and classes.\n2- Write useful comments.\n3- Don\'t repeat yourself.\n4- Take advice from the peron better than you.\n5-Learn from previous mistakes.';
  String mediDescrip='1-Do it for a short time(5-10)mins.\n2-Try a variety of meditations to find what suits you.\n3-Make yourself very comfortable.\n4-Don\'t think about other activities.';


  return Container(

    margin: EdgeInsets.only(bottom: 5,top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      color: Colors.white ,
//       color:Color(0xffC6E0E9 ),
      boxShadow: [BoxShadow(
        blurRadius: 10.0,
        offset: Offset(
        6.0, // Move to right 10  horizontally
        7.0, // Move to bottom 10 Vertically
      ),
      )
      ]

        
    ),
    child: InkWell(
      onTap: (){
        if(task=='Read')
          {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>pgLayout(barTitle:'ReadingPage',pic:'assets/images/readin.svg',heading:'READING',descrip:readDescrip,songName: 'readinMusic')));
          }
        else if(task=='Write'){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>pgLayout(barTitle:'WritingPage',pic:'assets/images/writin.svg',heading:'WRITING',descrip:writeDescrip,songName: 'writingMusic')));
        }
        else if(task=='Code'){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>pgLayout(barTitle:'CodingPage',pic:'assets/images/codin.svg',heading:'CODING',descrip:codeDescrip,songName: 'codinMusic')));
        }
        else if(task=='Notes'){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>notePage()));
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>pgLayout(barTitle:'MeditatePage',pic:'assets/images/meditate.svg',heading:'MEDITATE',descrip:mediDescrip,songName: 'meditateMusic')));
        }

      },
      child: Row(

        children: <Widget>[
          Container(
            child: Container(
//            color: Colors.greenAccent,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(5),
              width: 100,
              height: 100,

              child: SvgPicture.asset(
                img,
                fit: BoxFit.contain,

              ),
            ),

          ),

          Text(task,
            style:TextStyle(fontSize: 40,

            ) ,
          ),
        ],
      ),
    )
  );
}