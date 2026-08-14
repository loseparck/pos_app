import 'package:flutter/material.dart';


class OptionErrorBanner extends StatelessWidget {


  final String? message;



  const OptionErrorBanner({

    super.key,

    this.message,

  });



  @override
  Widget build(BuildContext context) {


    if(message == null ||
       message!.isEmpty) {

      return const SizedBox.shrink();

    }



    final colors =
        Theme.of(context)
            .colorScheme;



    return Container(

      width:
          double.infinity,


      margin:
          const EdgeInsets.fromLTRB(
            20,
            4,
            20,
            8,
          ),



      padding:
          const EdgeInsets.all(12),



      decoration: BoxDecoration(

        color:
            colors.errorContainer,


        borderRadius:
            BorderRadius.circular(
              12,
            ),

      ),



      child: Row(

        children: [


          Icon(

            Icons.error_outline,

            color:
                colors.onErrorContainer,

          ),



          const SizedBox(
            width: 10,
          ),




          Expanded(

            child: Text(

              message!,


              style:
                  TextStyle(

                    color:
                        colors.onErrorContainer,


                    fontWeight:
                        FontWeight.w600,

                  ),

            ),

          ),



        ],

      ),

    );

  }

}