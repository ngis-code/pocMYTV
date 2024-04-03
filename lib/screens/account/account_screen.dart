import 'package:flutter/material.dart';
import 'package:pocmytv/utils/shader_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderWidget(
        child: Text(
          'Coming Soon...',
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
