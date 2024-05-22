import 'package:apexive_assignment/core/theme/light.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:apexive_assignment/core/models/app_timer.dart';

class DetailsTab extends StatelessWidget {
  final AppTimer appTimer;
  const DetailsTab({
    super.key,
    required this.appTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailView(
                  label: 'Project',
                  value: appTimer.project.name,
                  showMarker: true,
                ),
                const SizedBox(height: 16),
                DetailView(
                  label: 'Deadline',
                  value: Utils.formatDateTime(appTimer.project.deadline),
                ),
                const SizedBox(height: 16),
                const DetailView(
                  label: 'Assigned To',
                  value: 'Ivan Zhuikov',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: StaticDescriptionView(text: appTimer.description),
          ),
        ],
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  final String label;
  final String value;
  final bool showMarker;
  const DetailView({
    super.key,
    required this.label,
    required this.value,
    this.showMarker = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Row(
          children: [
            if (showMarker)
              Container(
                height: 24,
                width: 2,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: indicatorColor,
                ),
              ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}

class StaticDescriptionView extends StatelessWidget {
  final String text;
  const StaticDescriptionView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          child: Text(
            'Description',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
