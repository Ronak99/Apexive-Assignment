import 'package:apexive_assignment/shared/constants/assets.dart';
import 'package:apexive_assignment/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DescriptionView extends StatefulWidget {
  final String text;
  const DescriptionView({
    super.key,
    required this.text,
  });

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool isOverflowed = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w400,
        );

    if (Utils.doesExceedsMaxLines(
      context: context,
      text: widget.text,
      maxLines: 2,
      textStyle: textStyle,
    )) {
      isOverflowed = true;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Container(
                height: 32,
                width: 32,
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.pencil),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            if (!isOverflowed) return;
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.text,
                maxLines: isExpanded ? null : 2,
                overflow: isExpanded ? null : TextOverflow.ellipsis,
                style: textStyle,
              ),
              if (!isExpanded && isOverflowed)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Read More',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
