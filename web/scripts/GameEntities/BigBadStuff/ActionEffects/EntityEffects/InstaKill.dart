import "../../../../SBURBSim.dart";
import 'dart:html';

//no chance to survive, no strife no anything. it's a red miles situation
//not really any details, or modifiers
class InstaKill extends EffectEntity {
    @override
    String name = "InstaKill";
  InstaKill(SerializableScene scene) : super(scene);


  @override
  void copyFromJSON(JSONObject json) {
    // nothing to do
  }

  @override
  void syncFormToMe() {
    ////does nothing since i have no personal data
  }

    @override
    void renderForm(Element div) {
        DivElement me = new DivElement();
        div.append(me);
        me.setInnerHtml("<br><br><b>InstaKill:</b> <br>No way to dodge this, doesn't trigger a strife <br><br>");
        syncToForm();
    }

  @override
  void syncToForm() {
      scene.syncForm();
  }
  @override
  void effectEntities(List<GameEntity> entities) {
      List<GameEntity> renderableTargets = new List<GameEntity>();
    entities.forEach((GameEntity e) {
        if(e.renderable()) renderableTargets.add(e);
        SpanElement death = new SpanElement();
        String text = (e.makeDead("encountering ${scene.gameEntity}", scene.gameEntity));
        death.setInnerHtml(text);
        scene.myElement.append(death);
    });
    if(renderableTargets.isNotEmpty) {
        CanvasElement canvasDiv = new CanvasElement(width: canvasWidth, height: canvasHeight);
        scene.myElement.append(canvasDiv);
        Drawing.poseAsATeam(canvasDiv, renderableTargets);
    }
  }
  @override
  ActionEffect makeNewOfSameType() {
    return new InstaKill(scene);
  }
}