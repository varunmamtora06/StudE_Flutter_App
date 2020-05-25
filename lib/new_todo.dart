

import 'package:flutter/material.dart';
import 'package:study/todo.dart';


class NewTodoView extends StatefulWidget {
  final Todo item;

  NewTodoView({ this.item });

  @override
  _NewTodoViewState createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {

  TextEditingController titleController;
  TextEditingController noteTextController;
  List<String> li=[];


  @override
  void initState() {
    super.initState();

    titleController = new TextEditingController(
        text: widget.item != null ? widget.item.title : null
    );
    noteTextController = new TextEditingController(
        text: widget.item != null ? widget.item.noteText : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCFF2),
      appBar: AppBar(
        backgroundColor: Color(0xff6A1352),
        title: Text(
          widget.item != null ? 'Edit todo' : 'New todo',

        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(

              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),
              decoration: InputDecoration(labelText: 'Title',
                  border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                  )
              ),
            ),
            SizedBox(height: 14.0,),
            TextField(

              controller: noteTextController,
              autofocus: true,
              onSubmitted: (value) => submit(),
              decoration: InputDecoration(labelText: 'Content',
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)
                  )
              ),
            ),
            SizedBox(height: 14.0,),

            Container(
              width: 150,height: 50,
              child: RaisedButton(
                color: Color(0xff6A1352),
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Color(0xffFFCFF2),
                    fontSize: 35
                  ),
                ),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)
                    )
                ),
                onPressed: () => submit(),
              ),
            )
          ],
        ),
      ),
    );

  }
//List <String> li=[];

  void submit(){
    li.add(titleController.text);
    li.add(noteTextController.text);
    /*Jugaaaad the reason i've put bothcontrollers text in a list is that pop() takes only single argument
    * and not more than one so i first put both of 'em in the list and pass list obj as a single
    * parameter in pop */
    Navigator.of(context).pop(li);
  }
}