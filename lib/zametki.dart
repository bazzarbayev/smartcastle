// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Zametki extends StatefulWidget {
  const Zametki({super.key});

  @override
  State<Zametki> createState() => _ZametkiState();
}

class _ZametkiState extends State<Zametki> {
  List<String> zametki = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getZametkiFromShared();
  }

  Future getZametkiFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      zametki = sp.getStringList('zametki_key') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyle(fontSize: 26),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Вы точно хотите очистить список?',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences sp =
                                            await SharedPreferences
                                                .getInstance();
                                        setState(() {
                                          zametki.clear();
                                          sp.remove('zametki_key');
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: Text('Да')),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет'))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.delete),
            ),
          )
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.separated(
        itemCount: zametki.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Вы точно хотите удалить?',
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Нет'),
                                  ),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () async {
                                      SharedPreferences sp =
                                          await SharedPreferences.getInstance();

                                      setState(() {
                                        zametki.removeAt(index);

                                        sp.setStringList(
                                            'zametki_key', zametki);
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                          behavior: SnackBarBehavior.floating,
                                          duration: Duration(seconds: 5),
                                          content: Center(
                                            child: Text(
                                              'Успешно удалено!',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          ),
                                        ),
                                      );

                                      Navigator.pop(context);
                                    },
                                    child: Text('Да'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                zametki[index],
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2,
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textController.clear();
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.orangeAccent,
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: textController,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              SharedPreferences sp =
                                  await SharedPreferences.getInstance();

                              setState(() {
                                if (textController.text != '') {
                                  zametki.add(textController.text);

                                  sp.setStringList('zametki_key', zametki);
                                }
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  duration: Duration(days: 999999999999999999),
                                  showCloseIcon: true,
                                  action: SnackBarAction(
                                      label: 'Закрыть', onPressed: () {}),
                                  content: Center(
                                    child: Text(
                                      'Успешно добавлено!',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                              );

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
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}






  // @override
  // void initState() {
  //   super.initState();

  //   loadListFromShared();
  // }

  // Future loadListFromShared() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     zametki = sp.getStringList('zametki_list') ?? [];
  //   });
  // }


                              // SharedPreferences sp =
                              //     await SharedPreferences.getInstance();
                                  // sp.setStringList('zametki_list', zametki);




                                      


                                        // sp.setStringList(
                                        //     'zametki_list', zametki);



                                      // SharedPreferences sp =
                                      //     await SharedPreferences.getInstance();




                                        // SharedPreferences sp =
                                        //     await SharedPreferences
                                        //         .getInstance();

                                        // sp.setStringList('zametki_list', []);