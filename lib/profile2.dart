import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson4/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile2 extends StatefulWidget {
  Profile2({
    super.key,
  });

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  String login = '';

  List<Profile> users = [];

  // bool profileLoading = false;

  // @override
  // void initState() {
  //   super.initState();

  //   getUsers();
  // }

  // Future getUsers() async {
  //   setState(() {
  //     profileLoading = true;
  //   });

  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  //   if (response.statusCode == 200) {
  //     List<Profile> usersFromApi = List.from(jsonDecode(response.body))
  //         .map((map) => Map<String, dynamic>.from(map))
  //         .map((Map<String, dynamic> map) => Profile.fromJson(map))
  //         .toList();

  //     setState(() {
  //       users = usersFromApi;
  //     });

  //     setState(() {
  //       profileLoading = false;
  //     });

  //     print('vse ok!!!');
  //   } else {
  //     throw '4to to ne tak!';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/mario.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('heyy'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Text('button'),
          ),
        ),
      ),

      // child: Scaffold(
      //     // appBar: AppBar(
      //     //   title: Text('Профиль'),
      //     //   backgroundColor: Colors.green,
      //     // ),
      //     // body: profileLoading == true
      //     //     ? Center(child: CircularProgressIndicator())
      //     //     : Column(
      //     //         children: [
      //     //           SizedBox(height: 20),
      //     //           CircleAvatar(
      //     //             backgroundImage: NetworkImage(
      //     //                 'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
      //     //             // ExactAssetImage(
      //     //             //   'assets/mario.png',
      //     //             // ),
      //     //             radius: 100,
      //     //           ),
      //     //           SizedBox(height: 20),
      //     //           Padding(
      //     //             padding: const EdgeInsets.only(left: 20, right: 20),
      //     //             child: Row(
      //     //               children: [
      //     //                 Expanded(
      //     //                   child: Container(
      //     //                     padding: EdgeInsets.all(16),
      //     //                     decoration: BoxDecoration(
      //     //                       color: Colors.green,
      //     //                       borderRadius: BorderRadius.circular(8),
      //     //                     ),
      //     //                     child: Column(
      //     //                       crossAxisAlignment: CrossAxisAlignment.start,
      //     //                       children: [
      //     //                         Text(
      //     //                           'Имя',
      //     //                           style: TextStyle(fontSize: 16),
      //     //                         ),
      //     //                         Text(
      //     //                           users[1].name!,
      //     //                           style: TextStyle(fontSize: 20),
      //     //                         )
      //     //                       ],
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 SizedBox(width: 10),
      //     //                 Expanded(
      //     //                   child: Container(
      //     //                     padding: EdgeInsets.all(16),
      //     //                     decoration: BoxDecoration(
      //     //                       color: Colors.green,
      //     //                       borderRadius: BorderRadius.circular(8),
      //     //                     ),
      //     //                     child: Column(
      //     //                       crossAxisAlignment: CrossAxisAlignment.start,
      //     //                       children: [
      //     //                         Text('Фамилия'),
      //     //                         Text(
      //     //                           // widget.familya,
      //     //                           users[1].username!,
      //     //                           style: TextStyle(fontSize: 20),
      //     //                         )
      //     //                       ],
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           ),
      //     //           SizedBox(height: 10),
      //     //           Padding(
      //     //             padding: const EdgeInsets.only(left: 20, right: 20),
      //     //             child: Container(
      //     //               width: double.infinity,
      //     //               padding: EdgeInsets.all(16),
      //     //               decoration: BoxDecoration(
      //     //                 color: Colors.green,
      //     //                 borderRadius: BorderRadius.circular(8),
      //     //               ),
      //     //               child: Text(
      //     //                 users[1].address!.city!,
      //     //                 style: TextStyle(fontSize: 30),
      //     //               ),
      //     //             ),
      //     //           ),
      //     //           SizedBox(height: 10),
      //     //           Text(
      //     //             users[1].email!,
      //     //             style: TextStyle(fontSize: 22),
      //     //           ),
      //     //           Text(
      //     //             // widget.city,
      //     //             '',
      //     //             style: TextStyle(fontSize: 22),
      //     //           ),
      //     //           // Text(
      //     //           //   DateFormat('dd MMMM yyyy', 'ru').format(
      //     //           //     DateTime.parse(widget.date),
      //     //           //   ),
      //     //           //   style: TextStyle(fontSize: 22),
      //     //           // ),
      //     //           SizedBox(height: 20),
      //     //           ElevatedButton(
      //     //             onPressed: () {
      //     //               // Navigator.pop(context);

      //     //               showDialog(
      //     //                   context: context,
      //     //                   builder: (context) {
      //     //                     return Dialog(
      //     //                       child: SizedBox(
      //     //                         height: 140,
      //     //                         child: Padding(
      //     //                           padding: const EdgeInsets.all(20.0),
      //     //                           child: Column(
      //     //                             children: [
      //     //                               Text(
      //     //                                 'Вы точно хотите выйти?',
      //     //                                 style: TextStyle(fontSize: 22),
      //     //                               ),
      //     //                               SizedBox(height: 10),
      //     //                               Row(
      //     //                                 mainAxisAlignment:
      //     //                                     MainAxisAlignment.center,
      //     //                                 children: [
      //     //                                   ElevatedButton(
      //     //                                       onPressed: () {
      //     //                                         Navigator.pop(context);
      //     //                                       },
      //     //                                       child: Text('Нет')),
      //     //                                   SizedBox(width: 10),
      //     //                                   ElevatedButton(
      //     //                                       onPressed: () {
      //     //                                         Navigator.pop(context);
      //     //                                         Navigator.pop(context);
      //     //                                       },
      //     //                                       child: Text('Да'))
      //     //                                 ],
      //     //                               )
      //     //                             ],
      //     //                           ),
      //     //                         ),
      //     //                       ),
      //     //                     );
      //     //                   });
      //     //             },
      //     //             child: Text('Выйти'),
      //     //           ),
      //     //           // ElevatedButton(
      //     //           //     onPressed: () {
      //     //           //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     //           //         backgroundColor: Colors.yellow,
      //     //           //         duration: Duration(seconds: 10),
      //     //           //         content: Row(
      //     //           //           children: [
      //     //           //             Icon(Icons.accessibility_new_rounded),
      //     //           //             Expanded(
      //     //           //               child: Text(
      //     //           //                 'Всем привет! Какой то сууууупеерррр длинныййййй текст',
      //     //           //                 style: TextStyle(color: Colors.black, fontSize: 24),
      //     //           //               ),
      //     //           //             ),
      //     //           //           ],
      //     //           //         ),
      //     //           //       ));
      //     //           //     },
      //     //           //     child: Text('show snackbar'))
      //     //         ],
      //     //       ),
      //     ),
    );
  }
}
