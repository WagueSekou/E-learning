import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "here we will deteail every thing you need to know on this language please dont stop sicking for more and more",
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Course Length: ",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              // Spacer(),
              Icon(
                Icons.timer,
                color: Colors.purple[200],
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "24 hours",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Rating: ",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "4.5",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
