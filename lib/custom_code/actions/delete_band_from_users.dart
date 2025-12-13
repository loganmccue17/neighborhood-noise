// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteBandFromUsers(
  List<DocumentReference> memberDocs,
  DocumentReference bandDoc,
) async {
  // Get Firestore instance
  final firestore = FirebaseFirestore.instance;

  // Create a batch for efficient bulk operations
  WriteBatch batch = firestore.batch();

  // Loop through each user document reference
  for (DocumentReference memberRef in memberDocs) {
    // Remove the bandDoc from the users_bands array field
    batch.update(memberRef, {
      'users_bands': FieldValue.arrayRemove([bandDoc])
    });
  }

  // Commit all updates at once
  await batch.commit();
}
