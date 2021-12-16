import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/WebScreen/WebScreen.dart';

Widget buildnewsItems(list, context) => InkWell(
      onTap: () {
        Navegato(context, WebScreen(list['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage('${list['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${list['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${list['publishedAt']}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget elghat() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.grey,
      ),
    );

Widget articalbuilder(list , {isSearch = false }) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildnewsItems(list[index], context),
          separatorBuilder: (context, index) => elghat(),
          itemCount: list.length),
      fallback: (context) => isSearch ? Center(
        child: Container(
          child: Text(
            'Search Screen ',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.grey ,
            ),
          ),
        ),
      ) : Center(child: CircularProgressIndicator()),
    );



Widget defulteditTextx({
  required TextEditingController Controlar,
  required TextInputType keyboardType,
  Function? onfiled,
  Function? onchanged,
  GestureTapCallback? ontab,
  FormFieldValidator<String>? validator,
  required String Lable,
  IconData? prefix,
  IconData? sufix,
  bool? obscureText = false,
  InputDecoration? InputDecorationn ,
}) =>
    TextFormField(
      onTap: ontab,
      obscureText: obscureText!,
      controller: Controlar,
      keyboardType: keyboardType,
      onFieldSubmitted: (s) {
        onfiled!(s);
      },
      onChanged: (s) {
        onchanged!(s);
      },
      validator: validator,
      decoration: InputDecorationn ,
    );

Future Navegato(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
