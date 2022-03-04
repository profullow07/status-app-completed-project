import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Favoritebuton extends StatefulWidget {
  const Favoritebuton({
    Key? key,
  }) : super(key: key);

  @override
  State<Favoritebuton> createState() => _FavoritebutonState();
}

class _FavoritebutonState extends State<Favoritebuton> {
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    this.isLiked = !isLiked;
    likecount += this.isLiked ? 1 : -1;

    return !isLiked;
  }

  bool isLiked = false;
  int likecount = 0;

  @override
  Widget build(BuildContext context) {
    final double buttonSize = 50;

    return LikeButton(
      onTap: (onLikeButtonTapped),
      size: buttonSize,
      likeCount: likecount,
      isLiked: isLiked,
      circleColor:
          CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Color(0xff33b5e5),
        dotSecondaryColor: Color(0xff0099cc),
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey,
          size: buttonSize,
        );
      },
      countBuilder: (Counter, isLiked, text) => Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: isLiked ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
