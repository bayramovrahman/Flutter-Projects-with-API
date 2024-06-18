import 'package:flutter/material.dart';
import 'package:basic_api_from_local/model/users_model.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key, required this.userItem});

  final UsersModel userItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "User Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Full name: ${userItem.name}',
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Username: ${userItem.username}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'E-mail: ${userItem.email}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Phone: ${userItem.phone}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Address: ${userItem.address!.suite}, ${userItem.address!.street}, ${userItem.address!.city}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Zip code: ${userItem.address!.zipcode}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Website: ${userItem.website}',
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Company: ${userItem.company!.name}',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
