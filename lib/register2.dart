import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lesson4/profile2.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController name = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController ot4estvo = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> cities = ['Шымкент', 'Алматы', 'Актау', 'Астана'];
  String selectedCity = 'Шымкент';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration:
                    InputDecoration(labelText: 'Имя', hintText: 'Напишите имя'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Имя не заполнено';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: familya,
                decoration: InputDecoration(
                    labelText: 'Фамилия', hintText: 'Напишите фамилия'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Фамилия не заполнено';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: ot4estvo,
                decoration: InputDecoration(
                    labelText: 'Отчество', hintText: 'Напишите отчество'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Отчество не заполнено';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                  items: cities
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  value: selectedCity,
                  onChanged: (newCity) {
                    selectedCity = newCity!;
                  }),
              SizedBox(height: 10),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    labelText: 'e-mail', hintText: 'Напишите e-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == '') {
                    return 'Email не заполнено';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    hintText: 'Напишите номер телефона'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile2(
                                  // name: name.text,
                                  // familya: familya.text,
                                  // ot4estvo: ot4estvo.text,
                                  // email: '',
                                  // city: selectedCity,
                                  // date: '',
                                  )));
                    }
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
