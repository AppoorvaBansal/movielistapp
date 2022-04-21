
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
            color: Colors.white,
            child:ListTile(
              title: Text(movieDetailedList[index].Title),
              subtitle: Text(movieDetailedList[index].Actors),
              trailing: Text("..."),
              leading: CircleAvatar(
                
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movieDetailedList[index].Images[1]),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0)
                    
                  ),
                  child: Text("")
                  
                ),
                
                
              ),
              onTap: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movieObject: movieDetailedList[index],)))
                //debugPrint("Clickeddd")

              },
            )
        );

      }),

    );
  }
}


class MovieDetails extends StatelessWidget {

  //final String movieName;
  final DBMovie movieObject;


  const MovieDetails({Key? key,required this.movieObject}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details of : ${movieObject.Title}"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple.shade100,

      body:ListView(
        children: [
          MovieThumbnail(thumbnail:movieObject.Images[1]),
          MoviePoster(poster:movieObject.Images[1])

        ],



      )



      // body:Container(
      //
      //   child: Column(
      //     //mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text(movieObject.Actors ,style: TextStyle(fontSize: 30),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text(movieObject.Genre,style: TextStyle(fontSize: 30),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text(movieObject.Plot,style: TextStyle(fontSize: 30),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: Text("data4",style: TextStyle(fontSize: 30),),
      //       ),
      //
      //     ],
      //
      //   ),
      //
      // )



    );
  }
}

class MoviePoster extends StatelessWidget {

  final String poster;
  const MoviePoster({Key? key,required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(


            image: DecorationImage(
              image: NetworkImage(poster),fit:BoxFit.cover
            )
          ),


        ),

        Container(



        ),


      ],

    );
  }

}


class MovieThumbnail extends StatelessWidget {
  
  final String thumbnail;
  const MovieThumbnail({Key? key,required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      alignment: Alignment.bottomCenter,
      children: [

        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height:180,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail),fit: BoxFit.cover),


              ),

            ),
            Icon(Icons.play_circle_outline_rounded,size:90,color: Colors.white,),




          ],

        ),

        Container(
          height: 80,
      decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [Color(0x0),
        Color(0xfffafafa)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter

      ),


      ),

        )
        // Container(
        //   height: 80,
        //   decoration: BoxDecoration(
        //
        //     gradient: LinearGradient(colors:[Color(0x00000000),
        //       Color(0xfffafafa)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        //
        //   ),
        // )


        
      ],
      
      
      
    );
  }

}

