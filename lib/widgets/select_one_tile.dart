import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';

class SelectOneTile extends StatelessWidget {
  final bool isSelected;
  final void Function() onPressed;
  final String label;
  final bool enabled;
  const SelectOneTile({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FocusWidget(
      onTap: onPressed,
      enabled: enabled,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      backgroundColor: enabled
          ? isSelected
              ? Colors.red
              : Colors.transparent
          : theme.colorScheme.surface.withOpacity(0.5),
      borderRadius: 20,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected ? const Icon(Icons.done_rounded) : Container(),
          Text(
            label,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: enabled ? Colors.white : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
