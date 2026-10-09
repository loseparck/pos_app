import 'package:pos_app/features/customer/domain/entities/customer.dart';

class CustomerState{
  final List<Customer> customers;

  final String? selectedCustomerId;

  CustomerState({
    required this.customers,
    this.selectedCustomerId,
  });


  Customer? getCustomerById(String customerId) {
    try{
      return customers.firstWhere((customer) => customer.id == customerId);
    } catch(_){
      return null;
    }
  } 

  Customer? get selectedCustomer {
    if(selectedCustomerId == null) return null;
    try{
      return customers.firstWhere((customer) => customer.id == selectedCustomerId);
    } catch(_){
      return null;
    }
  } 

  CustomerState copyWith({
    List<Customer>? customers,
    String? selectedCustomerId,
    bool? resetCustomerId,
  }){
    return CustomerState(
      customers: customers ?? this.customers,
      selectedCustomerId: resetCustomerId == true ? null : selectedCustomerId ?? this.selectedCustomerId
    );
  }
}