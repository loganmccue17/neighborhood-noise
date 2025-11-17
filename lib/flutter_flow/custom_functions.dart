import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int toInt(String s) {
  // Convert a String to an int safely; return -1 if conversion fails
  return int.tryParse(s) ?? -1;
}

bool? shouldBandShow(
  String bandName,
  List<String> bandGenres,
  bool bandHasActiveGigs,
  String searchText,
  List<String> selectedGenres,
  bool showActiveGigsOnly,
) {
  // Filter 1: Search text
  if (searchText.isNotEmpty) {
    if (!bandName.toLowerCase().contains(searchText.toLowerCase())) {
      return false;
    }
  }

  // Filter 2: Genre
  if (selectedGenres.isNotEmpty) {
    bool hasMatchingGenre = false;
    for (String genre in selectedGenres) {
      if (bandGenres.contains(genre)) {
        hasMatchingGenre = true;
        break;
      }
    }
    if (!hasMatchingGenre) {
      return false;
    }
  }

  // Filter 3: Active gigs
  if (showActiveGigsOnly && !bandHasActiveGigs) {
    return false;
  }

  return true;
}

LatLng? latlongconvert(
  double lat,
  double long,
) {
  return LatLng(lat, long);
}
