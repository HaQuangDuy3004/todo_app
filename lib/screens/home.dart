import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        //Main Content
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Input search
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(width: 1, color: tdGrey),

                ),
                child: TextField(
                  
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
            Container(
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