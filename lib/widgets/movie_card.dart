import 'package:dojoproject/constants.dart';
import 'package:dojoproject/widgets/movie_details.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.value,
    required this.img,
  });

  final int id;
  final String title;
  final String releaseDate;
  final double value;
  final String img;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          //color: Colors.blueAccent,
          height: 150,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetails(id: id),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: kBlueColor,
                    boxShadow: const [kDefaultShadow],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 160,
                    width: 200,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(img),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 126,
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1,
                              vertical: kDefaultPadding / 4),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                            color: kBlueColor,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star),
                              Text(
                                value.toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(width: 30),
                              const Icon(Icons.date_range),
                              Text(
                                releaseDate,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
