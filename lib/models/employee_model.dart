class EmployeeModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String employeePositionId;
  final String employeeStatusId;
  final DateTime createdAt;
  final EmployeePosition employeePosition;
  final EmployeeStatus employeeStatus;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.employeePositionId,
    required this.employeeStatusId,
    required this.createdAt,
    required this.employeePosition,
    required this.employeeStatus,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      employeePositionId: json['employee_position_id'],
      employeeStatusId: json['employee_status_id'],
      createdAt: DateTime.parse(json['created_at']),
      employeePosition: EmployeePosition.fromJson(json['employeePosition']),
      employeeStatus: EmployeeStatus.fromJson(json['employeeStatus']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'employee_position_id': employeePositionId,
      'employee_status_id': employeeStatusId,
      'created_at': createdAt.toIso8601String(),
      'employeePosition': employeePosition.toJson(),
      'employeeStatus': employeeStatus.toJson(),
    };
  }
}

class EmployeePosition {
  final String id;
  final String name;
  final DateTime createdAt;

  EmployeePosition({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory EmployeePosition.fromJson(Map<String, dynamic> json) {
    return EmployeePosition(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'created_at': createdAt.toIso8601String()};
  }
}

class EmployeeStatus {
  final String id;
  final String name;
  final DateTime createdAt;

  EmployeeStatus({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory EmployeeStatus.fromJson(Map<String, dynamic> json) {
    return EmployeeStatus(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'created_at': createdAt.toIso8601String()};
  }
}
