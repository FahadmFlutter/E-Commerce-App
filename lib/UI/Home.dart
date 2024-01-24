import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/Bloc/product_bloc.dart';
import 'package:product/Repository/Model_class/ProductModel.dart';

import 'Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late ProductModel data;
TextEditingController controller = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        title: Text(
          'E-Commerce App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 260,
                      child: TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: 'Search products',
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(controller.text);
                        BlocProvider.of<ProductBloc>(context)
                            .add(Fetchprodect(Product: controller.text));
                      },
                      child: Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductBlocLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                }
                if (state is ProductBlocError) {
                  return Center(
                    child: Text(
                      ':(',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[100],
                          fontSize: 100),
                    ),
                  );
                }
                if (state is ProductBlocLoaded) {
                  data = BlocProvider.of<ProductBloc>(context).productModel;
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: GridView.count(
                          physics: ScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 170 / 270,
                          shrinkWrap: true,
                          children: List.generate(data.data!.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Details(
                                          img: data
                                              .data![index].productPhotos![0]
                                              .toString(),
                                          title: data.data![index].productTitle!
                                              .toString(),
                                          description:data.data![index].productDescription==null?"": data.data![index].productDescription!
                                              .toString(),
                                          rateing:data.data![index].productRating==null?"": data.data![index].productRating!
                                              .toString(),
                                          price:data.data![index].offer!.price==null?"": data.data![index].offer!.price.toString(),
                                        )));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 170,
                                    width: 200,
                                    color: Colors.black,
                                    child: Image.network(
                                      data.data![index].productPhotos![0]
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                      width: 160,
                                      height: 50,
                                      child: Text(
                                        data.data![index].productTitle
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                      )),
                                  Container(
                                      width: 160,
                                      child: Text(
                                        data.data![index].offer!.price
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 500,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
// ListView.separated(physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemBuilder:(BuildContext context, int index){
// return Column(
// children: [
// Container(
// height: 100,width: 150,
// child: Image.network(data.data![index].productPhotos![0].toString(),fit: BoxFit.fitWidth,),
// )
// ],
// );
// },
// separatorBuilder: (BuildContext context, int index){
// return SizedBox(height: 10,);
// },
// itemCount:data.data!.length),
