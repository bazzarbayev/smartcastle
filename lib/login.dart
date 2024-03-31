// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lesson4/profile2.dart';
import 'package:lesson4/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Логин'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              TextFormField(
                controller: loginController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {
                        loginController.clear();
                      },
                      icon: Icon(Icons.delete)),
                  labelText: 'Логин',
                  hintText: 'Введите логин',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Логин не заполнено!';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Пароль',
                  hintText: 'Введите пароль',
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (hidePassword == true) {
                          setState(() {
                            hidePassword = false;
                          });
                        } else {
                          setState(() {
                            hidePassword = true;
                          });
                        }
                      },
                      icon: hidePassword == true
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Пароль не заполнено!';
                  }
                },
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // переход на стр регистрации

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  'Если нет аккаунта, то регистрируйтесь',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('key_login', loginController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile2(
                            // name: loginController.text,
                            // familya: '',
                            // email: '',
                            // city: '',
                            // ot4estvo: '',
                            // date: '',
                            ),
                      ),
                    );
                  }
                },
                child: Text('Войти'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
