import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

Loading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Container(
            child: Center(
                child: CircularProgressIndicator(color: clPrimary)));
      });
}
