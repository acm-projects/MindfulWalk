import 'package:mindfulwalk/helpers.dart';
import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String steps = formatNumber(randBetween(3000, 6000));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [

          Container(
            width: 325,
            height: 134,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 325,
                    height: 134,
                    decoration: ShapeDecoration(
                      color: Color(0xFF5B8C5A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -20,
                  top: 50,
                  child: SizedBox(
                    width: 250,
                    child: Column(
                      children: [
                        Text(
                          steps,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jost',
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          'Total Steps',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Jost',
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            height: 2,
                          ),
                        ),


                      ],
                    )


                  ),
                ),

                Positioned(
                    left: 200,
                    top: 30,
                  child: SizedBox(

                    width: 96,
                    height: 99,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[


                        new Container(
                          //padding: new EdgeInsets.all(2.0),
                          child: Image.asset(

                            "assets/stat.png",
                            fit: BoxFit.contain,
                          ),
                        ),

                      ],
                    ),

                  )
                ),





                Positioned(
                  left: 13,
                  top: 9,
                  child: SizedBox(

                    width: 250,
                    child: Text(
                      '  Steps',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                /*Positioned(
                  left: 215,
                  top: 35,

                  children: <Widget>[
                    Image.asset('assets/stat.png', width: 96, height: 99),
                    width: 96,
                    height: 99,
                    //Image.asset('assets/stats.png', width: 96, height: 99),
                    decoration: BoxDecoration(
                      Image.asset('assets/stat.png', width: 96, height: 99),
                      image: DecorationImage(
                        Image.asset('assets/stat.png', width: 96, height: 99),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ]
                ),*/
              ],
            ),
          ),

        ],
      ),
    );
  }
}
