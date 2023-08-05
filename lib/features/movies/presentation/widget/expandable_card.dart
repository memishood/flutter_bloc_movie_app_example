import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_movie_app_example/core/extension/widget_extensions.dart';

class ExpandableCard extends StatefulWidget {
  const ExpandableCard({
    super.key,
    required this.title,
    required this.onChanged,
    required this.expanded,
    this.initialExpanded = false,
  });
  final String title;
  final ValueChanged<bool> onChanged;
  final Widget expanded;
  final bool initialExpanded;

  @override
  State<StatefulWidget> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  final expandableController = ExpandableController();

  @override
  void initState() {
    expandableController
      ..addListener(() => widget.onChanged(expandableController.expanded))
      ..expanded = widget.initialExpanded;
    super.initState();
  }

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpandablePanel(
        controller: expandableController,
        header: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        collapsed: const SizedBox.shrink(),
        expanded: widget.expanded,
        theme: const ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
        ),
      ).paddingAll(16),
    );
  }
}
