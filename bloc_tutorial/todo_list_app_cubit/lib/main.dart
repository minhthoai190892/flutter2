import 'package:flutter/material.dart';
import 'package:todo_list_app_cubit/add_todo_list.dart';
import 'package:todo_list_app_cubit/bloc/counter_bloc.dart';
import 'package:todo_list_app_cubit/cubit/todo_cubit.dart';
import 'package:todo_list_app_cubit/todo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBlocs()),
        BlocProvider(create: (context) => TodoCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const TodoListPage(),
          '/add-todo': (context) => const AddTodoListPage(),
        },
        // home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<CounterBlocs, CounterStates>(
          builder: (context, state) {
            return Center(
              child: Text('${state.counter}'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterBlocs>(context).add(Increment());
        },
        child: const Text('Add'),
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key });



//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: BlocBuilder<CounterBlocs, CounterStates>(
//         builder: (context, state) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '$state',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           BlocProvider.of<CounterBlocs>(context).add(Increment());
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<CounterBlocs, CounterStates>(
//         builder: (context, state){
//           return  Column(
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   state.counter.toString(), style: const TextStyle(
//                   fontSize: 30
//                 ),
//                 )    ,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                         onPressed:
//                         ()=>BlocProvider.of<CounterBlocs>(context).add(Increment()),
//                         child: const Icon(Icons.add)
//                     ),

//                     const SizedBox(width: 10,),

//                     ElevatedButton(
//                         onPressed:
//                         ()=>BlocProvider.of<CounterBlocs>(context).add(Decrement()),
//                         child: const Icon(Icons.remove)
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 10,),
//                 InkWell(
//                   onTap: () {
                   
//                   },
//                   child: Container(
//                     width: 138,
//                     height: 35,

//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.grey,
//                     ),
//                     child: const Center(child: Text("click", style: TextStyle(color: Colors.white),)),
//                   ),

//                 )
//               ],
//             );

//         }
//       ),
//     );
//   }
// }