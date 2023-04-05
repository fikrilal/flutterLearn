// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import '../widgets/form.dart';

class Create extends StatefulWidget {
  final Function? refreshStudentList;
  Create({required this.refreshStudentList});
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
// Required for form validations
  final formKey = GlobalKey<FormState>();
// Handles text onchange
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
// Http post request to create new data
  Future _createStudent() async {
    return await http.post(
      Uri.parse("http://172.16.109.59/flutter_api/create.php"),
      body: {
        "name": nameController.text,
        "email": emailController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await _createStudent();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColorDark,
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          child: Text(
            'Confirm',
            textScaleFactor: 1.2,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              _onConfirm(context);
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              emailController: emailController,
            ),
          ),
        ),
      ),
    );
  }
}
