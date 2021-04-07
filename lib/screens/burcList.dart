import 'package:burcRehberi/models/burc.dart';
import 'package:burcRehberi/screens/burcDetails.dart';
import 'package:flutter/material.dart';
import 'package:burcRehberi/utils/details.dart';

class BurcList extends StatelessWidget {
  static List<Burc> tumBurclar;
  @override
  Widget build(BuildContext context) {
    tumBurclar = VeriKaynak();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Burç Rehberi")),
      ),
      body: BurcListDetails(),
    );
  }

  // ignore: non_constant_identifier_names
  List<Burc> VeriKaynak() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResimYol = "images/" +
          Details.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}" +
          ".png"; //yengec => yengec4.png

      String buyukResimYol = "images/" +
          Details.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}" +
          ".png"; //yengec => yengec_buyuk4.png

      Burc eklenecekBurc = Burc(
          Details.BURC_ADLARI[i],
          Details.BURC_TARIHLERI[i],
          Details.BURC_GENEL_OZELLIKLERI[i],
          kucukResimYol,
          buyukResimYol);

      burclar.add(eklenecekBurc);
    }

    return burclar;
  }

  // ignore: non_constant_identifier_names
  Widget BurcListDetails() {
    return ListView.builder(
      itemBuilder: (context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc currentBurc = tumBurclar[index];

    return Card(
      elevation: 5, //--> z-coordinate
      child: ListTile(
        title: Text(currentBurc.burcAdi),
        subtitle: Text(currentBurc.burcTarihi),
        leading: Image.asset(currentBurc.burcKucukResim),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.blueGrey,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BurcDetailsPage(currentBurc.burcBuyukResim,currentBurc.burcAdi,currentBurc.burcDetayi),
            ),
          );
        },
      ),
    );
  }
}
