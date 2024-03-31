import 'package:flutter/material.dart';
import 'package:lesson4/lesson10.dart';

class Lesson8 extends StatefulWidget {
  const Lesson8({super.key});

  @override
  State<Lesson8> createState() => _Lesson8State();
}

class _Lesson8State extends State<Lesson8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined),
        title: Text(
          'Сегодня в кино',
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: Colors.grey, height: 0.5),
            // Container(
            //   color: Colors.black,
            //   padding:
            //       EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            //   child: Row(
            //     children: [
            //       Icon(Icons.location_on_outlined, color: Colors.black),
            //       SizedBox(width: 10),
            //       Text(
            //         'Город',
            //         style: TextStyle(color: Colors.black, fontSize: 16),
            //       ),
            //       Spacer(),
            //       Text(
            //         'Шымкент',
            //         style: TextStyle(color: Colors.black, fontSize: 16),
            //       ),
            //       SizedBox(width: 4.0),
            //       Icon(
            //         Icons.arrow_forward_ios_rounded,
            //         color: Colors.white,
            //         size: 20,
            //       )
            //     ],
            //   ),
            // ),
            // Divider(color: Colors.grey, height: 0.5),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Lesson10()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset('assets/pin.png',
                            width: 100, height: 100),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Мальчик и птица',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Kimitachi wa Dou',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'аниме, мультфильм',
                            style: TextStyle(
                                color: Color.fromARGB(255, 78, 36, 36),
                                fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '7.8',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: SizedBox(
            //       width: double.infinity,
            //       child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => Lesson10()));
            //           },
            //           child: Text('Далее'))),
            // )
          ],
        ),
      ),
    );
  }
}
