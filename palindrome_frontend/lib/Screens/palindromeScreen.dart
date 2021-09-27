import 'package:flutter/material.dart';
import 'package:palindrome_frontend/services/remote_services.dart';

class Palindrome extends StatefulWidget {
  @override
  _PalindromeState createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  var word = '';
  var msg = 'Result appears here';
  var isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Palindrome',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                cursorColor: Colors.black,
                enabled: !isloading,
                decoration: new InputDecoration(
                  labelText: 'Enter word to check its nature',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    word = val;
                    // isloading = false;
                  });
                  //   });
                }),
            SizedBox(height: 20.0),
            isloading ? CircularProgressIndicator() : Container(),
            Text(
              '$word $msg',
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  msg = 'Processing';
                  isloading = true;
                });
                await RemoteServices.checkString(word).then((value) {
                  print(value);
                  setState(() {
                    msg = value;
                    isloading = false;
                  });
                });
              },
              child: Text("Check word"),
            ),
          ],
        ),
      ),
    );
  }
}
