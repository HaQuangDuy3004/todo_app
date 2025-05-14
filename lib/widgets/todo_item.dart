import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          print("Click todo iteam!");
        },
//Style ListTile
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//Checkbox list todo
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
          size: 25,
        ),
//Title list todo
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
//Button Delete
//Background button delete
        trailing: Container(
          padding: EdgeInsets.all(0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
//Icon delete
          child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: (){
                print("Click delete todo item!");
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 20,
          ),
        ),

      ),
    );
  }
}
