import 'package:flutter_api_series/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_series/services/userapi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final phone = user.phone;
          return ListTile(
            title: Text(user.name.first),
            subtitle: Text(phone),
          );
        },
      ),
    );
  }

  Future<void> fetchUser() async {
    final response = await Userapi.fetchUser();
    setState(() {
      users = response;
    });
  }
}
