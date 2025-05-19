import 'package:get/get.dart';

class EmployeeFormController extends GetxController {
  final RxString name = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxString selectedPositionId = ''.obs;
  final RxString selectedStatusId = ''.obs;

  final List<Map<String, String>> statusOptions = [
    {'id': 'a31a68e0-f76e-4da3-b671-377f52610d19', 'name': 'Inactive'},
    {'id': 'b309c390-feb7-47c4-84dc-7ad0b0c47b19', 'name': 'On Leave'},
    {'id': 'c2a749f6-f5ad-491e-bea2-d215bcec38ff', 'name': 'Active'},
  ];

  final List<Map<String, String>> positionOptions = [
    {'id': '16358102-5d24-4fc3-b6c1-0299d460cd5e', 'name': 'Pastry Chef'},
    {'id': '283f1c93-ec5c-4ef9-8ac8-2c902b84a367', 'name': 'Cashier'},
    {'id': '2f5ac2eb-43e6-4a28-b55b-f1b27f4ee225', 'name': 'Manager'},
    {'id': '52c70656-4d5d-4f50-8677-f1db44324583', 'name': 'Chef'},
    {'id': '6c3ea5bd-1d51-4711-86e2-4eb0b9a28fe2', 'name': 'Barista'},
    {'id': 'd20492ca-ef6e-4d06-853f-416468903041', 'name': 'Waiter'},
  ];

  void setName(String value) => name.value = value;
  void setPhoneNumber(String value) => phoneNumber.value = value;
  void setPosition(String id) => selectedPositionId.value = id;
  void setStatus(String id) => selectedStatusId.value = id;

  void resetForm() {
    name.value = '';
    phoneNumber.value = '';
    selectedPositionId.value = '';
    selectedStatusId.value = '';
  }

  String? getSelectedPositionName() {
    if (selectedPositionId.value.isEmpty) return null;
    return positionOptions.firstWhere(
      (element) => element['id'] == selectedPositionId.value,
      orElse: () => {'name': ''},
    )['name'];
  }

  String? getSelectedStatusName() {
    if (selectedStatusId.value.isEmpty) return null;
    return statusOptions.firstWhere(
      (element) => element['id'] == selectedStatusId.value,
      orElse: () => {'name': ''},
    )['name'];
  }
}
