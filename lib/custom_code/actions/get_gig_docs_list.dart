// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

Future<List<GigsRecord>> getGigDocsList(List<BandsRecord>? bandsList,
    LatLng? userLocation, double searchRadius) async {
  // Add your function code here!

  if (bandsList == null) {
    return [];
  }
  if (userLocation == null) {
    return [];
  }

  final double userLong = userLocation.longitude * math.pi / 180;
  final double userLat = userLocation.latitude * math.pi / 180;
  const double R = 3959; // Radius of earth

  List<GigsRecord> totalGigList = [];
  for (BandsRecord band in bandsList) {
    print(band.bandName);
    var bandGigList = band.gigs;
    for (var gig in bandGigList) {
      try {
        print((await gig.get()).data());
        print(band.gigs);
        final gigDoc = await GigsRecord.getDocumentOnce(gig);
        print(gigDoc.bandPostedName);
        print(gigDoc.locationName);
        if (gigDoc.location == null) continue;

        double gigLat = gigDoc.location!.latitude * math.pi / 180;
        double gigLong = gigDoc.location!.longitude * math.pi / 180;

        final dLat = gigLat - userLat;
        final dLon = gigLong - userLong;

        //HAVERSINE FORMULA TO CONVERT 2 LATLONGS INTO DISTANCE
        final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
            math.cos(userLat) *
                math.cos(gigLat) *
                math.sin(dLon / 2) *
                math.sin(dLon / 2);
        final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
        final d = R * c; // Final Distance in miles

        if (d < searchRadius) {
          totalGigList.add(gigDoc);
        }
      } catch (e) {
        //:(
        print(e);
        continue;
      }
    }
  }
  return totalGigList;
}
