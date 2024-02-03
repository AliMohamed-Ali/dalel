import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigation(BuildContext context, String path) {
    GoRouter.of(context).push(path);
  }