import 'dart:math';

import 'package:contacts_riverpod/Providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactList extends ConsumerWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactNotifier = ref.watch(contactProvider);
    return ListView.builder(
        itemCount: contactNotifier.list.length,
        itemBuilder: (context, index) {
          final contact = contactNotifier.list[index];
          return ListTile(
            leading: Icon(
              Icons.person,
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            title: Text("${contact.first_name} ${contact.last_name}"),
            subtitle: Text(contact.phone_number),
            trailing: IconButton(
              onPressed: () {
                contactNotifier.deleteContact(contact.id);
              },
              icon: const Icon(Icons.delete),
            ),
          );
        });
  }
}
