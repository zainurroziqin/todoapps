import 'package:floor/floor.dart';
import 'package:todoapps/data/models/todo.dart';

@dao
abstract class ToDoDao {
  
  @Insert()
  Future<void> insertToDo(ToDoModel todo);
  
  @delete
  Future<void> deleteToDo(ToDoModel toDoModel);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateToDo(ToDoModel toDoModel);
  
  @Query('SELECT * FROM todo')
  Future<List<ToDoModel>> getToDo();
}