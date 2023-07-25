import 'package:contacts_riverpod/Providers/contact_provider.dart';
import 'package:contacts_riverpod/Providers/theme_providers.dart';
import 'package:contacts_riverpod/Widgets/Input_field.dart';
import 'package:contacts_riverpod/Widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerWidget {
  ContactScreen({super.key});
  TextEditingController first_name = TextEditingController();

  TextEditingController last_name = TextEditingController();

  TextEditingController phone_number = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ref.read(themeProvider).toggleTheme();
              },
              icon: Icon(Icons.light_mode),
            ),
          ],
        ),
        body: ContactList(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextInputWidget(
                          first_name: first_name,
                          last_name: last_name,
                          phone_number: phone_number),
                      ElevatedButton(
                          onPressed: () {
                            final contactNotifier = ref.watch(contactProvider);
                            contactNotifier.addContact(
                                DateTime.now().toString(),
                                first_name.text,
                                last_name.text,
                                phone_number.text);
                            first_name.text = '';
                            last_name.text = '';
                            phone_number.text = '';
                            Navigator.pop(context);
                          },
                          child: Text('Add'))
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
