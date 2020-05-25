/*notepage*/

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study/new_todo.dart';
import 'package:study/todo.dart';
import 'dart:convert';





class notePage extends StatefulWidget {
  @override
  _notePageState createState() => _notePageState();
}

class _notePageState extends State<notePage>  {
  List<Todo> items = new List<Todo>();
  SharedPreferences sharedPreferences;

  @override
  void initState(){

    super.initState();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    sharedPreferences=await SharedPreferences.getInstance();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFCFF2),
        appBar: AppBar(
          title: Text(
            'Notes',

          ),
          centerTitle: true,
          backgroundColor: Color(0xff6A1352),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add New Note',
          backgroundColor: Color(0xff6A1352),
          child: Icon(Icons.add),
          onPressed: () =>goToNewItemView(),
        ),
        body: renderBody()
    );
  }

  Widget renderBody(){
    if(items.length > 0){
      return buildListView();
    }else{
      setState(() {
        return emptyList();
      });

    }
  }

  Widget emptyList(){
    return Center(
        child:  Text('No items')
    );
  }


  Widget buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context,int index){
        return buildItem(items[index], index);
      },
    );
  }

  Widget buildItem(Todo item, index){
    return Dismissible(
      key: UniqueKey(),/*key:uniquekey bcuz there was dissmissable still part of tree error(solution found on stackowrflow)*/
      background: Container(color: Colors.red[700],child: Icon(Icons.delete,color: Colors.white,),alignment:Alignment.centerLeft ,padding: EdgeInsets.only(left: 15),),
      onDismissed: (direction) => _removeItemFromList(item),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item, index),
    );
  }

  Widget buildListTile(item, index){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:Colors.white,
            boxShadow:[ BoxShadow(
              offset: Offset(5,10),
              blurRadius: 15,
            )]
        ),
        child: ListTile(
          onTap: () => changeItemCompleteness(item),
          onLongPress: () => goToEditItemView(item),
          title: Text(
            item.title,

            style: TextStyle(fontSize: 25,
                color: item.completed ? Colors.grey : Colors.black,
                decoration: item.completed ? TextDecoration.lineThrough : null

            ),
            textAlign: TextAlign.justify,
          ),
          subtitle: Text(
              item.noteText,
          maxLines: 1,overflow: TextOverflow.ellipsis,),
          trailing: Icon(item.completed
              ? Icons.check_box
              : Icons.check_box_outline_blank,

          ),
        ),
      ),
    );
  }

  void changeItemCompleteness(Todo item){
    setState(() {
      item.completed = !item.completed;
    });
    saveData();
  }

  void goToNewItemView(){
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView();
    })).then((li){
      if(li != null) {
        setState(() {
          addItem(Todo(title: li[0],noteText: li[1]));
        });
      }
    });
  }

  void addItem(Todo item){
    // Insert an item into the top of our list, on index zero
    items.insert(0, item);
    saveData();
  }

  void goToEditItemView(item){
    // We re-use the NewTodoView and push it to the Navigator stack just like
    // before, but now we send the title of the item on the class constructor
    // and expect a new title to be returned so that we can edit the item
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return NewTodoView(item: item);
    })).then((li){
      if(li != null) {
        setState(() {
          editItem(item, li[0],li[1]);
        });

      }
    });
  }

  void editItem(Todo item ,String title,String noteTxt){
    item.title = title;
    item.noteText=noteTxt;
    saveData();
  }

  void _removeItemFromList(item) {
    deleteItem(item);
    saveData();
  }

  void deleteItem(item){
    setState(() {
      items.remove(item);
    });


  }

  void saveData(){
    List<String> spList =items.map((item)=>json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list',spList);
  }

  void loadData(){
    List<String> spList=sharedPreferences.getStringList('list');
    items=spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    setState(() {

    });
  }
}