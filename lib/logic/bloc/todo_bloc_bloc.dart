import 'package:api_connection/data/models/todo_response_model.dart';
import 'package:api_connection/data/repositories/todo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoRepository repository = TodoRepository();
  TodoBlocBloc(this.repository) : super(TodoInitialState()) {
    on<TodoBlocEvent>((event, emit) async {
      try {
        emit(TodoLoadingState());
        List<TodoModel> todoList = await repository.fetchTodos();
        emit(TodoSuccessState(todoList: todoList));
      } catch (e) {
        emit(TodoFailureState(msg: e.toString()));
      }
    });
  }
}
