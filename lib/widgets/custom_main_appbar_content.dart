import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moviesapp/widgets/custom_movies_button.dart';
import 'package:sizer/sizer.dart';
import 'package:moviesapp/utils/constants.dart';

class CustomMainAppBarContent extends StatefulWidget {
  final String title;
  final Color? activeColor;
  final Function? searchOnPressed;
  final Function(int)? buttonFistOnPressed;
  final Function(int)? buttonSecondOnPressed;
  final Function(int)? buttonThirdOnPressed;
  final bool showSlider;
  final int? activeButtonIndex;
  Color _firstColor = kLightGrey;
  Color _secondColor = kLightGrey;
  Color _thirdColor = kLightGrey;

  CustomMainAppBarContent({
    required this.showSlider,
    required this.title,
    this.activeButtonIndex,
    this.activeColor,
    required this.searchOnPressed,
    this.buttonFistOnPressed,
    this.buttonSecondOnPressed,
    this.buttonThirdOnPressed,
  }) {
    if (activeButtonIndex != null) changeButtonsColor(activeButtonIndex!);
  }

  void changeButtonsColor(int index) {
    switch (index) {
      case 0:
        _firstColor = activeColor!;
        _secondColor = kLightGrey;
        _thirdColor = kLightGrey;
        break;
      case 1:
        _firstColor = kLightGrey;
        _secondColor = activeColor!;
        _thirdColor = kLightGrey;
        break;
      default:
        _firstColor = kLightGrey;
        _secondColor = kLightGrey;
        _thirdColor = activeColor!;
    }
  }

  @override
  _CustomMainAppBarContentState createState() =>
      _CustomMainAppBarContentState();
}

class _CustomMainAppBarContentState extends State<CustomMainAppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D"            ),
          ),
          title: Row(
            children: [
              Text("Hello",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text("Hassan",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white70),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child:
                Transform.rotate(
                    angle: -40 * (pi / 180),
                    child: Icon(Icons.front_hand,color: Colors.amber,size: 20,)) ),
            ],
          ),
subtitle: Text("Get movies information",style: TextStyle(color: Colors.white38),),

          trailing: (widget.showSlider)
              ? IconButton(
                  onPressed: () {
                    widget.searchOnPressed!();
                  },
                  icon: Container(
                    padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightGrey.withOpacity(0.5),
                      ),
                      child: Icon(Icons.search, size: 20,color: Colors.white,)),
                )
              : null,
        ),
        SizedBox(height: 3.h),
        if (widget.showSlider)
          if (widget.activeButtonIndex != null)
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0.h, left: 4.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomMoviesButton(
                      text: kHomeScreenButtonFirstText,
                      onPressed: () {
                        setState(() {
                          widget.buttonFistOnPressed!(0);
                        });
                      },
                      color: widget._firstColor,
                    ),
                    SizedBox(width: 5.w),
                    CustomMoviesButton(
                      text: kHomeScreenButtonSecondText,
                      onPressed: () {
                        setState(() {
                          widget.buttonSecondOnPressed!(1);
                        });
                      },
                      color: widget._secondColor,
                    ),
                    SizedBox(width: 5.w),
                    CustomMoviesButton(
                      text: kHomeScreenButtonThirdText,
                      onPressed: () {
                        setState(() {
                          widget.buttonThirdOnPressed!(2);
                        });
                      },
                      color: widget._thirdColor,
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
