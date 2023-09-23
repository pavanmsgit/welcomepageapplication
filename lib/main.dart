import 'package:flutter/material.dart';

// - CMD + /
/// -
/* */ //- CMD + SHIFT + /

//MAIN METHOD
void main() {
  runApp(const WelcomePageMain());
}

//MATERIAL APP CLASS
class WelcomePageMain extends StatelessWidget {
  const WelcomePageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Welcome Page",
      home: ListManager(),
    );
  }
}

//Manages and updates list
class ListManager extends StatefulWidget {
  const ListManager({super.key});

  @override
  State<ListManager> createState() => _ListManagerState();
}

class _ListManagerState extends State<ListManager> {


  TextEditingController textEditingController = TextEditingController();


  //LIST ITEMS TO RENDER IN LIST VIEW
  List messages = ["Hello", "How are you?", "Welcome"];


  bool isEditing = false;

  int indexValue = -1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text("WELCOME PAGE",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //ROW - THIS WILL HAVE A TEXT FIELD AND BUTTON
              Row(
                children: [
                  //TEXT FIELD
                  //80%
                  Container(
                    margin: const EdgeInsets.only(top: 10,left: 10),
                    width: screenSize.width * 0.75,
                    height: screenSize.height * 0.1,
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        label: Text("Message"),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,
                        ),
                        hintText: "Enter any message",
                      ),
                    )
                  ),


                  //BUTTON
                  //20%


                  isEditing ?
                  //CHECK BUTTON FOR EDITING
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        for(int i=0;i<messages.length;i++){
                          if (i == indexValue){
                            messages[i] = textEditingController.text;
                          }
                        }

                        isEditing = false;
                        indexValue = -1;
                        textEditingController.clear();
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 10,left: 5,right: 10),
                        width: screenSize.width * 0.18,
                        height: screenSize.height * 0.1,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle
                        ),
                        child: const Icon(Icons.check_circle,size: 35.0,color: Colors.white, )
                    ),
                  ):
                  //CREATE BUTTON
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        messages.add(textEditingController.text);
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,left: 5,right: 10),
                      width: screenSize.width * 0.18,
                      height: screenSize.height * 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.add_circle,size: 35.0,color: Colors.white, )
                    ),
                  )
                ],
              ),

              //WHICH WILL HAVE A LIST VIEW
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                width: screenSize.width * 0.95,
                height: screenSize.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(width: 5.0,color: Colors.purple),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {

                    // TextEditingController textEditingControllerCustom =
                    // TextEditingController(text: messages[index]);


                    return ListTile(
                      leading: const Icon(Icons.ac_unit_outlined),
                      title: Text(messages[index]),

                      // title: TextField(
                      //   controller: textEditingControllerCustom,
                      //   keyboardType: TextInputType.text,
                      //   cursorColor: Colors.black,
                      //
                      //   decoration: const InputDecoration(
                      //     labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,
                      //     ),
                      //     hintText: "Enter any message",
                      //   ),
                      // ),

                      trailing: Container(
                        width: screenSize.width * 0.25,
                        child: Row(
                          children: [
                            //EDIT
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: (){
                                setState(() {
                                  isEditing = true;
                                  textEditingController.text = messages[index];
                                  //textEditingControllerCustom.text = messages[index];
                                  indexValue = index;
                                });
                              },
                            ),

                            //DELETE
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red,),
                              onPressed: (){
                                setState(() {
                                  messages.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    );
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
