import "package:api_connection/logic/bloc/todo_bloc_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    Bloc todo_bloc = BlocProvider.of<TodoBlocBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
            child: Text('Get all ToDo List'),
            onPressed: () {
              todo_bloc.add(TodoFetchEvent());
            },
          ),
          Expanded(
            child: BlocConsumer<TodoBlocBloc, TodoBlocState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TodoLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoSuccessState) {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text(state.todoList[index].id.toString()),
                          ),
                          title: Text(state.todoList[index].title.toString()),
                          trailing: (state.todoList[index].completed!)  ? Icon(Icons.done):Icon(Icons.close),
                        ),
                      );
                    },
                  );
                } else if (state is TodoFailureState) {
                  return Center(
                    child: Text(state.msg),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
