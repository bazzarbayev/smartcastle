import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson4/profile2.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController ot4estvo = TextEditingController();
  TextEditingController email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> cities = ['Шымкент', 'Алматы', 'Астана', 'Кокшетау', 'Актау'];
  String selectedCity = 'Шымкент';

  DateTime? selectedDate;

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
              SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());

                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Container(
                  height: 40,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      selectedDate == null
                          ? 'Выберите дату рождения'
                          : DateFormat('dd/MM/yyyy').format(selectedDate!),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              DropdownButtonFormField(
                  items: cities
                      .map((city) => DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          ))
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
                  if (value!.isEmpty) {
                    return 'Email не заполнено';
                  }
                  return null;
                },
              ),

              // InkWell(
              //   onTap: () async {
              //     DateTime? pickedDate = await showDatePicker(
              //         context: context,
              //         initialDate: selectedDate,
              //         firstDate: DateTime(2010),
              //         lastDate: DateTime(2030));

              //     if (pickedDate != null) {
              //       setState(() {
              //         selectedDate = pickedDate;
              //       });
              //     }
              //   },
              //   child: Container(
              //     height: 30,
              //     width: double.infinity,
              //     color: Colors.amber,
              //     child: Center(
              //         child:
              //             Text(DateFormat('dd.MM.yyyy').format(selectedDate))),
              //   ),
              // ),

              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: "+# (###) ###-##-##",
                    filter: {"#": RegExp(r'[0-9]')},
                  )
                ],
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
                                  // email: email.text,
                                  // city: selectedCity,
                                  // date: selectedDate.toString(),
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
