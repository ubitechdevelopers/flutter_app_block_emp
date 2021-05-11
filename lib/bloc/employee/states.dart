import 'package:flutterappblockemp/model/employee.dart';

abstract class EmployeeState{}

class EmployeeLoading extends EmployeeState{

}

class EmployeeLoaded extends EmployeeState{
  List<Employee> employees;
  EmployeeLoaded(this.employees);
}