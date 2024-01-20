import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tuple/tuple.dart';

class CustomImageButton extends StatelessWidget {
  final List<Tuple2<String, Function()>> buttons;

  const CustomImageButton({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 60.0),
      height: 48.0,
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 30.0 / (buttons.length - 1.0),
            );
          },
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            return Center(
              child: SizedBox(
                width: (MediaQuery.of(context).size.width -
                        ((buttons.length == 1.0) ? 60.0 : 90.0)) /
                    buttons.length,
                child: ElevatedButton(
                  onPressed: buttons[index].item2,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    elevation: 1.0,
                    minimumSize: Size(
                      (MediaQuery.of(context).size.width - 90.0) /
                          buttons.length,
                      48.0,
                    ),
                  ),
                  child: (Theme.of(context).brightness == Brightness.light)
                      ? SvgPicture.asset(
                          buttons[index].item1,
                        )
                      : SvgPicture.asset(
                          buttons[index].item1,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onBackground,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
