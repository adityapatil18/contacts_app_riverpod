import 'package:contacts_riverpod/Screens/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: ContactRiverpod()));
}

class ContactRiverpod extends StatelessWidget {
  const ContactRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:ContactScreen() ,);
  }

}