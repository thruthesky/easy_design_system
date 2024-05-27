import 'package:flutter/material.dart';

Color containerBackgroundColor(BuildContext context) =>
    Theme.of(context).colorScheme.primaryContainer;

class SleekIconButtonThemeData {
  SleekIconButtonThemeData();

  static ThemeData of(BuildContext context) {
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            containerBackgroundColor(context),
          ),
        ),
      ),
    );
  }
}

/// SleekThemeData
///
/// [SleekThemeData] is a class that holds the color scheme for the Sleek theme.
class SleekThemeData {
  SleekThemeData();

  // final ColorScheme colorScheme;

  /// of
  ///
  /// [of] is a method that returns a [ThemeData] object with the color scheme
  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);
    // final theme = Theme.of(context).copyWith(
    //   colorScheme: ColorScheme.fromSeed(
    //     seedColor: const Color(0xFF6750A4),
    //     // brightness: Brightness.dark,
    //     error: const Color(0xFFB00020),
    //     onSurfaceVariant: Colors.pink,
    //     onSurface: Colors.pink,
    //     surface: Colors.pink,
    //     surfaceVariant: Colors.pink,
    //     primary: Colors.pink,
    //     onPrimary: Colors.pink,
    //     secondary: Colors.pink,
    //     onSecondary: Colors.pink,
    //     background: Colors.pink,
    //     onBackground: Colors.pink,
    //   ),
    // );
    return ThemeData(
      // NOTE: Did not set the badge color because it
      // should be up to the developer
      // by default it is set to colorScheme.error
      // badgeTheme: BadgeThemeData(
      //   backgroundColor: theme.colorScheme.primary,
      //   textColor: theme.colorScheme.onPrimary,
      // ),
      bottomAppBarTheme: theme.bottomAppBarTheme.copyWith(
        color: containerBackgroundColor(context),
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
          ),
        ),
      ),

      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        backgroundColor: theme.colorScheme.surfaceContainerHigh,
        // backgroundColor: Colors.red,
      ),

      cardTheme: theme.cardTheme.copyWith(
        // TODO fix it with proper colorscheming
        // this color uses `surfaceContainerLow` from color scheme by default
        // and the variant card.filled uses`surfaceContainerHigh` from color
        // scheme by default
        // color: theme.colorScheme.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      checkboxTheme: CheckboxThemeData(
        side: BorderSide(
          width: 0.5,
          color: theme.colorScheme.outline,
        ),
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.colorScheme.outline.withAlpha(50);
            }
            return null;
          },
        ),
      ),
      chipTheme: theme.chipTheme.copyWith(
        backgroundColor: containerBackgroundColor(context),
        selectedColor: theme.colorScheme.inversePrimary,

        // Note: Cannot use theme.chipTheme.shape here because
        // SDS's sleek wanted RoundedRectangleBorder
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide.none,
        ),
        side: BorderSide.none,
      ),

      // chipTheme: ChipThemeData(
      //   backgroundColor: containerBackgroundColor(context),
      //   selectedColor: theme.colorScheme.primary,
      //   labelStyle: TextStyle(
      //     color: theme.colorScheme.primary,
      //   ),
      //   secondaryLabelStyle: TextStyle(
      //     color: theme.colorScheme.onPrimary,
      //   ),
      //   labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      //   padding: const EdgeInsets.symmetric(horizontal: 8),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16),
      //     side: BorderSide.none,
      //   ),
      //   side: BorderSide.none,
      // ),
      colorScheme: Theme.of(context).colorScheme,
      dialogBackgroundColor: containerBackgroundColor(context),
      dialogTheme: DialogTheme(
        iconColor: theme.colorScheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          foregroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface),
          backgroundColor: WidgetStateProperty.all(
            containerBackgroundColor(context),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: containerBackgroundColor(context),
        elevation: 0,
        foregroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        highlightElevation: 0,
      ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        filled: true,
        fillColor: containerBackgroundColor(context),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide.none,
        ),
      ),
      listTileTheme: theme.listTileTheme.copyWith(
        tileColor: containerBackgroundColor(context),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      navigationBarTheme: theme.navigationBarTheme.copyWith(
        backgroundColor: containerBackgroundColor(context),
        indicatorColor: theme.colorScheme.onPrimary,
        iconTheme: WidgetStateProperty.resolveWith(
          (state) {
            if (state.contains(WidgetState.selected)) {
              return IconThemeData(
                color: theme.colorScheme.primary,
              );
            }
            return IconThemeData(
              // color: theme.colorScheme.onPrimary,
              color: theme.colorScheme.onPrimaryContainer,
            );
          },
        ),
        labelTextStyle: WidgetStateTextStyle.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 12,
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            );
          }
          return TextStyle(
            fontSize: 12,
            color: theme.colorScheme.onPrimaryContainer,
          );
        }),
        elevation: 0,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearTrackColor: containerBackgroundColor(context).withAlpha(80),
      ),
      // segmentedButtonTheme: const SegmentedButtonThemeData(
      // style: SegmentedButton.styleFrom(
      //   // selectedBackgroundColor: theme.colorScheme.primary,
      //   // selectedForegroundColor: theme.colorScheme.onPrimary,
      //   // backgroundColor: containerBackgroundColor(context),
      //   side: BorderSide.none,
      //   elevation: 0,
      // ),
      // ),
      segmentedButtonTheme: theme.segmentedButtonTheme.copyWith(
        style: SegmentedButton.styleFrom(
          // The idea of sleek design is solid, unbordered. However,
          // the color it uses might be surface that doesn't follow/look like the sleek
          // idea when we removed the border. That is why we need to give color
          // for selectedBackgroundColor, selectedForegroundColor, and backgroundColor.
          selectedBackgroundColor: theme.colorScheme.primary,
          selectedForegroundColor: theme.colorScheme.onPrimary,
          backgroundColor: containerBackgroundColor(context),
          side: BorderSide.none,
          elevation: 0,
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: containerBackgroundColor(context),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),

      //
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface),
      //     backgroundColor: WidgetStateProperty.all(
      //       containerBackgroundColor(context),
      //     ),
      //     shape: WidgetStateProperty.all(
      //       RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(24),
      //       ),
      //     ),
      //   ),
      // ),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        backgroundColor: containerBackgroundColor(context),
        contentTextStyle: TextStyle(
          color: theme.colorScheme.onPrimaryContainer,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        actionTextColor: theme.colorScheme.primary,
      ),
    );
  }
}

/// SleekTheme
///
/// [SleekTheme] is a class that returns a [Theme] widget with the [SleekThemeData] object
class SleekTheme extends StatelessWidget {
  const SleekTheme({super.key, required this.child});

  final Widget child;

  static ThemeData of(BuildContext context) {
    return SleekThemeData.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: SleekThemeData.of(context),
      child: child,
    );
  }
}
