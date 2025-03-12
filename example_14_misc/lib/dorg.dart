import 'package:example_14_misc/api/api.dart';
import 'package:example_14_misc/bark.dart';
import 'package:flutter/material.dart';

int flyingDogItem(int counter, int og) => (counter - (og / 5).floor()) % 2;
int flyingDogCount(int counter, int og) => counter ~/ 5;
int dogLoopBack(int counter, int lim)=>counter % lim;
int actualDog(int counter, int og)=>(counter - flyingDogCount(counter, og)) % barkKeys.length;

CarouselView peghos(List<Dog> list)=>CarouselView(itemExtent: 300, scrollDirection: Axis.vertical, enableSplash: false,
  children: List<PetDetector>.generate(list.length + (list.length / 5).floor(), (e)=>
    (e+1) % 5 > 0 ?
      PetDetector(type: barks[barkKeys[actualDog(e, list.length)]]!, dog: list[e - flyingDogCount(e, list.length)].image)
      : PetDetector(type: flyingBarks[flyingDogItem(e, list.length)], dog: flyingDogs[flyingDogItem(e,list.length)])
  )
);