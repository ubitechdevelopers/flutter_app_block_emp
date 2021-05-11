import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappblockemp/model/employee.dart';

abstract class EmployeeEvent{

}

class AddEmployee extends EmployeeEvent{
  Employee emp;
  AddEmployee(this.emp);
}

class GetEmployee extends EmployeeEvent{

  GetEmployee();
}

class DeleteEmployee extends EmployeeEvent{
  int Id;
  DeleteEmployee(this.Id);
}
