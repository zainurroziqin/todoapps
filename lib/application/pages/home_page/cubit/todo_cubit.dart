import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/domain/usecases/todo_usecase.dart';

part 'todo_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.todoUseCase) : super(HomeInitial());
  final TodoUseCase todoUseCase;

  void todoRequest() async {
    emit(HomeLoading());
    final listToDo = await todoUseCase.getTodos();
    if (listToDo.isNotEmpty) {
      emit(HomeDone(listToDo: listToDo));
    } else {
      emit(HomeEmpty());
    }
  }

  void updateStatus(ToDoEntity toDoEntity, bool status)async{
    await todoUseCase.updateStatus(toDoEntity, status);
  }
}
