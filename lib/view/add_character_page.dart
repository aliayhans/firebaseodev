import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebaseodev/view/common/common_text_field.dart';
import 'package:firebaseodev/view_model/add_character_view_model.dart';

class AddCharacterPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  AddCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Characters"),
        centerTitle: true,
        backgroundColor: Colors.red.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildEmailTextField(),
                SizedBox(height: 16),
                _buildSurnameTextField(),
                SizedBox(height: 16),
                _buildAgeTextField(),
                SizedBox(height: 16),
                _buildPasswordTextField(),
              ],
            ),
            _buildAddCharacterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextField(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildSurnameTextField() {
    return CommonTextField(
      controller: _surnameController,
      label: "Surname",
    );
  }

  Widget _buildAgeTextField() {
    return CommonTextField(
      controller: _ageController,
      label: "Age",
    );
  }

  Widget _buildPasswordTextField() {
    return CommonTextField(
      controller: _genderController,
      label: "Gender",
    );
  }

  Widget _buildAddCharacterButton(BuildContext context) {
    AddCharacterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("Karakter Ekle"),
      onPressed: () {
        viewModel.addCharacter(
          context,
          _nameController.text.trim(),
          _surnameController.text.trim(),
          _ageController.text.trim(),
          _genderController.text.trim(),
        );
      },
    );
  }

}
