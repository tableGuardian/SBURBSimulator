import "../../../SBURBSim.dart";
import 'dart:html';

class TargetIsAspectPlayer extends TargetConditionLiving {
  TargetIsAspectPlayer(SerializableScene scene) : super(scene);


  SelectElement select;


  String aspectName;
  List<String> _allAspects  = new List<String>();

  List<String> get allAspects {
      //print("getting allTraits");
      if(_allAspects == null || _allAspects.isEmpty) {
          _allAspects = new List<String>.from(Aspects.names);
      }
      return _allAspects;
  }


  @override
  String name = "isAspectPlayer";

  @override
  String get importantWord => "$aspectName";

  @override
  String descText = "<br>Target Entity must be a Player With Aspect: <br>";
  @override
  String notDescText = "<br>Target Entity must be a Player WithOUT Aspect: <br>";


  @override
  void copyFromJSON(JSONObject json) {
      aspectName = json[TargetCondition.IMPORTANTWORD];
  }


  @override
  bool conditionForFilter(GameEntity item) {
      if (item is Player) {
          if((item as Player).aspect.name == aspectName) {
              return false; //don't remove if i'm this aspect
          }else {
              return true;
          }
      }else {
          return true;
      }
  }

  @override
  TargetCondition makeNewOfSameType() {
    return new TargetIsAspectPlayer(scene);
  }

  @override
  void renderForm(Element div) {
      List<String> allAspectsKnown = new List<String>.from(allAspects);
      allAspectsKnown.sort((String a, String b) => a.toLowerCase().compareTo(b.toLowerCase()));


      descElement = new DivElement();
      div.append(descElement);
      syncDescToDiv();

      DivElement me = new DivElement();
      div.append(me);
      renderNotFlag(me);



      select = new SelectElement();
      me.append(select);
      for(String aspect in allAspectsKnown) {
          OptionElement o = new OptionElement();
          o.value = aspect.toString();
          o.text = aspect.toString();
          select.append(o);
          if(aspect.toString() == aspect.toString()) {
              print("selecting ${o.value}");
              o.selected = true;
          }else {
              //print("selecting ${o.value} is not ${itemTrait.toString()}");
          }

      }
      if(aspectName == null) select.selectedIndex = 0;
      select.onChange.listen((Event e) => syncToForm());
      syncToForm();

  }

  @override
  void syncFormToMe() {
      print("syncing isAspect form with aspect of $aspectName");
      for(OptionElement o in select.options) {
          if(o.value == aspectName) {
              o.selected = true;
              return;
          }
      }
      syncFormToNotFlag();

  }

  @override
  void syncToForm() {
      aspectName = select.options[select.selectedIndex].value;
      scene.syncForm();
      syncNotFlagToForm();

  }
}