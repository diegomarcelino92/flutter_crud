import 'package:flutter/material.dart';
import 'package:flutter_crud/validator/validator.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final validator = Validator();

  void onPressed() {
    final isValid = _form.currentState.validate();

    if (isValid) {
      _form.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: this.onPressed,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: validator.emptyString(),
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                validator: validator.email(),
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: validator.email(),
                decoration: InputDecoration(labelText: 'Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
