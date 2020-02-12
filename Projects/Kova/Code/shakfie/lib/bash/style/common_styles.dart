import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonStyles {
  static textFormFieldStyle(String label, String hint,IconData icon,BuildContext context) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.all(12),
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,)
            ),
      suffixIcon: Icon(icon)


    );
  }

  static textFormFieldStyleWithoutSuffix(String label, String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.all(12),
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,)
      ),


    );
  }

    static textFormFieldStyleWithPrefix(String label, String hint,IconData icon) {
      return InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(12),
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,)
        ),
        suffix: Icon(icon)



      );

  }
}
