import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/user.dart';
import 'package:flutter_crud/validator/validator.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final validator = Validator();

  final Map<String, String> _formData = {};

  void _loadUser(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  void onPressed(context) {
    final isValid = _form.currentState.validate();

    if (isValid) {
      _form.currentState.save();

      print(_formData['id']);

      final newOrEditedUser = User(
        id: _formData['id'],
        name: _formData['name'],
        email: _formData['email'],
        avatarUrl: _formData['avatarUrl'],
      );

      if (newOrEditedUser.id != null) {
        Provider.of<Users>(context, listen: false).put(newOrEditedUser);
      } else {
        Provider.of<Users>(context, listen: false).add(newOrEditedUser);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context).settings.arguments;

    _loadUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => onPressed(context),
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
                initialValue: _formData['name'],
                validator: validator.emptyString(),
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                validator: validator.email(),
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                validator: validator.emptyString(),
                decoration: InputDecoration(labelText: 'Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
