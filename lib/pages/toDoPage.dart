import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/pages/pro_data_EX.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    final _providerdata = Provider.of<ProData>(context);
    _providerdata.fetchToDo();

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _providerdata.fetchToDo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _providerdata.toDoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0.3,
                    child: ListTile(
                      leading: CircleAvatar(
                        child:
                            Text(_providerdata.toDoList[index].id.toString()),
                      ),
                      title: Text(_providerdata.toDoList[index].title),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
