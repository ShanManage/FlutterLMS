import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  
static const routeName ='/home';
  
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(fontSize: 14, color: Colors.blue);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
          height: size.height *.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Bj4ge.png')
            ),
          ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pexels.jpg'),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('ප්‍රමෝද්', style: TextStyle(color: Colors.white, fontSize: 18),),
                            Text('HNDIT/0068', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          Card(
                            
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904425.svg',height: 128,),
                                Text('5 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                           
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904565.svg',height: 128,),
                                Text('6 ශ්‍රේණිය ', style: cardTextStyle,)
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904527.svg',height: 128,),
                               Text('7 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904437.svg',height: 128,),
                                Text('8 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904235.svg',height: 128,),
                                Text('9 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904221.svg',height: 128,),
                                Text('10 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                          ),
                          
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                               // SvgPicture.network('https://image.flaticon.com/icons/svg/1904/1904221.svg',height: 128,),
                                Text('11 ශ්‍රේණිය', style: cardTextStyle,)
                              ],
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
       ),
    );
  }
}