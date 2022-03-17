import 'package:flutter/material.dart';
import 'package:students_list/main.dart';

class StudentView extends StatefulWidget {
  const StudentView({Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              "Student View",
              style: TextStyle(color: Colors.black),
            )),
        body: ListView(
            children: listStudent
                .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: FlatButton(
                                  onPressed: () {
                                    data = e.id;
                                    print(data);
                                    Navigator.pushNamed(context, '/edit');
                                  },
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(e.img_link),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Name     : ${e.name}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Age      : ${e.age}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        "Adress  : ${e.address}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                ))
                .toList()));
  }
}
