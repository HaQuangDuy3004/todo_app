class Todo{
  final String id;
  final String title;
  final bool isDone;

  Todo({required this.id,required this.title, this.isDone = false});
  ({String id, bool isDone, String title}) copyWith({String? id, String? title, bool? isDone}){
    return(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone
    );
  }
}