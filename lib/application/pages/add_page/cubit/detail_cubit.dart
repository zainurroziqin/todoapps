import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/domain/usecases/todo_usecase.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this.todoUseCase) : super(DetailInitial());
  final TodoUseCase todoUseCase;

  void addToDo(ToDoEntity toDoEntity)async{
    emit(DetailLoading());
    await todoUseCase.addTodos(toDoEntity);
    emit(DetailDone());
  }

  void removeTodo(ToDoEntity toDoEntity)async{
    emit(DetailLoading());
    await todoUseCase.removeToDo(toDoEntity);
    emit(DetailDone());
  }

  void updateToDo(ToDoEntity toDoEntity)async{
    emit(DetailLoading());
    await todoUseCase.updateTodo(toDoEntity);
    emit(DetailDone());
  }
}
