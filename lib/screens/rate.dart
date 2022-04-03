import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tp_uber/screens/principal.dart';

import '../services/user_services.dart';


class Rate extends StatefulWidget {
  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  double rate=1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child:Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.35,),
            Text('Noter le chauffeur',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
            TextButton(onPressed:()async{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${'note enregistrée avec succès'} ')));
              var data= await getUser();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Principal(data)));
            }, child: Text('Valider'))
          ],

        )),
      ),
    );
  }
}
