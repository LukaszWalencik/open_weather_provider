import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? _city;

  void _submit() {
    setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      Navigator.pop(context, _city!.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  autofocus: true,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      labelText: 'City name',
                      hintText: 'more than 2 character',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                  validator: (String? input) {
                    if (input == null || input.trim().length < 2) {
                      return 'City name must be at least 2 characters long';
                    }
                    return null;
                  },
                  onSaved: (String? input) {
                    _city = input;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    "How's weather",
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
    );
  }
}
