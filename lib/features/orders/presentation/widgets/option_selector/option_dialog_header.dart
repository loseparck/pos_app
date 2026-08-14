import 'package:flutter/material.dart';


class OptionDialogHeader extends StatelessWidget {

  final String title;

  final VoidCallback onClose;



  const OptionDialogHeader({

    super.key,

    required this.title,

    required this.onClose,

  });



  @override
  Widget build(BuildContext context) {


    final colors =
        Theme.of(context)
            .colorScheme;



    return SizedBox(

      height: 86,


      child: Padding(

        padding:
            const EdgeInsets.symmetric(
              horizontal: 20,
            ),



        child: Row(

          children: [



            Container(

              width: 48,

              height: 48,


              decoration: BoxDecoration(

                color:
                    colors.primaryContainer,


                borderRadius:
                    BorderRadius.circular(
                      14,
                    ),

              ),



              child: Icon(

                Icons.restaurant_menu,

                color:
                    colors.onPrimaryContainer,

              ),

            ),



            const SizedBox(
              width: 14,
            ),



            Expanded(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                crossAxisAlignment:
                    CrossAxisAlignment.start,


                children: [



                  Text(

                    title,


                    maxLines:
                        1,


                    overflow:
                        TextOverflow.ellipsis,


                    style:
                        Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(

                              fontWeight:
                                  FontWeight.w700,

                            ),

                  ),




                  const SizedBox(
                    height: 4,
                  ),




                  Text(

                    "Configurez les options du produit",


                    style:
                        Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(

                              color:
                                  colors.onSurfaceVariant,

                            ),

                  ),



                ],

              ),

            ),




            IconButton(

              tooltip:
                  "Fermer",


              onPressed:
                  onClose,


              icon:
                  const Icon(
                    Icons.close,
                  ),

            ),



          ],

        ),

      ),

    );

  }

}