import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_account_settings_controller.dart';

class EditAccountSettingsView extends GetView<EditAccountSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditAccountSettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditAccountSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
