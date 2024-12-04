class BookingsModel{

  final String restaurantName;
  final String restaurantTable;
  final DateTime dateTime;  
  final String numberPeople;
  final String orderNumber;
  final String client;
  final String status;


  BookingsModel({
    required this.restaurantName,
    required this.restaurantTable,
    required this.dateTime,
    required this.client,
    required this.numberPeople,
    required this.orderNumber,
    required this.status
  });


  factory BookingsModel.fromJson(Map<String, dynamic>json){
    return BookingsModel(
      restaurantName: json['restaurantName'] as String,
      restaurantTable: json['table'] as String,
      client: json['customer'] as String,
      dateTime: DateTime.parse(json['dateTime']),
      numberPeople: json['numberOfPeople'] as String,
      orderNumber: json['orderNumber'] as String,
      status: json['status'] as String
    );
  }
}