import 'package:contacts_app/ui/di/navigation.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import 'package:ui_kit/ui_kit.dart';

class DetailContact extends StatelessWidget {
  const DetailContact({required this.model, super.key});

  final ContactModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      appBar: CupertinoNavigationBar(
        border: Border.all(color: Colors.transparent),
        backgroundColor: CupertinoColors.lightBackgroundGray,
        trailing: GestureDetector(
          onTap: () => context.go(Routes.edit, extra: model),
          child: Text(
            'Edit',
             style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
        ),
        leading: GestureDetector(
          onTap: () => context.go(Routes.init),
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: Column(
        children: [
          ProfileWidget(
            nameString: model.firstName,
            surnameString: model.lastName,
          ),
          const SizedBox(height: 4.0),
          Text(
            model.company,
            style: theme.bodyLarge,
          ),
          const SizedBox(height: 4.0),
          Text(
            '${model.firstName} ${model.lastName}',
            style: theme.headlineLarge,
          ),
          const SizedBox(height: 4.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () async {
                await url.launchUrl(Uri(path: 'tel://${model.phoneNumber}'));
              },
              child: CupertinoContainer(
                title: 'Phone',
                child: Text(
                  model.phoneNumber,
                  style: theme.bodyLarge?.copyWith(color: CupertinoColors.activeBlue),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CupertinoContainer(
              title: 'home',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.streetAddress1),
                  const SizedBox(height: 4.0),
                  Text(model.streetAddress2),
                  const SizedBox(height: 4.0),
                  Text(model.city),
                  const SizedBox(height: 4.0),
                  Text(model.state),
                  const SizedBox(height: 4.0),
                  Text(model.zipCode),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
