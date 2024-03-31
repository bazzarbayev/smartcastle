// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lesson4/profile2.dart';
import 'package:lesson4/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Логин'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: login,
                decoration: InputDecoration(
                  labelText: 'Логин',
                  hintText: 'Напишите логин',
                  prefixIcon: Icon(Icons.login),
                  suffixIcon: IconButton(
                      onPressed: () {
                        login.clear();
                      },
                      icon: Icon(Icons.delete)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == '') {
                    return 'Логин не заполнено';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    labelText: 'Пароль',
                    hintText: 'Напишите пароль',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (hidePassword == true) {
                              hidePassword = false;
                            } else {
                              hidePassword = true;
                            }
                          });
                        },
                        icon: Icon(hidePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off))),
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                validator: (value) {
                  if (value == '') {
                    return 'Пароль не заполнено';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('login', login.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile2(
                            // name: '',
                            // familya: '',
                            // ot4estvo: '',
                            // email: '',
                            // city: '',
                            // date: '',
                            ),
                      ),
                    );
                  } else {
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
                                    Text('Заполните все поля!'),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Закрыть'))
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
                child: Text('Войти'),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  'Если нет аккаунта, то зарегистрируйтесь',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //   borderSide: BorderSide(color: Colors.black, width: 2.0),
                  // ),



                // inputFormatters: [
                //   MaskTextInputFormatter(
                //     mask: '+7 (###) ### ## ##',
                //     filter: {
                //       "#": RegExp(r'[0-9]'),
                //     },
                //   )
                // ],



                  // suffixIcon: IconButton(
                  //   icon: Icon(_hidePassword == true
                  //       ? Icons.visibility
                  //       : Icons.visibility_off),
                  //   onPressed: () {
                  //     setState(() {
                  //       _hidePassword = !_hidePassword;
                  //     });
                  //   },
                  // ),





                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     duration: Duration(seconds: 4),
                      //     content: Text('heyy'),
                      //     backgroundColor: Colors.amber,
                      //     // behavior: SnackBarBehavior.floating,
                      //     // shape: const RoundedRectangleBorder(
                      //     //   borderRadius: BorderRadius.all(Radius.circular(60)),
                      //     // ),
                      //   ),
                      // );



                      // showDialog(
                      //     context: context,
                      //     barrierDismissible: false,
                      //     builder: (context) {
                      //       return Dialog(
                      //         backgroundColor: Colors.amber,
                      //         child: Container(
                      //           height: 100,
                      //           child: Column(
                      //             children: [
                      //               Text('Вы уверены, что хотите выйти?'),
                      //               ElevatedButton(
                      //                   onPressed: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                   child: Text('Да'))
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });