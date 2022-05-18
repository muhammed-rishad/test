import 'package:flutter/material.dart';
import 'package:test_project/src/viewModel/sample_provider.dart';
import 'package:provider/provider.dart';
import 'package:test_project/src/widgets/sample_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      context.read<SampleProvider>().getData();
    });

   return Scaffold(
     body: Consumer<SampleProvider>(
       builder: (context,provider,child){
         if(provider.status==Status.LOADED){
           return Padding(
             padding: EdgeInsets.all(16),
             child: ListView.separated(
                 shrinkWrap: true,
                 itemBuilder: (context,index){
                   return sampleCard(context,
                       title: provider.sampleList[index].title!,
                       body: provider.sampleList[index].body!
                   );
                 },
                 separatorBuilder: (context,index){
                   return SizedBox(height: 10);
                 },
                 itemCount: provider.sampleList.length),
           );
         }else if(provider.status==Status.ERROR){
           return Center(
             child: Text('Something error!!!!'),
           );
         }else{
           return Center(
             child: CircularProgressIndicator(),
           );
         }
       },
     ),
   );
  }
}
