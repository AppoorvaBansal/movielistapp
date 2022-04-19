
import 'package:flutter/material.dart';
import 'package:movielistapp/DBMovie.dart';
class MyHomePage extends StatelessWidget {

  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  List<DBMovie> movieDetailedList=DBMovie.getMovieDetailList();

  final List movieList=[
    "Lucy",
    "Spider MAM",
    "John Wick",
    "Mind Hunter",
    "Intersteller",
    "Avengers",
    "HArry Potter",
    "Fantastic Beats",
    "Kung-fu-Panda",
    "Mission Impossible",
    "Joker",
    "Batman"

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body:ListView.builder(
          itemCount: movieDetailedList.length, // length of the array
          itemBuilder:(BuildContext context,int index){
        return Card(
          elevation: 400,
            color: Colors.purple.shade100,
            child:ListTile(
              title: Text(movieDetailedList[index].Title),
              subtitle: Text(movieDetailedList[index].Actors),
              trailing: Text("..."),
              leading: CircleAvatar(
                
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)
                    
                  ),
                  child: Text("M")
                  
                ),
                
                
              ),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movieName: movieDetailedList[index].Title,)))
                //debugPrint("Clickeddd")

              },
            )
        );

      }),

    );
  }
}


class MovieDetails extends StatelessWidget {

  final String movieName;



  const MovieDetails({Key? key,required this.movieName}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details of : $movieName "),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body:Container(

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("data1",style: TextStyle(fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("data2",style: TextStyle(fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("data3",style: TextStyle(fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("data4",style: TextStyle(fontSize: 30),),
            ),

          ],

        ),

      )



    );
  }
}

