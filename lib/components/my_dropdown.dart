import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer_screens/home_screen/cubit/home_cubit.dart';
import '../models/home_model.dart';

class my_dropdown extends StatefulWidget {
  final List<dynamic> titles;
  int myvalue;
  final  LibraryCubit cubit;
  final MychangeMethod;
  final String hint ;



  my_dropdown(this.titles, this.myvalue,{this.hint , this.cubit, this.MychangeMethod});

  @override
  State<my_dropdown> createState() => _my_dropdownState();
}

class _my_dropdownState extends State<my_dropdown> {

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    // final items=widget.titles;
    // items.add('تفريغ')

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(

        margin: EdgeInsets.only(top: 5.h, bottom: 5.h),
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).secondaryHeaderColor,
          border: Border.all(width: 2, color: Theme.of(context).disabledColor,),
        ),
        child: IgnorePointer(
          ignoring: false,
          child: DropdownButtonHideUnderline(

            child: DropdownButton(


               hint: Padding(
                 padding:  EdgeInsets.only(top: 8),
                 child: Text( widget.hint,
                   style: TextStyle(

                       fontFamily: "cairo",
                     color: Theme.of(context).indicatorColor,



                   ),
                 ),
               )
              ,
              isExpanded: true,
              value: widget.myvalue,


              onChanged:   widget.MychangeMethod,


            //     (value) {
              //   setState(() async{
              //
              //   //  widget.myvalue = value;
              //   //   print(value);
              //   // await cubit.getSection(id: value);
              //   // print(cubit.sectionModel.status);
              //   //
              //   //   print('$valueتم بنجاح ');
              //   });
              // },
              selectedItemBuilder: (context){
               return widget.titles
                    .map(

                        (e) {
                      return DropdownMenuItem(value: e.id, child: Center(
                          child: Text(
                              e.name,
                              style: e.id==widget.myvalue? TextStyle(
                                  color:Theme.of(context).indicatorColor,
                                  fontWeight: FontWeight.w400,
                                 fontFamily: "cairo",

                              ):TextStyle(

                                  color: Theme.of(context).indicatorColor,
                                  fontWeight: FontWeight.w400,
                                fontFamily: "cairo",

                              )
                          )
                      ));
                    })
                    .toList();


              },
              
              items: widget.titles
                  .map(

                      (e) {
                        return DropdownMenuItem(value: e.id, child: Center(
                          child:e.id==widget.myvalue? Container(
                                  width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)
                            ),
                              child: Center(
                                child: Text(
                                  e.name,
                                  style:  TextStyle(
                                      color: Colors.blue,
                                    fontFamily: "cairo",


                                      fontWeight: FontWeight.w400,
                                  )
                            ),
                              ),
                          ):Text( e.name ,style :TextStyle(

                              color: Theme.of(context).indicatorColor,
                              fontWeight: FontWeight.w400,
                            fontFamily: "cairo",
                          ))
                        ));
                      })
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
