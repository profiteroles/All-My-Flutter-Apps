import 'package:flutter/material.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    Key? key,
    required this.email,
    required this.toggleTheme,
    required this.isThemeDark,
  }) : super(key: key);
  final String email;
  final Function(bool) toggleTheme;
  final bool isThemeDark;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Personal Information',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
            ),
            ListTile(
              leading: Text('E-mail', style: Theme.of(context).textTheme.subtitle1),
              trailing: Text(email, style: Theme.of(context).textTheme.subtitle1),
            ),
            SwitchListTile(
              value: isThemeDark,
              onChanged: toggleTheme,
              title: Text('Dark Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
