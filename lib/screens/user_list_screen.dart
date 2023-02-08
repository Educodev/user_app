import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:user_app/Model/models.dart';
import 'package:http/http.dart' as http;

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  Future<List<User>> getUsers() async {
    final url = Uri.https('jsonplaceholder.typicode.com', 'users');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      List<User> users = [];
      for (var u in jsonResponse) {
        User user = User(
            id: u["id"],
            name: u["name"],
            username: u["username"],
            email: u["email"],
            phone: u["phone"],
            website: u["website"]);
        users.add(user);
      }
      return users;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Usuarios")),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].username),
                  ),
              separatorBuilder: ((context, _) => const Divider()),
              itemCount: snapshot.data != null ? snapshot.data!.length : 0),
        ));
  }
}
