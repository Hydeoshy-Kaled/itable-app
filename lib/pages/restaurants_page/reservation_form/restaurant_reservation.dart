class RestaurantReservation {
  final String id;
  final String cuisineType;
  final String location;
  final String name;
  final String status;

  RestaurantReservation({
    required this.id,
    required this.cuisineType,
    required this.location,
    required this.name,
    required this.status,
  });

  // Método para criar um objeto Table a partir de um JSON
  factory RestaurantReservation.fromJson(Map<String, dynamic> json) {
    return RestaurantReservation(
      id: json['id'].toString(), 
      cuisineType: json['cuisineType'], 
      location: json['location'],
      name: json['name'],
      status: json['status']
       
    );
  }

  // Método para converter o objeto Table de volta para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cuisineType': cuisineType,
      'location': location,
      'name': name,
      'status': status
    };
  }
}
