import "package:flutter/material.dart";
import "package:tokopedia_clone/models/produk.dart";
import "package:tokopedia_clone/components/theme.dart";

class ProdukData extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final Produk produk;

  ProdukData({required this.widthSize, required this.heightSize, required this.produk});

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget> [
                Ink.image(
                  height: 250,
                  image: AssetImage(produk.fotoProduk),
                  fit: BoxFit.fitWidth,
                )
              ]
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(produk.namaProduk, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(produk.namaToko, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("Rp. ${produk.hargaProduk.toString()}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget> [
                IconButton(
                  icon: Icon(Icons.remove_shopping_cart_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_outline),
                  onPressed: () {},
                )
              ]
            )
          ]
        )
      )
    );
  }
}