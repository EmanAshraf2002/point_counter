import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_counter/cubits/counter_cubit.dart';
import 'package:point_counter/cubits/counter_state.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),

      ),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit,CounterState>(builder:(context,state)
    {
     return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Points counter'),
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Column(children: [
                  const Text('Team A ', style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                   Text('${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                    style: const TextStyle(
                      fontSize: 150,
                    ),
                  ),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                       BlocProvider.of<CounterCubit>(context).teamAIncrement(1);
                      }
                      , child: const Text('Add 1 point ', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).teamAIncrement(2);
                      }, child: const Text('Add 2 point ', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  )

                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).teamAIncrement(3);
                      }, child: const Text('Add 3 point ', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  )

                  ),


                ], //first column in row

                ),
              ),

              const SizedBox(
                height: 460,
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Column(children: [
                  const Text('Team B ', style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                  Text('${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                    style: const TextStyle(
                      fontSize: 150,
                    ),
                  ),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).teamBIncrement(1);
                      },
                      child: const Text('Add 1 point ', style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      )
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).teamBIncrement(2);
                      }, child: const Text('Add 2 point ', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  )

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).teamBIncrement(3);
                      }, child: const Text('Add 3 point ', style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  )

                  ),


                ], //Sceond column in row

                ),
              ),

            ],

          ),

          Padding(
            padding: const EdgeInsets.only(top:30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetCounter();
                }, child: const Text('Reset', style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            )

            ),
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    int teamAPoints = BlocProvider.of<CounterCubit>(context).teamAPoints;
                    int teamBPoints = BlocProvider.of<CounterCubit>(context).teamBPoints;
                    String message;
                    if (teamAPoints > teamBPoints) {
                      message = 'The winner is Team A 🎉🎉🎉';
                    } else if (teamBPoints > teamAPoints) {
                      message = 'The winner is Team  B 🎉🎉🎉';
                    } else {
                      message = 'It\'s a tie';
                    }
                    return AlertDialog(
                      title: const Text('Winner 🏆'),
                      content:Text('$message!'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Result', style: TextStyle(
               fontSize: 18,
               color: Colors.black,
          ),
          )

          ),

        ],

        ),
      );
    },
        listener:(context,state){} ,

    );
  }
}