import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappblockemp/api/employee_services.dart';
import 'package:flutterappblockemp/bloc/employee/events.dart';
import 'package:flutterappblockemp/bloc/employee/states.dart';
import 'package:flutterappblockemp/model/employee.dart';
class EmployeeBloc extends Bloc<EmployeeEvent,EmployeeState>{
  EmployeeBloc(EmployeeState initialState) : super(initialState);

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async*{
    if(event is GetEmployee){
      EmployeeServices employeeService=EmployeeServices();
      List<Employee> employees=await employeeService.getEmployee();
      yield EmployeeLoaded(employees);
    }
    if(event is AddEmployee){
      EmployeeServices employeeService=EmployeeServices();
      await employeeService.addEmployee(event.emp);
      List<Employee> employees=await employeeService.getEmployee();
      yield EmployeeLoaded(employees);
    }
    if(event is DeleteEmployee){
      EmployeeServices employeeService=EmployeeServices();
      await employeeService.deleteEmployee(event.Id);

      List<Employee> employees=await employeeService.getEmployee();
      yield EmployeeLoaded(employees);
    }
  }

}