class Student
{
  late int id;
  late String name;
  late String address;
  late String img_link;
  late String age;

  Student({required this.id,required this.name,required this.address,required this.img_link,required this.age})
  {
    this.img_link = "assets"+"/img"+ this.id.toString() +".jpg";
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'img_link': img_link,
      'address': address
    };
    return map;
  }

  Student.fromMap(Map<String,dynamic> map)
  {
    id = map['id'];
    name = map['name'];
    address = map['address'];
    age = map['age'];
    img_link = "assets"+"/img"+ map['id'].toString() +".jpg";
  }
}