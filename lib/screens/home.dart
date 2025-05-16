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
  //Khai báo biến todoList để lưu trữ danh sách todo
  final todoList = ToDo.todoList();
  //Khai báo biến _todoController để lấy giá trị từ TextField
  final _todoController = TextEditingController();
  //Khai báo biến _foundTodo để lưu trữ danh sách todo đã lọc
  List<ToDo> _foundTodo = [];

  @override
  //initState() chạy một lần duy nhất khi widget được tạo ra
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  //Hàm này sẽ được gọi khi người dùng nhập vào TextField
  //Hàm này sẽ lọc danh sách todo dựa trên từ khóa tìm kiếm
  void _runFilter(String enteredKeyword){
    //Nếu từ khóa tìm kiếm rỗng thì hiển thị toàn bộ danh sách todo
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todoList;
    }else{
      results = todoList.where((todo) => todo.title!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    //Nếu không tìm thấy todo nào thì hiển thị thông báo
    setState(() {
      _foundTodo = results;
    });
  }

  void _addTodoItem(String todo){
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: todo,
      ));
      _todoController.clear();
    });
  }

  void _deleteTodoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }


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
                      padding: EdgeInsets.only(bottom: 55),
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Text("All ToDos", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        ),
                        for(ToDo todoo in _foundTodo.reversed)
                          TodoItem(
                            todo: todoo,
                            onTodoChanged: _handleTodoChange,
                            onDeleteItem: _deleteTodoItem,
                          ),
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
                        controller: _todoController,
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
                        _addTodoItem(_todoController.text);
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

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1, color: tdGrey),

      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
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
