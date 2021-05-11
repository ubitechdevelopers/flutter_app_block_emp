import 'package:flutterappblockemp/model/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeServices{
  Future<List<Employee>> getEmployee()async{
    var response= await http.get(Uri.parse("http://ubiattendance.ubihrm.xyz/index.php/Employee/getEmp"));
    List<Employee> employees=employeeFromJson(response.body);
    return employees;

  }
  Future<List<Employee>> addEmployee(Employee emp)async{
    var response= await http.post(Uri.parse("http://ubiattendance.ubihrm.xyz/index.php/Employee/addEmp?Ename=${emp.ename}&City=${emp.city}&Salary=${emp.salary}"));

  }
  Future<List<Employee>> deleteEmployee(int Id)async{
    var response= await http.post(Uri.parse("http://ubiattendance.ubihrm.xyz/index.php/Employee/deleteEmp?Id=${Id}"));

  }
}