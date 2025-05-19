import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/controllers/employee_controller.dart';
import 'package:revva/controllers/employee_form_controller.dart';

void showAddEmployeeBottomSheet(BuildContext context) {
  final EmployeeFormController formController = Get.put(
    EmployeeFormController(),
  );
  final EmployeeController employeeController = Get.find();

  void submitForm() async {
    if (formController.name.isEmpty ||
        formController.phoneNumber.isEmpty ||
        formController.selectedPositionId.isEmpty ||
        formController.selectedStatusId.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await employeeController.createEmployee(
        name: formController.name.value,
        phoneNumber: formController.phoneNumber.value,
        employeePositionId: formController.selectedPositionId.value,
        employeeStatusId: formController.selectedStatusId.value,
      );
      formController.resetForm();
      Get.back();
      Get.snackbar(
        'Success',
        'Employee added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add employee: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

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
                'Add New Employee',
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
                child: TextField(
                  onChanged: formController.setName,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Enter name',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
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
                      child: TextField(
                        onChanged: formController.setPhoneNumber,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration.collapsed(
                          hintText: '81234567890',
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                      ),
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
              GestureDetector(
                onTap: () => _showPositionDropdown(context, formController),
                child: Obx(
                  () => Container(
                    height: 36,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formController.getSelectedPositionName() ??
                              'Select position',
                          style: TextStyle(
                            color:
                                formController.selectedPositionId.isEmpty
                                    ? Colors.black54
                                    : Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.expand_more,
                          size: 12,
                          color: Color(0xFF1B232A),
                        ),
                      ],
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
              GestureDetector(
                onTap: () => _showStatusDropdown(context, formController),
                child: Obx(
                  () => Container(
                    height: 36,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formController.getSelectedStatusName() ??
                              'Select status',
                          style: TextStyle(
                            color:
                                formController.selectedStatusId.isEmpty
                                    ? Colors.black54
                                    : Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.expand_more,
                          size: 12,
                          color: Color(0xFF1B232A),
                        ),
                      ],
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
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4280EF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Create New Employee',
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

void _showPositionDropdown(
  BuildContext context,
  EmployeeFormController controller,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Position',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.positionOptions.length,
                itemBuilder: (context, index) {
                  final position = controller.positionOptions[index];
                  return ListTile(
                    title: Text(position['name']!),
                    onTap: () {
                      controller.setPosition(position['id']!);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _showStatusDropdown(
  BuildContext context,
  EmployeeFormController controller,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Status',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.statusOptions.length,
                itemBuilder: (context, index) {
                  final status = controller.statusOptions[index];
                  return ListTile(
                    title: Text(status['name']!),
                    onTap: () {
                      controller.setStatus(status['id']!);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
