import 'package:elements/core/theme_colors.dart';
import 'package:flutter/material.dart';

class TinderLogoWidget extends Widget {
  final double logoSize;

  const TinderLogoWidget({super.key, this.logoSize = 120});

  @override
  Element createElement() => TinderLogoElement(this);
}

class TinderLogoElement extends ComponentElement {
  TinderLogoElement(super.widget);

  @override
  Widget build() {
    final logo = widget as TinderLogoWidget;

    return SizedBox(
      width: logo.logoSize,
      height: logo.logoSize,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: logo.logoSize / 4),
                  Container(
                    width: logo.logoSize * 7 / 12,
                    height: logo.logoSize * 7 / 12,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(logo.logoSize * 7 / 12),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: logo.logoSize * 10 / 12,
                height: logo.logoSize * 5 / 12,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(logo.logoSize * 5 / 12),
                    bottomRight: Radius.circular(logo.logoSize * 5 / 12),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: logo.logoSize * 1 / 6,
            left: logo.logoSize * 1 / 12,
            child: Container(
              width: logo.logoSize * 9.05 / 12,
              height: logo.logoSize * 9.05 / 12,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(
                  Radius.circular(logo.logoSize * 4.525 / 12),
                ),
              ),
            ),
          ),
          Positioned(
            left: logo.logoSize * 2.8 / 12,
            child: Container(
              width: logo.logoSize * 1 / 4,
              height: logo.logoSize * 4.5 / 12,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(
                    logo.logoSize * 2.5 / 12,
                    logo.logoSize * 3.5 / 12,
                  ),
                  bottomLeft: Radius.elliptical(
                    logo.logoSize * 1 / 24,
                    logo.logoSize * 4.5 / 12,
                  ),
                  topRight: Radius.elliptical(0, logo.logoSize * 1 / 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
