
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>((ref) => TodoProvider([
  Todo(DateTime: DateTime.now().toString(), todo: 'This is my task'),
  Todo(DateTime: DateTime.now().toString(), todo: 'This is my task on Staring'),

]));


class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);


  void addTodo(Todo todo){
  state = [...state, todo];

  }

  void removeTodo(){


  }
void updateTodo(){



}



}