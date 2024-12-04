class TableReservation {
  final String id;
  final int number;
  final int capacity;
  final String restaurant;

  TableReservation({
    required this.id,
    required this.number,
    required this.capacity,
    required this.restaurant,
  });

  // Método para criar um objeto Table a partir de um JSON
  factory TableReservation.fromJson(Map<String, dynamic> json) {
    return TableReservation(
      id: json['id'].toString(), // ou json['table_id'], dependendo do campo no JSON
      number: json['number'], // ou json['table_name']
      capacity: json['capacity'],
      restaurant: json['restaurant'] // ou outro campo, caso haja
    );
  }

  // Método para converter o objeto Table de volta para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'capacity': capacity,
      'restaurant': restaurant
    };
  }
}
