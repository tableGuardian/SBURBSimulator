function FaceDenizen(){
	this.canRepeat = false;	
	this.playerList = [];  //what players are already in the medium when i trigger?
	this.denizenFighters = [];
	
	this.trigger = function(playerList){
		this.denizenFighters = [];
		this.playerList = playerList;
		for(var i = 0; i<availablePlayers.length; i++){
			var p = availablePlayers[i]
			if(p.landLevel >= 6 && !p.denizenFaced){
				this.denizenFighters.push(p);
			}
		}
		return this.denizenFighters.length > 0;
	}
	
	this.renderContent = function(div){
		div.append("<br>"+this.content());
	}
	
	this.content = function(){
		var ret = "";
		for(var i = 0; i<this.denizenFighters.length; i++){
			var p = this.denizenFighters[i];
			removeFromArray(p, availablePlayers);
			//ret += "Debug Power: " + p.power;
			//fight denizen
			if(p.getFriends().length < p.getEnemies().length){
				ret += " The " + p.htmlTitle() + " sneak attacks their denizen, " + p.getDenizen() + ". ";
				if(p.power > 7){
					ret += " They win handly, and obtain untold levels of power and sweet sweet hoarde grist. They gain all the levels. All of them. ";
					p.denizenFaced = true;
					p.power = p.power*2;  //current and future doubling of power.
					p.level_index +=3;
					p.leveledTheHellUp = true;
					p.denizenDefeated = true;
				}else{
					p.denizenFaced = true;
					p.denizenDefeated = false;
					ret += " Huh.  They were NOT ready for that.  They are easily crushed by their Denizen. DEAD.";
					p.dead = true;
					p.causeOfDeath = "fighting their Denizen way too early";
				}
			}else{//do The Choice
				ret += " The " + p.htmlTitle() + " cautiously approaches their denizen, " + p.getDenizen() + " and are presented with The Choice. ";
				if(p.power > 10){
					ret += " The " + p.htmlTitle() + " manages to choose correctly, despite the seeming impossibility of the matter. ";
					ret += " They gain the power they need to acomplish their objectives. ";
					p.denizenFaced = true;
					p.denizenDefeated = true;
					p.power = p.power*2;  //current and future doubling of power.
					p.leveledTheHellUp = true;
				}else{
					p.denizenFaced = true;
					p.denizenDefeated = false;
					ret += " They are unable to bring themselves to make the clearly correct, yet impossible, Choice, and are forced to admit defeat. " + p.getDenizen() + " warns them not to come back. ";
				}
			}
			
		}
		return ret;
	}
}