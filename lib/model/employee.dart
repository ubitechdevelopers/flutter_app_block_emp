import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    this.id,
    this.ename,
    this.city,
    this.salary,
  });
  Employee.withoutId(
    this.ename,
    this.city,
    this.salary,
  );

  int id;
  String ename;
  String city;
  String salary;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: int.parse(json["Id"]),
    ename: json["Ename"],
    city: json["City"],
    salary: json["Salary"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Ename": ename,
    "City": city,
    "Salary": salary,
  };
}
