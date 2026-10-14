import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

void showMessage(BuildContext context, String message) {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();

  messenger.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.foushi,
    ),
  );
}