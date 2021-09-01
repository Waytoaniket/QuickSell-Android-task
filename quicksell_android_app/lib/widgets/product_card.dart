import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quicksell_android_app/services/database.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final String? id;
  const ProductCard({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 85,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: StreamBuilder(
                    stream: DatabaseMethods().getProductImageById(id!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Image.asset("assets/images/imageLoader.gif");
                      } else {
                        if (snapshot.hasData)
                          return FadeInImage(
                            // image: NetworkImage(Constants.userData.profileImageUrl!),
                            image: NetworkImage(snapshot.data.value),

                            placeholder:
                                AssetImage('assets/images/imageLoader.gif'),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Container();
                            },
                            fit: BoxFit.cover,
                          );
                        else {
                          return Container();
                        }
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                        stream: DatabaseMethods().getProductNameById(id!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              child: Shimmer.fromColors(
                                child: Container(
                                  height: 12,
                                  margin: EdgeInsets.only(right: 50),
                                  color: Colors.amber,
                                ),
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                enabled: true,
                              ),
                            );
                          } else {
                            if (snapshot.hasData)
                              return Text(
                                snapshot.data.value == null
                                    ? "No Product Title"
                                    : snapshot.data.value,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              );
                            else {
                              return Text(
                                "No Product Title",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: 3),
                      StreamBuilder(
                        stream:
                            DatabaseMethods().getProductDescriptionById(id!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Shimmer.fromColors(
                                child: Container(
                                  height: 10,
                                  width: 200,
                                  color: Colors.amber,
                                ),
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                enabled: true,
                              ),
                            );
                          } else {
                            if (snapshot.hasData)
                              return Text(
                                snapshot.data.value == null
                                    ? "No Description"
                                    : snapshot.data.value.trim(),
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              );
                            else {
                              return Text(
                                "No Description",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                stream: DatabaseMethods().getProductPriceById(id!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      child: null,
                    );
                  } else {
                    if (snapshot.hasData)
                      return Container(
                        alignment: Alignment.center,
                        width: 50,
                        child: Text(
                          snapshot.data.value == null
                              ? "--"
                              : "₹ ${snapshot.data.value}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    else {
                      return Text("₹ 100",
                          style: TextStyle(color: Colors.white, fontSize: 18));
                    }
                  }
                },
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,
            margin: EdgeInsets.only(left: 120),
            color: Colors.black45,
          )
        ],
      ),
    );
  }
}
