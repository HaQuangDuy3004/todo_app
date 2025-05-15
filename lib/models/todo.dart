class ToDo{
 String? id;
 String? title;
 bool isDone;

  ToDo({
    required this.id,
    required this.title,
    this.isDone = false
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', title: 'ToDo 1', isDone: true),
      ToDo(id: '02', title: 'ToDo 2', isDone: true),
      ToDo(id: '03', title: 'ToDo 3', isDone: false),
      ToDo(id: '04', title: 'ToDo 4'),
      ToDo(id: '05', title: 'ToDo 5'),
      ToDo(id: '06', title: 'ToDo 6'),
      ToDo(id: '07', title: 'ToDo 7'),
      ToDo(id: '08', title: 'ToDo 8'),
      ToDo(id: '09', title: 'ToDo 9'),
      ToDo(id: '10', title: 'ToDo 10'),
    ];
  }
}