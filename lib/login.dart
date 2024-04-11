// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson4/profile2.dart';
import 'package:lesson4/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  String errorText = '';
  bool loading = false;

  Future signin() async {
    setState(() {
      loading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile2()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        errorText = 'Неверные данные';
      } else if (e.code == 'invalid-email') {
        errorText = 'Неверный формат';
      } else {
        errorText = 'Ошибка входа';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          content: Text(errorText),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                      onPressed: () {
                        emailController.clear();
                      },
                      icon: Icon(Icons.delete)),
                  labelText: 'Email',
                  hintText: 'Введите email',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Email не заполнено!';
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
                        : Icon(Icons.visibility_off),
                  ),
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
              loading == true
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        signin();
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






// Future login() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);

//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Profile2()));
//     } on FirebaseAuthException catch (e) {
//       print(e.code);
//     }
//   }





// Future _signIn() async {
//     setState(() {
//       loading = true;
//     });

//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: loginController.text, password: passwordController.text);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           duration: Duration(seconds: 4),
//           content: Text('Успешно вошли в систему!'),
//           backgroundColor: Colors.green,
//           behavior: SnackBarBehavior.floating,
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(60)),
//           ),
//         ),
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Profile2(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       // if (e.code == 'user-not-found') {
//       //   print('User not found');
//       // } else if (e.code == 'wrong-password') {
//       //   print('Wrong password');
//       // } else {
//       print('Ошибка: ${e.code}');
//       // }
//     }

//     setState(() {
//       loading = false;
//     });
//   }