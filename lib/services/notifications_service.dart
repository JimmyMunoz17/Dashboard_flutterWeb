//Mostar snackbar

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsService {
  //llamar las notificaciones ne cualquier parte
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Text(
          message,
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
        ));
    //Mostar el snackbar
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackbarOk(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.blue.withOpacity(0.9),
        content: Text(
          message,
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
        ));
    //Mostar el snackbar
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showBusyIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(context: context, builder: (_) => dialog);
  }
}
