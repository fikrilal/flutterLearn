import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/env.sample.dart';
import '../models/student.dart';
import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Student student;
  Edit({required this.student});
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
// This is for form validations
  final formKey = GlobalKey<FormState>();
// This is for text onChange
  late TextEditingController nameController;
  late TextEditingController emailController;
// Http post request
  Future editStudent() async {
    return await http.post(
      Uri.parse("http://172.16.109.59/flutter_api/update.php"),
      body: {
        "id": widget.student.id.toString(),
        "name": nameController.text,
        "email": emailController.text
      },
    );
  }

  void _onConfirm(context) async {
    await editStudent();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.student.name);
    emailController =
        TextEditingController(text: widget.student.email.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
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
            _onConfirm(context);
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
