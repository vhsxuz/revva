import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/employee_controller.dart';
import 'package:revva/controllers/employee_form_controller.dart';
import 'package:revva/models/employee_model.dart';

void showDetailEmployeeBottomSheet(
  BuildContext context,
  EmployeeModel employee,
) {
  final EmployeeController employeeController = Get.find();
  final EmployeeFormController formController = Get.put(
    EmployeeFormController(),
  );

  // Initialize form with employee data
  formController.setName(employee.name);
  formController.setPhoneNumber(employee.phoneNumber);
  formController.setPosition(employee.employeePositionId);
  formController.setStatus(employee.employeeStatusId);

  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF2F3C47),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          left: 24,
          right: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 43,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Detail Employee',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // Name Field
              const Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFFC1C7CD),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                child: Obx(() {
                  final controller = TextEditingController(
                    text: formController.name.value,
                  );
                  controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: controller.text.length),
                  );
                  return TextField(
                    controller: controller,
                    onChanged: formController.setName,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),

              // Phone Number Field
              const Text(
                'Phone Number',
                style: TextStyle(
                  color: Color(0xFFC1C7CD),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text('+62', style: TextStyle(color: Colors.black)),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.expand_more,
                      size: 12,
                      color: Color(0xFF1B232A),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Obx(() {
                        final controller = TextEditingController(
                          text: formController.phoneNumber.value,
                        );
                        controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.text.length),
                        );
                        return TextField(
                          controller: controller,
                          onChanged: formController.setPhoneNumber,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration.collapsed(
                            hintText: '81234567890',
                            hintStyle: TextStyle(color: Colors.black54),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Position Field
              const Text(
                'Position',
                style: TextStyle(
                  color: Color(0xFFC1C7CD),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Obx(
                () => Container(
                  height: 36,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value:
                          formController.selectedPositionId.value.isEmpty
                              ? null
                              : formController.selectedPositionId.value,
                      isExpanded: true,
                      hint: const Text(
                        'Select position',
                        style: TextStyle(color: Colors.black54),
                      ),
                      items:
                          formController.positionOptions.map((position) {
                            return DropdownMenuItem<String>(
                              value: position['id'],
                              child: Text(position['name']!),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          formController.setPosition(value);
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Status Field
              const Text(
                'Status',
                style: TextStyle(
                  color: Color(0xFFC1C7CD),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Obx(
                () => Container(
                  height: 36,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value:
                          formController.selectedStatusId.value.isEmpty
                              ? null
                              : formController.selectedStatusId.value,
                      isExpanded: true,
                      hint: const Text(
                        'Select status',
                        style: TextStyle(color: Colors.black54),
                      ),
                      items:
                          formController.statusOptions.map((status) {
                            return DropdownMenuItem<String>(
                              value: status['id'],
                              child: Text(status['name']!),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          formController.setStatus(value);
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await employeeController.updateEmployee(
                        id: employee.id,
                        name: formController.name.value,
                        phoneNumber: formController.phoneNumber.value,
                        employeePositionId:
                            formController.selectedPositionId.value,
                        employeeStatusId: formController.selectedStatusId.value,
                      );
                      Get.back();
                      Get.snackbar(
                        'Success',
                        'Employee updated successfully',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Failed to update employee: ${e.toString()}',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4280EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Update Employee',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Delete Button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await employeeController.deleteEmployee(employee.id);
                      Get.back();
                      Get.snackbar(
                        'Success',
                        'Employee deleted successfully',
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Error',
                        'Failed to delete employee: ${e.toString()}',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEB5453),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Delete Employee',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
