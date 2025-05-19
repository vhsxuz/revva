import 'package:get/get.dart';
import 'package:revva/models/employee_model.dart';
import 'package:revva/services/employee_service.dart';
import 'package:flutter/material.dart';

class EmployeeController extends GetxController {
  final EmployeeService _employeeService = EmployeeService();

  var isLoading = false.obs;
  var employeeList = <EmployeeModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  void fetchEmployees() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await _employeeService.fetchEmployees();
      employeeList.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createEmployee({
    required String name,
    required String phoneNumber,
    required String employeePositionId,
    required String employeeStatusId,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final newEmployee = await _employeeService.createEmployee(
        name: name,
        phoneNumber: phoneNumber,
        employeePositionId: employeePositionId,
        employeeStatusId: employeeStatusId,
      );
      employeeList.add(newEmployee);
      Get.back(); // Close the bottom sheet
      Get.snackbar(
        'Success',
        'Employee added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to add employee: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateEmployee({
    required String id,
    required String name,
    required String phoneNumber,
    required String employeePositionId,
    required String employeeStatusId,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final updatedEmployee = await _employeeService.updateEmployee(
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        employeePositionId: employeePositionId,
        employeeStatusId: employeeStatusId,
      );

      // Find and update the employee in the list
      final index = employeeList.indexWhere((emp) => emp.id == id);
      if (index != -1) {
        employeeList[index] = updatedEmployee;
        employeeList.refresh(); // Notify listeners
      }

      Get.back(); // Close the bottom sheet
      Get.snackbar(
        'Success',
        'Employee updated successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to update employee: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getEmployeeById(String id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final employee = await _employeeService.getEmployeeById(id);
      employeeList.value = [employee];
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to load employee details: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      await _employeeService.deleteEmployee(id);

      // Remove from list
      employeeList.removeWhere((emp) => emp.id == id);
      Get.back();

      Get.snackbar(
        'Success',
        'Employee deleted successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        'Failed to delete employee: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
