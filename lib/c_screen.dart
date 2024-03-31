import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/country_model.dart';

class CScreen extends StatefulWidget {
  const CScreen({super.key});

  @override
  State<CScreen> createState() => _CScreenState();
}

class _CScreenState extends State<CScreen> {
  List<CountryModel> countries = [];

  @override
  void initState() {
    super.initState();

    getCountries();
  }

  Future getCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      List<CountryModel> countryList = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => CountryModel.fromJson(map))
          .toList();

      setState(() {
        countries = countryList;
        countries.sort(((a, b) => a.name!.common!.compareTo(b.name!.common!)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 51, 84, 1),
      appBar: AppBar(
        title: Text('Список стран'),
        backgroundColor: Color.fromRGBO(43, 51, 84, 1),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              decoration: InputDecoration(
                  hintText: 'Поиск',
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              onChanged: (value) async {
                final response = await http.get(
                    Uri.parse('https://restcountries.com/v3.1/name/$value'));

                if (response.statusCode == 200) {
                  List<CountryModel> countryList =
                      List.from(jsonDecode(response.body))
                          .map((map) => Map<String, dynamic>.from(map))
                          .map((Map<String, dynamic> map) =>
                              CountryModel.fromJson(map))
                          .toList();

                  setState(() {
                    countries = countryList;
                    countries.sort(
                        ((a, b) => a.name!.common!.compareTo(b.name!.common!)));
                  });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(34, 43, 72, 1),
                          borderRadius: BorderRadius.circular(16)),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(countries[index].flags!.png!),
                          ),
                          title: Text(
                            countries[index].name!.common!,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          children: [
                            Text(
                              'Столица: ${countries[index].capital!.first}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Население: ${countries[index].population} чел',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Площадь: ${countries[index].area!} км2',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
