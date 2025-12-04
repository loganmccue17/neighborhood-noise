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

List<BandsRecord> getListOfBandsToShowOnMap(
  List<BandsRecord> listOfBandsPreFilter,
  bool? filterByOnlyActive,
  String? searchText,
  LatLng? userLocation,
  List<String>? selectedGenres,
  double? filterRange,
) {
  double searchRadius = filterRange!;

  filterByOnlyActive ??= false;
  searchText = searchText?.trim() ?? "";

  selectedGenres = selectedGenres?.where((g) => g.trim().isNotEmpty).toList();

  if (userLocation == null) {
    return [];
  }

  final double userLong = userLocation.longitude * math.pi / 180;
  final double userLat = userLocation.latitude * math.pi / 180;
  const double R = 3959; // Radius of earth

  return listOfBandsPreFilter.where((band) {
    // Add your filtering logic here based on nullable parameters
    // Example: return band.isActive == true && band.genre != null;
    if (band == null) {
      return false;
    }
    if (band.latlong == null) {
      return false;
    }
    if (band.bandName == null) {
      return false;
    }
    if (band.genreKeywords == null) {
      return false;
    }

    double bandLat = band.latlong!.latitude * math.pi / 180;
    double bandLong = band.latlong!.longitude * math.pi / 180;

    final dLat = bandLat - userLat;
    final dLon = bandLong - userLong;

    //HAVERSINE FORMULA TO CONVERT 2 LATLONGS INTO DISTANCE
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(userLat) *
            math.cos(bandLat) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    final d = R * c; // Final Distance in miles

    try {
      // Active filter
      if (filterByOnlyActive! && band.hasActiveGigs != true) return false;

      // Distance filter
      if (d > searchRadius) return false;

      // Genre filter
      if (selectedGenres != null && selectedGenres.isNotEmpty) {
        final lowerKeywords =
            band.genreKeywords.map((k) => k.toLowerCase()).toList();

        final match = selectedGenres
            .any((g) => lowerKeywords.any((k) => k.contains(g.toLowerCase())));

        if (!match) return false;
      }

      // Search filter
      if (searchText!.isNotEmpty &&
          !band.bandName.toLowerCase().contains(searchText.toLowerCase())) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }).toList();
}
