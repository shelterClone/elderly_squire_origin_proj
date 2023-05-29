import 'package:elderly_squire_capstone/HealthTipsMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'MedicineMenu.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

class HealthyEatingContent extends StatelessWidget {
//  final String email;
////  final screenHeight = MediaQuery.of(context).size.height;
//
//  HealthyEatingContent({@required this.email});

//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey[900],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthTipsMenu()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5200,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(//----------------Healthy Eating-----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "\nHealthy Eating\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/fruits_veggie.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: Text(
                      "What kinds of foods and drinks do I need to consume as I age?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "As you get older, your body begins to need fewer calories, but you need "
                      "just as many nutrients. So, you will want to focus on eating nutrient-dense foods. "
                      "Nutrient-dense foods pack a lot of vitamins, minerals,"
                      " and other nutrients your body needs into a smaller number of calories.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consume more nutrient-dense foods and beverages. Older adults should consume"
                      " foods from the rainbow because they are rich in nutrients, including",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- fruits and vegetables\n\n"
                      "- whole grains, like oatmeal, whole-grain bread, and brown rice\n\n"
                      "- fat-free or low-fat milk; milk products; or nondairy soy, almond, rice,\n\n"
                      " or other drinks with added vitamin D and calcium\n\n"
                      "- seafood, lean meats, poultry, and eggs\n\n"
                      "- beans, peas, unsalted nuts, and seeds, if you tolerate them and aren’t allergic",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consume less of these foods and drinks. Some foods and drinks have many calories but "
                      "few of the essential nutrients your body needs. Added sugars, solid fats, and salt—such "
                      "as those in packaged foods—pack a lot of calories but don’t provide a healthy amount"
                      " of nutrients. Limit foods and drinks such as",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- sugar-sweetened drinks and foods\n\n"
                      "- sugar-sweetened drinks and foods\n\n"
                      "- foods made with solid fats—butter, lard, margarine, and shortening\n\n"
                      "- foods high in added fat (such as butter or lard) and salt (sodium)\n\n"
                      "- sugar-sweetened drinks and foods",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top: 20, bottom: 20),
                    child: Text(
                      "How can I follow a healthy eating plan?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "How much food and drinks you should consume each day depends on your weight,"
                      " sex, age, metabolism, and how active you are. In general, men need more "
                      "calories than women. Younger adults need more calories than adults in midlife and older. "
                      "At all ages, adults who are more physically active may need to consume more calories than"
                      " those who are less active.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Control portion sizes. A portion is the amount of food or drink you consume in one sitting."
                      " Being aware of food portions,"
                      " serving sizes, and how often you consume them can help you make healthier food and drink choices.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Many people eat more than they need, especially when eating out or getting takeout. Try these tips.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20),
                    child: Text(
                      "- Remember, restaurants often serve more than one portion. If the portion"
                          " is bigger than one serving, take home or put away the rest to eat later.\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- When eating out or getting takeout, share a meal with a friend or save half of your serving for another meal.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- Avoid watching TV, your smartphone, or other devices while eating. "
                          "You may not notice how much you are consuming if you’re distracted.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "- Consume your food and beverages more slowly and enjoy all the flavors and tastes.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "The Nutrition Facts label tells you how many calories and servings are in a box, package, or can."
                          " The label also shows how many nutrients, such as fat, protein, carbohydrates, fiber, sodium,"
                          "and sugar—including added sugars—are in one serving of food. You can use these facts to make "
                          "healthy food choices. Learn how to read Nutrition Facts labels ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Cook ahead and freeze food for days when you don't want to cook.\n\n"
                      "- Keep low-sodium versions of frozen or canned vegetables and beans on hand for quick and healthy meal add-ons.\n\n"
                      "- Keep frozen or packed-in-juice canned fruits ready for snacks and meals.\n\n"
                      "- Do not skip meals. Doing so may make you feel hungrier later.",


                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/meal.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Cook ahead and freeze food for days when you don't want to cook.\n\n"
                          "- Keep low-sodium versions of frozen or canned vegetables and beans on hand for quick and healthy meal add-ons.\n\n"
                          "- Keep frozen or packed-in-juice canned fruits ready for snacks and meals.\n\n"
                          "- Do not skip meals. Doing so may make you feel hungrier later.",


                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(//----------------Healthy Eating Tips-----------------------------//
                    margin: EdgeInsets.only(left: 20, top: 20, bottom:20),
                    child: Text(
                      "\nHealthy Eating Tips",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/diet2.png',
                      height: 100,
                      width: 130,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50, top:20),
                    child: Text(
                      "Vitamins and minerals for older adults",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Vitamins and minerals are nutrients that help your body stay healthy and work well. "
                          "Many kinds of vitamins and minerals work together to help you get energy from food. "
                          "By following a healthy eating plan, you are more likely to get all or most of the "
                          "vitamins and minerals you need from the food and drink you consume.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Getting enough of vitamins B6, B12, D, and folate is considered important to healthy aging. "
                          "Talk with your health care professional about the vitamins you need. Based on your eating "
                          "plan and health status, your health care professional may suggest a supplement to help you"
                          " get the vitamins and minerals you need. ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20),
                    child: Text(
                      "Tips for consuming healthy food and beverages on a budget",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consuming healthy foods and beverages on a fixed or limited income or budget can be very difficult."
                          " Here are some ideas that might help.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "- Buy store brands of whole-grain breads, pastas, cereals, and other healthy items.\n\n"
                          "- Read weekly sales flyers and use coupons or apps to plan healthy meals and snacks at lower prices. Eat what is in season to get the best deals on fresh vegetables and fruits.\n\n"
                          "- Buy low-sodium versions of canned or frozen vegetables. They are healthy, low-cost, and store well until you need them.\n\n"
                          "- Consider joining food voucher programs sponsored by places of worship or food banks to improve your access to healthy foods and beverages.\n\n",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:20, top:20),
                    child: Text(
                      "Tips for limiting sodium in your diet",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),






                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Consuming too much sodium (salt) may lead to health problems, such as high blood pressure, for some.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,  right: 20),
                    child: Text(
                      "Lower your sodium intake to less than 2,300 mg a day \n\n"
                          "(about a teaspoon of salt). That includes sodium added during packaging, cooking, and at the table when eating.\n\n"
                          "- Read the Nutrition Facts label on foods and beverages to find the sodium content.\n\n"
                           "- Buy foods and beverages that are low in sodium.\n\n"
                            "- Limit how much packaged and fast foods and beverages you consume.\n\n",

                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 5,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthTipsMenu()),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContentP2()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),

                  


                ],
              ),
            ),
          ),

//          Container(
//            margin: EdgeInsets.only(left:50,top:50),
//            height: 60,
//            width:60,
//
//            child: CircleAvatar(
//              radius: 5,
//              backgroundColor: Colors.lightBlue,
//             child: Icon(
//               Icons.person,
//                   color: Colors.white,
//               size: 30,
//             ),
//            ),
//          )
        ),
      ),
    );
  }
}

class HealthyEatingContentP2 extends StatelessWidget {


//  Home({this.email});

//LoginState login =  LoginState();

  @override
  Widget build(BuildContext context) {
    var widget;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: Colors.blueGrey[900],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthTipsMenu()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left:50,right:50),
            child: Image.asset(
                'assets/images/elderly_squire_logo_classic_icon.png',
                height: 40,
                width: 125),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 5000,
            width: 1000,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 50, bottom:20, right: 20),
                    child: Text(
                      "\nUse less salt when cooking and eating. \n\n"
                          "- Cook with lemon and spices that have no sodium.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right:50,bottom:20, top:20),
                    child: Text(
                      "Keep track of your eating habits",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: ('OpenSans'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, right: 20),
                    child: Text(
                      "Many factors may affect your ability to eat well and enjoy your meals and snacks, including dental problems, being on a fixed income, and limited ability to move around.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20,right: 20),
                    child: Text(
                      "If you don’t have pain in your fingers or hands when writing, try to keep a food diary. Write down all the foods and drinks you have in a day"
                          " and any concerns you have. Instead of a written diary, consider trying one of the many apps now available on mobile phones, tablets, and "
                          "other devices. These apps have become a popular way to track and improve health habits, including what and how much you eat and drink, sleep, and weigh."
                          " When you visit your health care provider, bring your written or digital food diary and review it together to see if you are getting the nutrients you need.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: 20, top: 20, bottom: 20, right: 20),
                    child: Text(
                      "Your health care professional may recommend that you have different foods and beverages or that you change the number "
                          "of calories you get each day. He or she may also refer you to a registered dietitian for help with choosing an eating "
                          "plan that’s right for you.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: ('OpenSans'),
                      ),
                    ),
                  ),
                  Container(
                    //-----------------------------------------------------------------------------------------------back Next

                    margin: EdgeInsets.only(top: 50,left:50, right: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ('OpenSans'),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthyEatingContent()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),




                ],
              ),
            ),
          ),

//          Container(
//            margin: EdgeInsets.only(left:50,top:50),
//            height: 60,
//            width:60,
//
//            child: CircleAvatar(
//              radius: 5,
//              backgroundColor: Colors.lightBlue,
//             child: Icon(
//               Icons.person,
//                   color: Colors.white,
//               size: 30,
//             ),
//            ),
//          )
        ),
      ),
    );
  }
}
