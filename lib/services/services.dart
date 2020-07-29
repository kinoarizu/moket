/// List of libraries that used by services
import 'dart:convert';

/// List of packages that used by services
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/extensions/extensions.dart';
import 'package:flutix/shared/shared.dart';
import 'package:http/http.dart' as http;

/// List of Service
part 'auth_services.dart';
part 'user_services.dart';
part 'movie_services.dart';
part 'ticket_services.dart';
part 'transactions_services.dart';
