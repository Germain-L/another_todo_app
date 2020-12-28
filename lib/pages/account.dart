import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/navigation.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<Navigation>(context);
    return Center(
      child: Text("Account page")
    );
  }
}