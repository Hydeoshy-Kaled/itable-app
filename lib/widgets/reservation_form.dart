import 'package:flutter/material.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _tableController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Se todos os campos forem válidos, você pode processar os dados aqui
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reserva enviada com sucesso!')),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro'),
        content: Text('Por favor, preencha todos os campos obrigatórios.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Ajuste conforme o design
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/icone_itable.png'),
              width: 343,
              height: 95,
            ),
            SizedBox(width: 8),
            Text(
              'Faça o seu agendaamento da sua mesa',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        centerTitle: true, // Garante que o título fique no centro
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Nome completo',
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              _buildTextField(
                controller: _phoneController,
                label: 'Número de telefone',
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              _buildTextField(
                controller: _emailController,
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              _buildTextField(
                controller: _dateController,
                label: 'Data e hora da reserva',
                keyboardType: TextInputType.datetime,
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              _buildTextField(
                controller: _tableController,
                label: 'Escolha sua mesa de preferência',
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              _buildTextField(
                controller: _eventTypeController,
                label: 'Tipo de evento',
                validator: (value) =>
                    value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dateController.dispose();
    _tableController.dispose();
    _eventTypeController.dispose();
    super.dispose();
  }
}
