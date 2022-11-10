import 'package:flutter/material.dart';
import 'package:scheduling_app/data/store_service.dart';

class AddStoreScreen extends StatelessWidget {
  AddStoreScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _imageController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new store'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(hintText: 'Image url'),
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(hintText: 'Phone'),
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: 'Address'),
                  validator: (String? value) {
                    if (valueValidator(value)) {
                      return 'Campo obrigatório!';
                    }
                    return null;
                  }),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      StoreService()
                          .createStore(
                              name: _nameController.text,
                              image: _imageController.text,
                              phone: _phoneController.text,
                              address: _addressController.text)
                          .then((value) => Navigator.pop(context));
                    }
                  },
                  child: const Text('Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
