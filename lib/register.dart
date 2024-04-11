import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson4/profile2.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile2()));
    } on FirebaseAuthException catch (e) {
      //ошибка
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          // key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   controller: name,
              //   decoration:
              //       InputDecoration(labelText: 'Имя', hintText: 'Напишите имя'),
              //   keyboardType: TextInputType.text,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Имя не заполнено';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: familya,
              //   decoration: InputDecoration(
              //       labelText: 'Фамилия', hintText: 'Напишите фамилия'),
              //   keyboardType: TextInputType.text,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Фамилия не заполнено';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: ot4estvo,
              //   decoration: InputDecoration(
              //       labelText: 'Отчество', hintText: 'Напишите отчество'),
              //   keyboardType: TextInputType.text,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Отчество не заполнено';
              //     }
              //     return null;
              //   },
              // ),
              // SizedBox(height: 10),
              // InkWell(
              //   onTap: () async {
              //     DateTime? pickedDate = await showDatePicker(
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(1950),
              //         lastDate: DateTime.now());

              //     if (pickedDate != null) {
              //       setState(() {
              //         selectedDate = pickedDate;
              //       });
              //     }
              //   },
              //   child: Container(
              //     height: 40,
              //     color: Colors.orange,
              //     child: Center(
              //       child: Text(
              //         selectedDate == null
              //             ? 'Выберите дату рождения'
              //             : DateFormat('dd/MM/yyyy').format(selectedDate!),
              //         style: TextStyle(fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
              // DropdownButtonFormField(
              //     items: cities
              //         .map((city) => DropdownMenuItem(
              //               value: city,
              //               child: Text(city),
              //             ))
              //         .toList(),
              //     value: selectedCity,
              //     onChanged: (newCity) {
              //       selectedCity = newCity!;
              //     }),
              // SizedBox(height: 10),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: 'e-mail', hintText: 'Придумайте e-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: 'Пароль', hintText: 'Придумайте пароль'),
                keyboardType: TextInputType.text,
              ),
              // TextFormField(
              //   inputFormatters: [
              //     MaskTextInputFormatter(
              //       mask: "+# (###) ###-##-##",
              //       filter: {"#": RegExp(r'[0-9]')},
              //     )
              //   ],
              //   decoration: InputDecoration(
              //       labelText: 'Номер телефона',
              //       hintText: 'Напишите номер телефона'),
              //   keyboardType: TextInputType.phone,
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
