import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RateD extends StatefulWidget {
  @override
  State<RateD> createState() => _RateDState();
}

class _RateDState extends State<RateD> {
  double rate=1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child:Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.35,),
            Text('Noter le client',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 10,),
            RatingBar.builder(
                minRating: 1,
                itemBuilder:(context,_)=>Icon(Icons.star,color: Colors.amber,),
                onRatingUpdate:(rating){
                  setState(() {
                    this.rate=rating;
                  });
                }),
            Text('${rate}'),
            TextButton(onPressed:(){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${'note enregistrée avec succès'} ')));
              Navigator.pop(context);
            }, child: Text('Valider'))
          ],

        )),
      ),
    );
  }
}
