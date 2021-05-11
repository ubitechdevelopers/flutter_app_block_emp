import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappblockemp/bloc/employee/bloc.dart';
import 'package:flutterappblockemp/bloc/employee/states.dart';
import 'model/employee.dart';

import 'bloc/employee/events.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<EmployeeBloc>(context).add(GetEmployee());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
      ),
      body: Container(
        child: Column(
          children: [
            BlocBuilder<EmployeeBloc,EmployeeState>(builder: (context, state) {
              if(state is EmployeeLoaded){
                return Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(state.employees[index].ename),
                        IconButton(icon: Icon(Icons.delete), onPressed: (){
                          BlocProvider.of<EmployeeBloc>(context).add(DeleteEmployee(state.employees[index].id));
                        })
                      ],
                    );
                  },
                  itemCount: state.employees.length,
                  ),
                );
              }
              return CircularProgressIndicator();
            },)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          BlocProvider.of<EmployeeBloc>(context).add(AddEmployee(Employee.withoutId("pravesh","Gaziabaad","2000000")));
        },
      ),
    );
  }
}
