import "dart:html";
import "../../SBURBSim.dart";
///this sounds like a badass cowboy thing
class DeadReckoning extends Scene {

    DeadReckoning(Session session) : super(session);

@override
void renderContent(Element div) {
    // TODO: implement renderContent
    String content = "<Br><br>While there are no meteors, and no babies, a Reckoning is a Universal Constant, and has just been triggered through Skaia's unknowable will.  It is no longer possible to progress in this game.  ";
    Player player = session.players[0];
    if(player.unconditionallyImmortal) {
        content += " Despite bullshit odds, the ${player.htmlTitle()} has won. What will they do now, with their Unconditional Immortality?";
    }else {
        content += " We all fail to be surprised that the ${player.htmlTitle()}  didn't manage to beat such a bullshit game. Guess they are stuck here, huh?";
    }
    appendHtml(div, content);
    lastRender(div);
}

@override
bool trigger(List<Player> playerList) {
    return true;
}

    void lastRender(Element div) {
        div = querySelector("#charSheets");
        //div.setInnerHtml(""); //clear yellow yards and scratches and combos and all TODO figure out why this breaks everything
        if (div == null || div.text.length == 0) return; //don't try to render if there's no where to render to
        for (int i = 0; i < this.session.players.length; i++) {
            String canvasHTML = "<canvas class = 'charSheet' id='lastcanvas${this.session.players[i].id}_${this.session.session_id}' width='800' height='1000'>  </canvas>";
            appendHtml(div, canvasHTML);
            CanvasElement canvasDiv = querySelector("#lastcanvas${this.session.players[i].id}_${this.session.session_id}");
            CanvasElement first_canvas = querySelector("#firstcanvas${this.session.players[i].id}_${this.session.session_id}");
            CanvasElement tmp_canvas = Drawing.getBufferCanvas(canvasDiv);
            Drawing.drawCharSheet(tmp_canvas, this.session.players[i]);
            //will be null for new players.
            if (first_canvas != null) Drawing.copyTmpCanvasToRealCanvasAtPos(canvasDiv, first_canvas, 0, 0);
            Drawing.copyTmpCanvasToRealCanvasAtPos(canvasDiv, tmp_canvas, 400, 0);
        }
    }

}