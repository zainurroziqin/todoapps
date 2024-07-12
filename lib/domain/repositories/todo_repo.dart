import 'package:todoapps/domain/entity/todo.dart';

abstract class ToDoRepository{
  // Future<>
  Future<List<ToDoEntity>> getToDos();
  Future<void> saveToDo(ToDoEntity toDoEntity);
  Future<void> removeToDo(ToDoEntity toDoEntity);
  Future<void> updateToDo(ToDoEntity toDoEntity);
  Future<void> updateStatus(ToDoEntity toDoEntity, bool status);
}