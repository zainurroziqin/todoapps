import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/domain/repositories/todo_repo.dart';

class TodoUseCase{
  final ToDoRepository toDoRepository;
  const TodoUseCase(this.toDoRepository);

  Future<List<ToDoEntity>> getTodos(){
    return toDoRepository.getToDos();
  }

  Future<void> addTodos(ToDoEntity toDoEntity)
  {
    return toDoRepository.saveToDo(toDoEntity);
  }

  Future<void> removeToDo(ToDoEntity toDoEntity){
    return toDoRepository.removeToDo(toDoEntity);
  }

  Future<void> updateTodo(ToDoEntity toDoEntity){
    return toDoRepository.updateToDo(toDoEntity);
  }

  Future<void> updateStatus(ToDoEntity toDoEntity, bool status){
    return toDoRepository.updateStatus(toDoEntity, status);
  }
}