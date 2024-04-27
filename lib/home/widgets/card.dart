import 'package:ch_app/home/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardProject extends StatefulWidget {
  const CardProject({super.key, required this.data});

  final Project data;

  @override
  State<CardProject> createState() => _CardProjectState();
}

class _CardProjectState extends State<CardProject> {
  late bool like;
  late bool favorite;

  @override
  void initState() {
    super.initState();
    like = false;
    favorite = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        child: InkWell(
          onTap: () {
            print("tap");
          },
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.network(
                  'https://895d-87-117-59-74.ngrok-free.app/api/photoItem/image/' +
                      widget.data.photos[0].fileName,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.5, 1],
                      colors: [
                        Colors.transparent,
                        Color(0x99000000),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 14,
                left: 16,
                right: 90,
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.description.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'RobotoFlex',
                                color: Colors.white,
                                height: 1),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.data.author.nickname,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'RobotoFlex',
                                color: Colors.white,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        like = !like;
                        setState(() {});
                      },
                      splashColor: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            like
                                ? 'assets/icons/like_pressed.svg'
                                : 'assets/icons/like.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "438k",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'RobotoFlex',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        favorite = !favorite;
                        setState(() {});
                      },
                      splashColor: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            favorite
                                ? 'assets/icons/heart_pressed.svg'
                                : 'assets/icons/heart.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "100k",
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'RobotoFlex',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
