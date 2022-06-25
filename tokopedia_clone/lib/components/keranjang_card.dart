import "package:flutter/material.dart";
import "package:tokopedia_clone/models/produk.dart";
import "package:tokopedia_clone/components/theme.dart";

class KeranjangCard extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final Kategori kategori;

  KeranjangCard({required this.widthSize, required this.heightSize, required this.kategori});

  @override
  Widget build(BuildContext context) {
    bool isCheckToko = true;
    bool isCheckBarang = true;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
      height: heightSize * 0.3,
      width: widthSize - 2 * defaultMargin,
      color: Colors.amber,
    );
  }
}