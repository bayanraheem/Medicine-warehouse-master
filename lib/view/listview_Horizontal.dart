
import 'package:apothecary/controller/Product.dart';
import 'package:flutter/material.dart';
class listview_Horizontal extends StatelessWidget{
  final Product product;
  Function()?ontap;

  listview_Horizontal({super.key, required this.product,required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap:ontap,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left:15,right:15,top:10 ),
                      margin: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2.0,2.0),
                              blurRadius: 10,
                              spreadRadius: 1.0,
                            )
                          ]

                      ),
                      child:Column(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 100,width: 170,
                              margin:EdgeInsets.all(10) ,
                              child: Image.asset(product.image,fit: BoxFit.fill,),

                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 8),
                            child: Container(
                              alignment:Alignment.centerLeft,
                              child: Text(
                                product.title, style: TextStyle(color:Colors.black,fontSize: 16,
                                fontWeight: FontWeight.bold,),
                              ),
                            ),),
                          Padding(padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("  \$${product.Price}",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
                                Icon(Icons.shopping_cart_outlined,size: 26,)
                              ],
                            ),
                          )
                        ],
                      )

                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}