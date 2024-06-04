class CustomerInputModel {
  final String customerName;
  final String customerId;

  CustomerInputModel({
    required this.customerName,
    required this.customerId,
  });

  toJson() {
    return {
      'name' : customerName,
      'id': customerId,
    };
  }
}
