import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  TextEditingController nameController = TextEditingController();

  List<DocumentSnapshot> users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future getUsers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      setState(() {
        users = querySnapshot.docs;
        users.sort(
            ((a, b) => a['name'].toString().compareTo(b['name'].toString())));
        _isLoading = false;
      });
    } catch (error) {
      debugPrint("Error fetching data: $error");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future createUser(String name) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc();

      final json = {
        'name': name,
      };

      await docUser.set(json);
    } on FirebaseException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => getUsers(),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : users.isEmpty
                ? Center(
                    child: Text('No data available'),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(users[index]['name']),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            nameController.clear();
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.green,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          children: [
                            TextField(
                              controller: nameController,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  createUser(nameController.text);
                                  getUsers();
                                  Navigator.pop(context);
                                },
                                child: Text('Добавить'))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
