import 'package:example/widgets/nothing_to_learn.dart';
import 'package:flutter/material.dart';
import 'package:social_design_system/social_design_system.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  DisplayBottomSheet(
                    label: 'Display Comic Bottomsheet',
                    themeData: ComicTheme.of(context),
                    isModal: false,
                  ),
                  DisplayBottomSheet(
                    label: 'Display Comic Modal Bottomsheet',
                    themeData: ComicTheme.of(context),
                    isModal: true,
                  ),
                  DisplayBottomSheet(
                    label: 'Display Sleek Bottomsheet',
                    themeData: SleekTheme.of(context),
                    isModal: false,
                  ),
                  DisplayBottomSheet(
                    label: 'Display Sleek Modal Bottomsheet',
                    themeData: SleekTheme.of(context),
                    isModal: true,
                  ),
                ],
              ),
              const NothingToLearn(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayBottomSheet extends StatelessWidget {
  const DisplayBottomSheet({
    super.key,
    required this.label,
    required this.themeData,
    required this.isModal,
  });
  final String label;
  final ThemeData themeData;
  final bool isModal;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: ElevatedButton(
        onPressed: () {
          if (isModal) {
            showModalBottomSheet(
              context: context,
              builder: (context) => Theme(
                data: themeData,
                child: BottomSheet(
                  onClosing: () {},
                  builder: (context) => content(context),
                ),
              ),
            );
          } else {
            showBottomSheet(
              context: context,
              builder: (context) => Theme(
                data: themeData,
                child: BottomSheet(
                  onClosing: () {},
                  builder: (context) => content(context),
                ),
              ),
            );
          }
        },
        child: Text(label),
      ),
    );
  }

  SizedBox content(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ),
    );
  }
}
