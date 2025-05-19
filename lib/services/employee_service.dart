import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:revva/models/employee_model.dart';

class EmployeeService {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.env['HOST']!;

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      final response = await _dio.get('$_baseUrl/api/v1/employee');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => EmployeeModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load employees: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching employees: $e');
    }
  }

  Future<EmployeeModel> createEmployee({
    required String name,
    required String phoneNumber,
    required String employeePositionId,
    required String employeeStatusId,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/api/v1/employee/',
        data: {
          'name': name,
          'phone_number': phoneNumber,
          'employee_position_id': employeePositionId,
          'employee_status_id': employeeStatusId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return EmployeeModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to create employee: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error creating employee: $e');
    }
  }

  Future<EmployeeModel> updateEmployee({
    required String id,
    required String name,
    required String phoneNumber,
    required String employeePositionId,
    required String employeeStatusId,
  }) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/api/v1/employee/$id',
        data: {
          'name': name,
          'phone_number': phoneNumber,
          'employee_position_id': employeePositionId,
          'employee_status_id': employeeStatusId,
        },
      );

      if (response.statusCode == 200) {
        return EmployeeModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to update employee: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error updating employee: $e');
    }
  }

  Future<EmployeeModel> getEmployeeById(String id) async {
    try {
      final response = await _dio.get('$_baseUrl/api/v1/employee/$id');

      if (response.statusCode == 200) {
        return EmployeeModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load employee: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching employee: $e');
    }
  }

  Future<void> deleteEmployee(String id) async {
    try {
      final response = await _dio.delete('$_baseUrl/api/v1/employee/$id');

      if (response.statusCode != 200) {
        throw Exception('Failed to delete employee: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error deleting employee: $e');
    }
  }
}
