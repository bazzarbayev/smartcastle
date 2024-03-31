import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/country_model.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
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
      List<CountryModel> countriesFromApi = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => CountryModel.fromJson(map))
          .toList();

      setState(() {
        countries = countriesFromApi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(43, 51, 84, 1),
      appBar: AppBar(
        title: Text('Countries'),
        backgroundColor: Color.fromRGBO(43, 51, 84, 1),
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.white,
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                    tilePadding: EdgeInsets.only(right: 10),
                    maintainState: true,
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(countries[index].flags!.png!),
                    ),
                    title: Text(
                      countries[index].name!.common!,
                      style: TextStyle(color: Colors.white),
                    ),
                    children: [
                      Row(
                        children: [
                          Text(
                            'Столица: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(countries[index].capital!.first,
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ]),
              ),
            );
          })),
    );
  }
}
