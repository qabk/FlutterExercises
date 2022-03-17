import 'package:flutter/material.dart';
import 'package:students_list/main.dart';
import 'package:students_list/student.dart';
class EditForm extends StatefulWidget {
  const EditForm({Key? key}) : super(key: key);
  

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
 final nameController = TextEditingController();
 final ageController = TextEditingController();
 final addressController = TextEditingController();
 @override
 void dispose()
 {

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Edit Form",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/img"+ data.toString() +".jpg"),
                backgroundColor: Colors.black,
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: RaisedButton(onPressed: (){},
                  color: Colors.blue[100],
                   child: Text("Choose Image"),)),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Enter new username',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: TextFormField(
                      controller: ageController,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Enter new Age',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Enter new Address',
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: RaisedButton(onPressed: () {
                  Student tmp = Student(id: data,
                   name: nameController.text,
                    address: addressController.text, img_link: "", age: ageController.text);
                    listStudent[data-1] = tmp;
                    Navigator.pushNamed(context, '/');
                },
                color: Colors.blue[100],
                 child: Text("Submit"),)),
          ]),
    );
  }
}
