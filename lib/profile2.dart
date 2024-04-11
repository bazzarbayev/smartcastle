import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile2 extends StatefulWidget {
  const Profile2({
    super.key,
  });

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Профиль'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}






                // FirebaseAuth.instance.signOut();

                // FirebaseAuth.instance.currentUser!.email!