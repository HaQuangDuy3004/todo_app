import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../models/todo.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        //Main Content
        body: Stack(
          children: [
            //Main content
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
            // Input search
                  searchBox(),
            //List todo
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Text("All ToDos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        ),
                        for(ToDo todo in todoList)
                          TodoItem(todo: todo),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
                          //bóng sẽ được mở rộng thêm ra ngoài 2 pixel.
                          spreadRadius: 0,
                          //bóng sẽ có độ mờ vừa phải, nhìn tự nhiên
                          blurRadius: 10,
                          //x = 0: không đổ bóng sang trái hay phải.-- y = 3: đổ bóng xuống dưới 3 pixel.
                          offset: Offset(0, 0), // changes position of shadow
                        )],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                          hintText: "Add a new todo item",
                        ),
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20,right: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        print("Click add todo item!");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Icon(Icons.add, size: 30,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            )
          ],
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