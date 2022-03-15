import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final String username = "QuocAnh";
  final String password = "123";
  final textController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: Card(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextFormField(
                      enableInteractiveSelection: false,
                      controller: textController,
                      obscureText: false,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return value;
                      }),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    ),
                  )),
            ),
            Flexible(
                child: SizedBox(
              height: 10,
            )),
            Flexible(
                child: Card(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
               shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    print(value);
                    return value;
                  }),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your password here',
                  ),
                ),
              ),
            )),
            Flexible(
                child: SizedBox(
              height: 10,
            )),
            Flexible(
                child: ElevatedButton(
                    onPressed: () {
                      if ((textController.text.compareTo(username) == 0) &&
                          (passwordController.text.compareTo(password) == 0)) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    child: Text("Login"))),
          ],
        ));
  }
}
