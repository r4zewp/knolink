class Customer {
  String id;
  String name;
  String phone;

  Customer({required this.id, required this.name, required this.phone});

  factory Customer.fromResponse(dynamic response) {
    return Customer(
      id: response["id"],
      name: response["name"],
      phone: response["telNum"],
    );
  }
}
