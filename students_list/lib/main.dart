import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students_list/pages/edit.dart';
import 'package:students_list/pages/home.dart';

import 'student.dart';
import 'db/db_helper.dart';

List<Student> listStudent = [
  Student(id: 1, name: "Nobita", address: "123", img_link: "assests", age: "10"),
  Student(id: 2, name: "Shizuka", address: "123", img_link: "assests", age: "10"),
  Student(id: 3, name: "Jaian", address: "123", img_link: "assests", age: "10"),
  Student(id: 4, name: "Suneo", address: "123", img_link: "assests", age: "10"),
  Student(id: 5, name: "Dorami", address: "123", img_link: "assests", age: "10"),
  Student(id: 6, name: "Naruto", address: "123", img_link: "assests", age: "13"),
  Student(id: 7, name: "Sasuke", address: "123", img_link: "assests", age: "13"),
  ]; 
int data = 0;
void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/edit': (context) => EditForm(), 
        '/': (context) => StudentView(),
      },
    ));

