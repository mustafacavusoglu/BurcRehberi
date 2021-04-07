import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';



// ignore: must_be_immutable
class BurcDetailsPage extends StatefulWidget {
  String currentBurcBigImage;
  String currentBurcName;
  String currentBurcDetails;
  
  BurcDetailsPage(
      this.currentBurcBigImage, this.currentBurcName, this.currentBurcDetails);

  @override
  _BurcDetailsPageState createState() => _BurcDetailsPageState();
}

class _BurcDetailsPageState extends State<BurcDetailsPage> {
  Color baskinRenk;
  PaletteGenerator paletGenerator;

  @override
  void initState() {
    
    super.initState();

    baskinRengiBul();
  }

  void baskinRengiBul(){

    Future<PaletteGenerator> palet = PaletteGenerator.fromImageProvider(AssetImage(widget.currentBurcBigImage));
    palet.then((value){
      paletGenerator = value;
      

      setState(() {
        baskinRenk = paletGenerator.dominantColor.color;
        
      });
    });


  }


  @override
  Widget build(BuildContext context) {
    

    
    

    return Scaffold(
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            backgroundColor: baskinRenk != null ? baskinRenk: Colors.blueGrey.shade600,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.currentBurcName} ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(widget.currentBurcBigImage, fit: BoxFit.fill),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Text(
              "${widget.currentBurcDetails}",
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }
}
