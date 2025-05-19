import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';
import 'package:revva/config/component/bottomSheet/add_employee_bottom_sheet.dart';
import 'package:revva/config/component/bottomSheet/detail_employee_bottom_sheet.dart';
import 'package:revva/controllers/employee_controller.dart';

class EmployeePage extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());

  EmployeePage({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFFB5FFE3); // Hijau muda
      case 'On Leave':
        return const Color(0xFFFFE59A); // Kuning
      case 'Inactive':
        return const Color(0xFFFFB3B3); // Merah
      default:
        return Colors.grey[200]!;
    }
  }

  Color getTextColor(String status) {
    switch (status) {
      case 'Active':
        return const Color(0xFF0D704A); // Hijau tua
      case 'On Leave':
        return Colors.grey[800]!; // Biru tua
      case 'Inactive':
        return Colors.grey[800]!; // Putih
      default:
        return Colors.black;
    }
  }

  Widget employeeList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children:
              controller.employeeList.map((employee) {
                final String status = employee.employeeStatus.name;

                return GestureDetector(
                  onTap:
                      () =>
                          showDetailEmployeeBottomSheet(Get.context!, employee),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 49,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Color(0xFF747E87),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          employee.name,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: getStatusColor(status),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          status,
                                          style: TextStyle(
                                            color: getTextColor(status),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    employee.employeePosition.name,
                                    style: const TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.phone,
                                size: 20,
                                color: Color(0xFF777777),
                              ),
                              onPressed: () {
                                print('Call ${employee.phoneNumber}');
                              },
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: Divider(
                          color: Color(0xFFE5E5E5),
                          thickness: 0.5,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      );
    });
  }

  Widget addButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAddEmployeeBottomSheet(context);
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 24, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F4F4),
      appBar: MainAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Expanded(child: SearchForm()),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 35,
                            height: 35,
                            child: addButton(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    employeeList(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: MainBottomNav(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, size: 12, color: Color(0xFF8C8C8C)),
          SizedBox(width: 8),
          Text(
            'Search',
            style: TextStyle(fontSize: 12, color: Color(0xFF8C8C8C)),
          ),
        ],
      ),
    );
  }
}
