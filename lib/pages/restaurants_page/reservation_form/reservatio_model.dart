class Reservation {
  final String fullName;
  final String nameRestaurant;
  final String dateTime;
  final String table;
  final String status;

  Reservation({
    required this.fullName,
    required this.nameRestaurant,
    required this.dateTime,
    required this.table,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'nameRestaurant': nameRestaurant,
      'dateTime': dateTime,
      'table': table,
      'eventType': status,
    };
  }
}
