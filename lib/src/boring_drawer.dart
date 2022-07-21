import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoringDrawer extends Drawer {
  BoringDrawer(this.selectedIndex,
      {Key? key,
      this.elevation,
      this.header,
      this.cornerRadius = 0,
      this.backgroundColor,
      this.selectedColor,
      this.unselectedTextColor,
      this.selectedTextColor})
      : assert(selectedIndex >= 0),
        assert(cornerRadius >= 0),
        super(key: key);
  final int selectedIndex;
  final double? elevation;
  final double cornerRadius;
  final Widget? header;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  final List<String> paths = ["HOME", "A", "B"];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          //side: BorderSide(color: Colors.grey),
          borderRadius:
              BorderRadius.horizontal(right: Radius.circular(cornerRadius))),
      child: Padding(
        padding: EdgeInsets.only(
            top: (header != null && cornerRadius > 0) ? 0 : cornerRadius),
        child: ListView.builder(
            itemCount: header != null ? paths.length + 1 : paths.length,
            itemBuilder: (context, index) {
              if (header != null) {
                if (index == 0) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(cornerRadius)),
                    child: header!,
                  );
                }
                index--;
              }
              final listTile = ListTile(
                title: Text(paths[index]),
                textColor: index == selectedIndex
                    ? selectedColor ?? Colors.white
                    : null,
                selected: false,
                hoverColor: index == selectedIndex ? Colors.transparent : null,
                onTap: () => GoRouter.of(context)
                    .go("/${paths[index].toLowerCase().replaceAll(" ", "-")}"),
              );
              if (index != selectedIndex) {
                return listTile;
              }
              return Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Hero(
                    tag: "navigation-tile",
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0)),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: Container(
                            color: selectedColor ??
                                Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  listTile
                ],
              );
            }),
      ),
    );
  }
}
