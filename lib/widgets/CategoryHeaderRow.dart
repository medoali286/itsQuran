import 'package:flutter/material.dart';
import 'package:its_quran/Provider/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryHeaderRow extends StatelessWidget {
  final String title;
  final String caption;
  final String type;

  const CategoryHeaderRow({
     @required this.title = '',
     @required this.caption = '',
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.title),
              Text(
                this.caption,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
          OutlinedButton.icon(
            onPressed: () {
              Provider.of<HomeProvider>(context,listen: false).seeAll(type: type);
            },
            icon: Image.asset('assets/right.png'),
            label: Text('شاهد الكل',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).accentColor)),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              side: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
