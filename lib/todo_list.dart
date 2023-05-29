import 'package:elderly_squire_capstone/todo.dart';
import 'package:elderly_squire_capstone/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList2 extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();


}

class _TodoListState extends State<TodoList2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer <TodoService>(
        builder:(context,value,child)=>
         ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(value.todos[index].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),//-------------------------------Update
                  onPressed: () {
                    TextEditingController _textController = TextEditingController(

                      text: value.todos[index].title
                    );
                    //updating todo
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: TextField(
                          controller: _textController
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                                "Cancel"
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text(
                                "Update"
                            ),
                            onPressed: (){

                              var tempTodo = Todo(title:_textController.text);
                              tempTodo.id = value.todos[index].id;

                              context.read<TodoService>().updateTodo(tempTodo
                              );
                              Navigator.pop(context);
                            },
                          ),




                        ],
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red ),
                  onPressed: () {

                    context.read<TodoService>().removeTodo(value.todos[index].id
                    );



                  },
                ),
              ],
            ),
          ),
           itemCount: value.todos.length,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController _textController = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: TextField(
                controller: _textController,

              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Cancel"
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text(
                      "Add"
                  ),
                  onPressed: (){
                    context.read<TodoService>().addTodo(
                      Todo(
                      title: _textController.text??"Title is empty"
                    ),);
                    Navigator.pop(context);
                  },
                ),




              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
