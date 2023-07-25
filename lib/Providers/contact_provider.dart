import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Contact {
  final String id;
  final String first_name;
  final String last_name;
  final String phone_number;

  Contact(this.id,  this.first_name, this.last_name, this.phone_number);
}

class ContactProvider with ChangeNotifier {
  final List<Contact> _list = [];

  List<Contact> get list {
    return [..._list];
  }

  void addContact(String id, String first_name, String last_name, String phone_number) {
    _list.add(Contact(id, first_name, last_name, phone_number));
    notifyListeners();
  }

  void deleteContact(String id) {
    _list.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}

final contactProvider = ChangeNotifierProvider((ref) => ContactProvider());
