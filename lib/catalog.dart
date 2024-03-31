import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/catalog_details.dart';
import 'package:lesson4/catalog_model.dart';

class Catalog extends StatefulWidget {
  String categoryName;
  Catalog({super.key, required this.categoryName});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Products> products = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future getProducts() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(Uri.parse(
        'https://dummyjson.com/products/category/${widget.categoryName}'));

    if (response.statusCode == 200) {
      CatalogModel catalogModel =
          CatalogModel.fromJson(jsonDecode(response.body));

      setState(() {
        products = catalogModel.products!;
        loading = false;
      });
    } else {
      throw 'error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProducts();
        },
        child: loading == true
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(20.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CatalogDetails(
                                image: products[index].images!.first,
                                title: products[index].title!,
                                description: products[index].description!,
                                price: products[index].price.toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  products[index].images!.first,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                products[index].title!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${products[index].price.toString()} ₸',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
