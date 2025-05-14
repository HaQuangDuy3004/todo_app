import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../models/todo.dart';

class Home extends StatelessWidget{
  Home({super.key});
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        //Main Content
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              // Input search
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      child: Text("All ToDos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                    ),
                    //Todo_item
                    for(ToDo todo in todoList)
                      TodoItem(todo: todo),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        centerTitle: true,
        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/man-avatar-image.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      );
  }
}

class searchBox extends StatelessWidget {
  const searchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1, color: tdGrey),

      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          //Text search
          hintText: 'Search',
          hintStyle: TextStyle(
            color: tdGrey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),

          //Icon search
          prefixIcon: Icon(
              Icons.search,
              color: tdGrey,
              size: 25,
          ),
          border: InputBorder.none,
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          )
        )
      ),
    );
  }
}