import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lovedan/screens/add_post_screen.dart';
import 'package:lovedan/screens/feed_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  FeedScreen(),
  AddPostScreen(),
];
