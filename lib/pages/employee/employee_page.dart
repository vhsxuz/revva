import 'package:flutter/material.dart';
import 'package:revva/config/component/appBar/main_app_bar.dart';
import 'package:revva/config/component/bottomNav/main_bottom_nav.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

Widget addButton() {
  return Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Center(child: Icon(Icons.add, size: 24, color: Colors.black)),
  );
}

class _EmployeePageState extends State<EmployeePage> {
  final List<Map<String, String>> employees = [
    {
      'name': 'Neilson Mandella',
      'position': 'Manager',
      'status': 'Active',
      'phoneNumber': '08123456789',
    },
    {
      'name': 'Maria Sharapova',
      'position': 'Developer',
      'status': 'Onleave',
      'phoneNumber': '08198765432',
    },
    {
      'name': 'John Doe',
      'position': 'Designer',
      'status': 'Active',
      'phoneNumber': '08234567890',
    },
  ];

  Widget employeeList() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children:
            employees.map((employee) {
              final bool isActive = employee['status'] == 'Active';
              return Column(
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
                                  Expanded(
                                    child: Text(
                                      employee['name'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    height: 18,
                                    decoration: BoxDecoration(
                                      color:
                                          isActive
                                              ? const Color(0xFFB5FFE3)
                                              : const Color(0xFFFFE59A),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      employee['status'] ?? '',
                                      style: TextStyle(
                                        color:
                                            isActive
                                                ? const Color(0xFF0D704A)
                                                : Colors.grey[600],
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                employee['position'] ?? '',
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
                            print('Call ${employee['phoneNumber']}');
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
              );
            }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F4F4),
      appBar: const MainAppBar(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          const SearchForm(),
                          const SizedBox(width: 8),
                          addButton(),
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
              padding: const EdgeInsets.only(bottom: 16),
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
      width: 308,
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
