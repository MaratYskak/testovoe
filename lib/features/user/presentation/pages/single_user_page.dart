import 'package:flutter/material.dart';
import 'package:testovoe/features/user/domain/entities/user_entity.dart';

class SingleUserPage extends StatelessWidget {
  final UserEntity user;

  const SingleUserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(),
            const SizedBox(height: 16),
            _buildAddressInfo(),
            const SizedBox(height: 16),
            _buildCompanyInfo(),
          ],
        ),
      ),
    );
  }

  /// Карточка с общей информацией о пользователе
  Widget _buildUserInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Основная информация'),
            ListTile(
              leading: const Icon(Icons.person, size: 32),
              title: Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('@${user.username}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            _buildInfoRow(Icons.email, 'Email', user.email),
            _buildInfoRow(Icons.phone, 'Телефон', user.phone),
            _buildInfoRow(Icons.language, 'Вебсайт', user.website),
          ],
        ),
      ),
    );
  }

  /// Карточка с адресом пользователя
  Widget _buildAddressInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Адрес'),
            _buildInfoRow(Icons.location_city, 'Город', user.address.city),
            _buildInfoRow(Icons.streetview, 'Улица', user.address.street),
            _buildInfoRow(Icons.apartment, 'Квартира', user.address.suite),
            _buildInfoRow(Icons.pin_drop, 'Почтовый индекс', user.address.zipcode),
            _buildInfoRow(Icons.map, 'Координаты', '${user.address.geo.lat}, ${user.address.geo.lng}'),
          ],
        ),
      ),
    );
  }

  /// Карточка с информацией о компании
  Widget _buildCompanyInfo() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('Компания'),
            ListTile(
              leading: const Icon(Icons.business, size: 32),
              title: Text(user.company.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            _buildInfoRow(Icons.emoji_objects, 'Слоган', user.company.catchPhrase),
            _buildInfoRow(Icons.work, 'Деятельность', user.company.bs),
          ],
        ),
      ),
    );
  }

  /// Виджет для отображения заголовков секций
  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Виджет для строки с иконкой и текстом
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Выравниваем по верхнему краю
        children: [
          Icon(icon, size: 24, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$label:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
