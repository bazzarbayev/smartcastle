import 'package:flutter/material.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  List<String> zametki = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemCount: zametki.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                zametki[index],
                style: TextStyle(fontSize: 24),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textController.clear();
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(controller: textController),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (textController.text != '') {
                                  zametki.add(textController.text);
                                }
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Добавить'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
