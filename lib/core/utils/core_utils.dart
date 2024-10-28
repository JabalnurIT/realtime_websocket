import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../res/colours.dart';

class CoreUtils {
  const CoreUtils._();

  static void showSnackBar(BuildContext context, String message,
      {bool successStatus = true, bool boldColor = true}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: boldColor
                  ? Colours.snackBarColour
                  : successStatus
                      ? Colours.snackBarBoldColour
                      : Colours.errorColour,
              fontWeight: FontWeight.bold,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: boldColor
              ? successStatus
                  ? Colours.snackBarBoldColour
                  : Colours.errorColour
              : Colours.snackBarColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(10),
        ),
      );
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '**Field tidak boleh kosong';
    } else if (value.length < 10) {
      return '**Nomor telepon tidak valid';
    } else if (value.length > 13) {
      return '**Nomor telepon tidak valid';
    } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return '**Nomor telepon tidak valid';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '**Field tidak boleh kosong';
    } else if (!value.contains('@')) {
      return '**Format email tidak valid';
    } else if (!value.contains('.')) {
      return '**Format email tidak valid';
    } else if (value.contains(' ')) {
      return '**Format email tidak valid';
    }

    return null;
  }

  static String? fileToUriBase64(File? file) {
    if (file == null) {
      return null;
    }
    final filePath = file.path;
    final base64File = base64Encode(file.readAsBytesSync());
    String uriBase64;
    if (filePath.split('/').last.split('.').last == "pdf") {
      uriBase64 = "data:application/pdf;base64,$base64File";
    } else if (filePath.split('/').last.split('.').last == "docx" ||
        filePath.split('/').last.split('.').last == "doc") {
      uriBase64 = "data:application/msword;base64,$base64File";
    } else {
      uriBase64 =
          "data:image/${filePath.split('/').last.split('.').last};base64,$base64File";
    }
    return uriBase64;
  }

  static DateTime timestampToDateTime(String timestamp) {
    final int timestampInt = int.parse(timestamp);
    return DateTime.fromMillisecondsSinceEpoch(timestampInt);
  }

  static String timestampToSecond(String timestamp) {
    final int timestampInt = int.parse(timestamp);
    return (timestampInt / 1000).toStringAsFixed(0);
  }

  // timestamp to time (hh:mm:ss)
  static String timestampToTime(String timestamp) {
    final int timestampInt = int.parse(timestamp);
    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInt);
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  // string to dollar currency format
  static String toCurrencyFormat(double value) {
    String result = value.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    // change , to . and remove 00
    result = result.replaceAll(RegExp(r'\.00'), '').replaceAll(',', '.');
    return 'Rp$result';
  }

  static String formatCurrency(String value) {
    if (value.isEmpty) {
      return '';
    }
    final double amount = double.parse(value.replaceAll(RegExp(r'[^\d]'), ''));
    String result = amount.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

    result = result.replaceAll(RegExp(r'\.00'), '').replaceAll(',', '.');
    return result;
  }

  static double currencyToDouble(String value) {
    return double.parse(value.replaceAll(RegExp(r'[^\d]'), ''));
  }
}
