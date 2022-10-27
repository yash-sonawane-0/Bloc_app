// imports
// list of employees
// stream controllers
// stream sink getter
// constructor - add data; listen to changes
// core functions
// dispose

import 'dart:async';

import 'emplyee.dart';

class EmployeeBloc {
  // Sink to add in pipe
  // Stram to get data from pipe
  // by pipe i mean data flow

  List<Employee> _employeeList = [
    Employee(1, "Employee1", 10000.0),
    Employee(2, "Employee2", 12000.0),
    Employee(3, "Employee3", 10300.0),
    Employee(4, "Employee4", 10040.0),
    Employee(5, "Employee5", 15040.0),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  // for inc and dec
  final _employeeSalarayIncrementStreamController =
      StreamController<Employee>();
  final _employeeSalarayDecrementStreamController =
      StreamController<Employee>();

  // getters
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalarayIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalarayDecrementStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalarayIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalarayDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * (20 / 100);
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * (20 / 100);
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeListStreamController.close();
    _employeeSalarayDecrementStreamController.close();
    _employeeSalarayIncrementStreamController.close();
  }
}
