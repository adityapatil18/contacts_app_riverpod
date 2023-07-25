import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextInputWidget({
    super.key,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
  });

  final TextEditingController first_name;
  final TextEditingController last_name;
  final TextEditingController phone_number;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: first_name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'First Name'),
                ),
                SizedBox(
                  height: 2,
                ),
                TextField(
                  controller: last_name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Last Name'),
                ),
               
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: TextField(
              controller: phone_number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Phone Number '),
            ),
          )
        ],
      ),
    );
  }
}
