import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itable_app/pages/restaurants_page/reservation_form/reservatio_model.dart';
import 'package:itable_app/pages/restaurants_page/reservation_form/restaurant_reservation.dart';
import 'package:itable_app/pages/restaurants_page/reservation_form/table_reservation.dart';
import 'package:itable_app/utils/constants.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _restaurantName = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _tableTypeController = TextEditingController();

  List<TableReservation> _tables = [];
  TableReservation? _selectedTable;

  List<RestaurantReservation> _restaurants = [];
  RestaurantReservation? _selectedRestaurant;

  @override
  void initState() {
    super.initState();
    _fetchTables();
    _fetchRestaurants();
  }

  // Requisição para buscar as mesas
  Future<void> _fetchTables() async {
    try {
      final dio = Dio();
      dio.options.baseUrl = Constants.URL_APPENGINE;
      final response = await dio.get('/tables'); // Ajuste a URL da sua API

      if (response.statusCode == 200) {
        setState(() {
          _tables = (response.data['data']['tables'] as List)
              .map((tableJson) => TableReservation.fromJson(tableJson))
              .toList();
        });
      } else {
        throw Exception('Erro ao carregar mesas');
      }
    } catch (e) {
      _showErrorDialog('Erro ao conectar: $e');
    }
  }

  Future<void> _fetchRestaurants() async {
    try {
      final dio = Dio();
      dio.options.baseUrl = Constants.URL_APPENGINE;
      final response = await dio.get('/restaurants'); // Ajuste a URL da sua API

      if (response.statusCode == 200) {
        setState(() {
          _restaurants = (response.data['data']['restaurants'] as List)
              .map((restaurantJson) =>
                  RestaurantReservation.fromJson(restaurantJson))
              .toList();
        });
      } else {
        throw Exception('Erro ao carregar restaurantes');
      }
    } catch (e) {
      _showErrorDialog('Erro ao conectar: $e');
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final reservation = Reservation(
        fullName: _nameController.text,
        nameRestaurant: _selectedRestaurant?.id ?? '',
        dateTime: _dateController.text,
        table: _selectedTable?.id ?? '', // Usando o ID da mesa selecionada
        status: 'Pending',
      );

      final dio = Dio();
      dio.options.baseUrl = Constants.URL_APPENGINE;
      dio.options.headers = {'Content-Type': 'application/json'};

      try {
        final response = await dio.post(
          '/reservations',
          data: reservation.toJson(),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reserva realizada com sucesso!'),
            ),
          );
          _formKey.currentState!.reset();
          setState(() {
            _selectedTable = null;
          });
        } else {
          throw Exception('Erro ao enviar reserva: ${response.data}');
        }
      } on DioException catch (error) {
        String errorMessage = 'Erro desconhecido';
        if (error.response != null) {
          errorMessage = 'Erro ao enviar reserva: ${error.response!.data}';
        } else if (error.message != null) {
          errorMessage = 'Erro ao conectar: ${error.message}';
        }
        _showErrorDialog(errorMessage);
      }
    } else {
      _showErrorDialog('Por favor, preencha todos os campos obrigatórios.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDateTime() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate == null) return;

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime == null) return;

    final DateTime selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    _dateController.text =
        "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} ${selectedTime.format(context)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/icone_itable.png',
                  height: 200, width: 500),
              const SizedBox(height: 10),
              const Text(
                'Faça o agendamento da sua mesa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nome Completo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _nameController,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 5),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Escolha o restaurante desejado',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildDropdownFieldRestaurants(),
                      const SizedBox(height: 16.0),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Data e hora da reserva:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: _pickDateTime,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Escolha sua mesa de preferência:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildDropdownField(),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _tableTypeController,
                        validator: (value) =>
                            value!.isEmpty ? 'Campo obrigatório' : null,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 40),
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: Colors.orange[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: const Text(
                          'Enviar',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? label,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: validator,
      ),
    );
  }

  // Novo widget para exibir as mesas no Dropdown
  Widget _buildDropdownField() {
    return DropdownButtonFormField<TableReservation>(
      decoration: InputDecoration(
        labelText: 'Escolha a mesa',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      value: _selectedTable,
      items: _tables
          .map(
            (table) => DropdownMenuItem<TableReservation>(
              value: table,
              child: Text(
                  'Mesa ${table.number} - Capacidade: ${table.capacity} pessoas'),
            ),
          )
          .toList(),
      onChanged: (TableReservation? newValue) {
        setState(() {
          _selectedTable = newValue;
        });
      },
      validator: (value) => value == null ? 'Campo obrigatório' : null,
    );
  }

  Widget _buildDropdownFieldRestaurants() {
    return DropdownButtonFormField<RestaurantReservation>(
      decoration: InputDecoration(
        labelText: 'Escolha o restaurante desejado',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      isDense: true, // Reduz a altura do Dropdown
      value: _selectedRestaurant,
      items: _restaurants
          .map(
            (restaurant) => DropdownMenuItem<RestaurantReservation>(
              value: restaurant,
              child: Text(
                '${restaurant.name} - ${restaurant.cuisineType} - ${restaurant.location}',
                overflow: TextOverflow.ellipsis, // Previne que o texto extrapole
                maxLines: 1,
              ),
            ),
          )
          .toList(),
      onChanged: (RestaurantReservation? newValue) {
        setState(() {
          _selectedRestaurant = newValue;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Por favor, escolha um restaurante.';
        }
        return null;
      },
    );
  }
}


