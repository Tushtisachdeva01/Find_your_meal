import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/meals', arguments: {'id': id, 'title': title}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: RadialGradient(
            radius: 0.7,
            colors: [
              color.withOpacity(0.3),
              color,
            ],
          ),
          // gradient: SweepGradient(
          //   // startAngle: 10,
          //   // endAngle: 40,
          //   colors: [
          //     color.withOpacity(0.3),
          //     color,
          //   ],
          // ),
          // gradient: LinearGradient(colors: [
          //   color.withOpacity(0.3),
          //   color,
          // ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
