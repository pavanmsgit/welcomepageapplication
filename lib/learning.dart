//TYPE SAFETY - var and dynamic

import 'dart:io';

void main() {
  var a = 9.00;

  //integer
  int x = 50;

  //double
  double y = 10.12;

  //string
  String message = "Welcome Application";

  //List
  List<String> listItems = ["hello", "hey", "hi"];

  //bool
  bool xy = false;

  //map
  Map<String,dynamic> student1 = {
    "name": "tenzin", //string
    "age": 26, //integer
    "degree": {"college": "Orbit", "year": 2023}, //map
    "isGraduated" : false //bool
  };

  //map
  Map<String,dynamic> student2 = {
    "name": "kechok", //string
    "age": 28, //integer
    "degree": {"college": "Orbit", "year": 2023}, //map
    "isGraduated" : false //bool
  };


  List studentsList = [student1,student2];

  //
  // print("Enter name:");
  // String? name  = stdin.readLineSync();
  // print("The entered name is ${name}");



  //PARSING
  //I have a string , which holds
  String number = "hello";

  String listDelimeters = "One/two/three/four";

  // int parsedNumber = int.tryParse(number) ?? 50;
  //
  // print("THIS IS PARSED NUMBER = ${parsedNumber+30}");

  bool isMale;

  isMale = true;

  // //CONDITIONAL STATEMENTS
  // if(isMale == true){
  //   print("CONGRATS ITS A MALE CHILD");
  // }else if(isMale == false){
  //   print("CONGRATS ITS A FEMALE CHILD");
  // }else{
  //
  // }





  // switch(CONDN){
  //   case 1:
  //     break;
  //   case 2 :
  //     break;
  //
  //
  //   default:break;
  // }



//   for(int i=0;i<10;i++){
// //    print("THIS IS I VALUE ${i+1}");
//   }


  // for(String text in listItems){
  //   print("THIS IS TEXT VALUE ${text}");
  // }
  //
  //
  // listItems.forEach((element) {
  //
  // });


  // int i = 0;
  //
  // while(i <= 10){
  //
  //   print("THIS I VALUE $i");
  //   i++;
  // }




  // do{
  //   i++;
  //   print("THIS 4 I VALUE $i");
  // }while(i <= 10);




  //print("${listDelimeters}");



  try{
    // String textMessage = "HELLO";
    //
    // print("THIS IS OUTPUT BEFORE PARSING $textMessage");
    // int abc = int.parse(textMessage);
    // print("THIS IS OUTPUT AFTER PARSING $abc");

    int sum = add(10, 20);

    print("THIS IS SUM = $sum");

  }catch(error){
    print("FAILED TO ADD $error");
  }







}


//ADDITION FUNCTION
//RETURN TYPE  - FUNCTION NAME (CAMEL CASE) -  {//BLOCK OF CODE}
add(int a, int b){
  return a+b;
}
