import "dart:html";
import "../../SBURBSim.dart";

/// // a scene where the chosen meta player fucks with the single player

class DeadMeta extends Scene {
    bool doneOnce = false;
    bool finished = false;
    DeadMeta(Session session) : super(session);
    String player1Start;
    String player2Start;
    //for generic convos.
    List<String> fuckOff;
    List<String> youAsshole;
    List<String> notSoBad;
    List<String> goodbye;

    @override
    void renderContent(Element div) {
        //div.style.backgroundColor = "#ffffff"; //doesn't look good.
        if(fuckOff == null) {
            fuckOff = <String>["Oh my god just leave me alone!", "Fuck off.", "Just go away!", "I am NOT up for your bullshit right now!", "Oh my fucking god, go AWAY!", "NOT right now.", "No. Just, no. Go away.", "Does it HAVE to be right now?", "No. ", "I can't fucking deal with you right now. Fuck off."];
            youAsshole = <String>["God. I really do hate you.", "You are just a magnificent asshole, you know that?", "You are the very worst asshole in existance.", "I cannot fucking STAND you.", "Amazing. You are Paradox Space's biggest asshole.", "Wow. Rude.", "You fucking asshole.", "Who died and made you king asshole?", "You are the asshole. It is you."];
            goodbye = <String>["Fucking finally.", "See you never, asshole.", "About time.", "Finally.", "And may you never return."];
            notSoBad = <String>["Gee, thanks","Huh. That...was actually kind of decent of you.", "Wow. Thanks, I guess? ","Huh. Not what I would have expected you to say.",  "Don't think that makes up for what an asshole you usually are.", "Uh. Thanks?", "Oh. Okay. Thanks?", "Huh. I ALMOST forgot you were an asshole there."];
        }
        Player player = session.players[0];

        Element container = new DivElement()..className = "consoleConversation";
        div.append(container);

        if(!doneOnce) return intro(container);
        if(!player.landFuture.thirdCompleted) return middle(container);
        if(player.landFuture.thirdCompleted) return end(container);
    }

    void middle(Element div) {
        Player meta = (session as DeadSession).metaPlayer;
        Player player = session.players[0];

        Conversation conversation;

        if(meta == session.mutator.metaHandler.authorBot || meta == session.mutator.metaHandler.authorBotJunior) {
            conversation = session.rand.pickFrom(ABMiddle());
        }else if(meta == session.mutator.metaHandler.jadedResearcher ) {
            conversation = session.rand.pickFrom(JRMiddle());
        }else if(meta == session.mutator.metaHandler.manicInsomniac ) {
            conversation = session.rand.pickFrom(MIMiddle());
        }else if(meta == session.mutator.metaHandler.dilletantMathematician ) {
            conversation = session.rand.pickFrom(DMMiddle());
        }else if(meta == session.mutator.metaHandler.wooMod ) {
            conversation = session.rand.pickFrom(WMMiddle());
        } else if(meta == session.mutator.metaHandler.nobody ) {
            conversation = session.rand.pickFrom(NBMiddle());
        } else if(meta == session.mutator.metaHandler.recusiveSlacker ) {
            conversation = session.rand.pickFrom(RSMiddle());
        }else {
            conversation = session.rand.pickFrom(GenericMiddle());
        }
        conversation.haveHTMLConversation(div, meta, player, player2Start, player1Start);
        doneOnce = true;
    }

    //only happens once.
    void end(Element div) {
        finished = true;
        Player meta = (session as DeadSession).metaPlayer;
        Player player = session.players[0];

        Conversation conversation;

        if(meta == session.mutator.metaHandler.authorBot || meta == session.mutator.metaHandler.authorBotJunior) {
            conversation = session.rand.pickFrom(ABEnd());
        }else if(meta == session.mutator.metaHandler.jadedResearcher ) {
            conversation = session.rand.pickFrom(JREnd());
        }else {
            conversation = session.rand.pickFrom(GenericEnd());
        }
        conversation.haveHTMLConversation(div, meta, player, player2Start, player1Start);
        doneOnce = true;

    }



    //done exactly once
    void intro(Element div) {
        Player meta = (session as DeadSession).metaPlayer;
        Player player = session.players[0];

        Conversation conversation;

        if(meta == session.mutator.metaHandler.authorBot || meta == session.mutator.metaHandler.authorBotJunior) {
            conversation = session.rand.pickFrom(ABIntro());
        }else if(meta == session.mutator.metaHandler.jadedResearcher ) {
            conversation = session.rand.pickFrom(JRIntro());
        }else if(meta == session.mutator.metaHandler.aspiringWatcher ) {
            conversation = session.rand.pickFrom(AWIntro());
        }else if(meta == session.mutator.metaHandler.recusiveSlacker ) {
            conversation = session.rand.pickFrom(RSIntro());
        }else if(meta == session.mutator.metaHandler.karmicRetribution ) {
            conversation = session.rand.pickFrom(KRIntro());
        }else if(meta == session.mutator.metaHandler.wooMod ) {
            conversation = session.rand.pickFrom(WMIntro());
        }else if(meta == session.mutator.metaHandler.dilletantMathematician ) {
            conversation = session.rand.pickFrom(DMIntro());
        }else {
            conversation = session.rand.pickFrom(GenericIntro());
        }

        conversation.haveHTMLConversation(div, meta, player, player2Start, player1Start);
        doneOnce = true;

    }

    List<Conversation> KRIntro() {
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Good job breaking it, hero."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> DMIntro() {
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["If I had to choose between talking to 0 people for the rest of my life and 1 person for the rest of my life, the current situation would come in a distant second."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> WMIntro() {
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Oh sweet skaia, why did you do this? This is a textbook definition of hubris. Literally textbook. I'll do what I can to guide you but really, you're kinda fucked."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> AWIntro() {
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Once more: is it so hard to not to solo a multiplayer game?","Well, well, well, well, wellwellwellwellwellwellwell...wait, you are the bad guy here."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> RSIntro() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Haha, WOW, dude, nice job. Really, I'm completely fucking floored by your masterful skills in the fields of fucking things up so badly they become unwinnable. It's a thing of beauty, really. That being said, let's start the game.","Well WHOOP DE FRICKIN DOO, mister LONER here thinks he doesn't need any stupid friends to play SBURB! Let me tell you, buddy, you fucked up HARD. Enjoy your time in hell, lol."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }


    List<Conversation> JRIntro() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["You're probably gonna fail, you know."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]))
             ..add(new PlusMinusConversationalPair(["I'm totally serious, yo. Dead sessions are meant to be unwinnable."], ["..."],["Well that's just fucking great. And how the fuck do you know this?", "There's no way you know that."]))
             ..add(new PlusMinusConversationalPair(["Dude, I'm like the fucking Author. Of COURSE I know what I'm talking about."], ["..."],["Well fuck you for me existing.", "Fuck off."]));

        List<PlusMinusConversationalPair> convo2 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Hey, I'm the Author."], ["..."],["What the fuck?", "Fuck off."]))
            ..add(new PlusMinusConversationalPair(["Yup, totally made this thing you're in. Weird, huh?"], ["..."],["Well that's just fucking great.", "There's no way."]))
            ..add(new PlusMinusConversationalPair(["Anyways, have fun totally losing this dead session."], ["..."],["Well fuck you for me existing.", "Fuck off."]));


        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));
        return ret;
    }

    List<Conversation> GenericIntro() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["You're probably gonna fail, you know."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]))
            ..add(new PlusMinusConversationalPair(["I'm serious. Dead sessions are meant to be unwinnable."], ["..."],["Well that's just fucking great. And how the fuck do you know this?", "There's no way you know that."]))
            ..add(new PlusMinusConversationalPair(["I helped make this thing,  I know what I'm talking about."], ["..."],["Well fuck you for me existing.", "Fuck off."]));

        List<PlusMinusConversationalPair> convo2 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Hey, I'm one of the creators for this thing."], ["..."],["What the fuck?", "Fuck off."]))
            ..add(new PlusMinusConversationalPair(["Yup, totally helped make this thing you're in. Weird, huh?"], ["..."],["Well that's just fucking great.", "There's no way."]))
            ..add(new PlusMinusConversationalPair(["Anyways, have fun totally losing this dead session."], ["..."],["Well fuck you for me existing.", "Fuck off."]));


        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));
        return ret;
    }

    List<Conversation> GenericMiddle() {
        List<String> myGoodbyes = <String>["Lol. Fine.","Wow, lame.","Anyways, have fun totally losing this dead session.","Harsh. Fine, I'm out."];
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["What the actual fuck are you doing with your life."], ["..."],["Apparently playing the worlds shittiest game.", "More useful things than you are. Don't you have anything better to do than bother me?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Hey, do you know what the point your existence is? I do."], ["..."],["Don't know, don't care.", "I could literally not care less.", "Apparently my point is to be the sole object of your attention. Find a friend, asshole."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["I'm surprised you haven't given up yet."], ["..."],["What would I even do if I did? Just sit here and wait to die?", "Oh, you'd LIKE that, wouldn't you?"]..addAll(fuckOff)));

        List<PlusMinusConversationalPair> convoRand0 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convoRand1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];


        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Haha, wow, this sure looks hard!","Man, that looks like it sucked","Dead sessions suck."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["I sure am glad I wasn't part of a dead session.","It sure does pay to be a Meta player and not a Dead Player.","Better you than me."], ["..."],youAsshole))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<PlusMinusConversationalPair> convo2 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Shit, that looks like it sucked. ", "Man, that looks hard.", "Dead sessions look like they suck."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["No seriously, that was absolutely something you didn't deserve. ", "I'm being serious, nobody deserves this. <span class = 'void'>It's a pun cuz the ideasWrangler nobody championed this.</span>", "You deserve better than this."],["..."], notSoBad))
            ..add(new PlusMinusConversationalPair(["Anyways, have fun totally losing this dead session."], ["..."],goodbye));

        List<PlusMinusConversationalPair> convo3 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["I demand Entertainment.","I'm bored. ", "Sooo....bored.", "Entertain me.", "So. Bored."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["I demand Entertainment.","What're you doing there? ","I'm bored. ", "Sooo....bored.", "Entertain me.", "So. Bored.","Come ooooon. I'm not gonna stop till you do."],["..."], fuckOff))
            ..add(new PlusMinusConversationalPair(["I demand Entertainment.","What're you doing there? ","I'm bored. ", "Sooo....bored.", "Entertain me.", "So. Bored.","Come ooooon. I'm not gonna stop till you do."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["I demand Entertainment.","What're you doing there? ","I'm bored. ", "Sooo....bored.", "Entertain me.", "So. Bored.","Come ooooon. I'm not gonna stop till you do."],["..."], fuckOff))
            ..add(new PlusMinusConversationalPair(["You and I both know how to make this stop.", "You can stop this.", "Just entertain me."],["..."], fuckOff))
            ..add(new PlusMinusConversationalPair(["I can do this forever, you know. ", "Looks like I get to do this forever.", "Do you want to hear the song that never ends?"],["..."], youAsshole))
            ..add(new PlusMinusConversationalPair(myGoodbyes,["..."], goodbye));

        List<PlusMinusConversationalPair> convo4 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["So how about that internet?", "Seen any good Internet lately?", "Got any Internet memes?"], ["..."],["I don't fucking care about the internet.","What ABOUT 'that internet'?","That is the lamest conversation starter I have ever heard."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Whoa, you can't tell me you don't like the Internet. Everybody likes that shit."], ["..."],["The internet is literally the only thing left of my civilization, you asshole."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<PlusMinusConversationalPair> convo5 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Has it occurred to you that your quest in its limitless tedium and thankless busywork was designed to facilitate your personal growth?", "Has it occured to you that all this pointless bullshit might actually have a point?"], ["..."],["Fuck you for implying any of this has meaning and fuck SBURB in case it does.","God, it would make it worse if that were true.","How about 'no'."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Well it's either that or divine punishment for you being such an ass.","That or it might have been designed to fuck with your head and serve as a punishment for being such a horrible little shit?"], ["..."],["Sounds about right.","I'm not sure that's worse."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<PlusMinusConversationalPair> convo6 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["I guess it falls on me to teach you these life lessons, because as unpleasant as the idea is for both of us, I am the closest thing you will ever have to a mentor.", "I am the best at mentoring and teaching life lessons. It is me."], ["..."],["What the fuck? How are you a mentor?","Name ONE life lesson you have ever taught me.","You are the shittiest mentor, it is you."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Hey! I totally have been explaining this shitty game to you!","What about that time I explained how the shitty dead theme of your land works?"], ["..."],["I would be doing better without you.","I don't fucking need your help."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<PlusMinusConversationalPair> convo7 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Wow, you exterminated your entire species! Good job there!", "So how's it feel to be the destroyer of your species?"], ["..."],["Like I fucking knew what playing this game would do.","You tell me, you played this shitty game, too, right?"]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Now, now, no need to get all defensive.", "Let it all out.","Don't worry,  I've killed WAY more than just my own species. You don't get how meta players work, do you?"], ["..."],["You are literally the worst.","How the fuck did you just turn GENOCIDE into a competition?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<PlusMinusConversationalPair> convo8 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Would you like to play a game?", " Let's play a game, asshole.", "Do you want to play a game?"], ["..."],["I'm already playing a game, asshole.","Hell no, I don't want to play whatever shitty game you're talking about."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Come on, it'll be the best game!", "Just a little game, what could it hurt?","I'm bored, play a game with me."], ["..."],["What game?","*sigh* What game, asshole?", "...What game are you talking about?"]))
            ..add(new PlusMinusConversationalPair(["I'm THINKING of a number between 450 and 850.", "Let's go deeper, I bet we could play SBURB while we play SBURB, dog.","I just lost the game."], ["..."],youAsshole))
            ..add(new PlusMinusConversationalPair(myGoodbyes, ["..."],goodbye));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));
        ret.add(new Conversation(convo3));
        ret.add(new Conversation(convo4));
        ret.add(new Conversation(convo5));
        ret.add(new Conversation(convo6));
        ret.add(new Conversation(convo7));
        ret.add(new Conversation(convo8));
        ret.add(new Conversation(convoRand0));
        ret.add(new Conversation(convoRand1));
        return ret;
    }

    List<Conversation> JRMiddle() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["So how are you liking it?"], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["Inorite. Gotta hand it to Hussie to really design a good pointless, bullshit, unwinnable game concept. "], ["..."],["Who?", "What the fuck are you talking about?"]))
            ..add(new PlusMinusConversationalPair(["Whoop! That's like, way more meta levels above you than you need to worry about. Forget I said anything. "], ["..."],["Already have.", "God. I really do hate you."]));

        List<String> terribleIdeas = new List<String>()
            ..add("I'm thinking I figure out how to make everybody replace the word 'dick' with 'bulge'.")
            ..add("I could probably modify SBURB until it just shits out B horror movies forever.")
            ..add("What if, and stay with me here, what if everybody DIDN'T play SBURB, and instead went to high school.  And dated.")
            ..add("What if I filled SBURB with shitty easter eggs. It'd be like fucking Easter all up ins.  Instead of Christmas.")
            ..add("What if I made a robot clone of myself?")
            ..add("What if I came up with a series of riddles, each more shitty and less rewarding than the last?")
            ..add("What if I had a trollsona? I'm thinking...jade blooded researcher? ");

        List<PlusMinusConversationalPair> convo2 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Have I told you about my latest amazing idea? ${session.rand.pickFrom(terribleIdeas)} ", "Let me tell you about my latest amazing idea:  ${session.rand.pickFrom(terribleIdeas)}"], ["..."],["What the fuck?", "Fuck off.", "Oh god, why would you do this?", "What would even be the point of that?", "What the fuck would that acomplish?", "Why. Why is this my life?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["I have literally never had a better idea in my life."], ["..."],["Well that's just fucking great.", "There's no way.", "You know, I can believe that.", "Oh god."]));


        List<PlusMinusConversationalPair> convo4 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Okay okay, what about:  ${session.rand.pickFrom(terribleIdeas)} ", "I just had the best idea! ${session.rand.pickFrom(terribleIdeas)} "], ["..."],["What the fuck?", "Fuck off.", "Oh god, why would you do this?", "What would even be the point of that?", "What the fuck would that acomplish?", "Why. Why is this my life?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["It is the BEST idea."], ["..."],["Holy shit, no it is NOT.", "There's no way.", "Why are all your ideas so stupid?", "Oh god."]..addAll(fuckOff)));


        List<PlusMinusConversationalPair> convo3 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["You know, back when I was a bright eyed and bushy tailed Author, I thought I could get out of this without ever being an Asshole Creator.", "Once upon a time I actually tried not to be too much of an Asshole Creator."], ["..."],["And look at you now, the biggest asshole of them all.","I literally cannot imagine you as not an asshole. "]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Inorite. SBURB just kind of... beats it into you.  Why be nice to someone who is just a drop in the bucket, if you'll excuse my lewdness. There are literally SEXTILLIONS of players just like you. And most of them die."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair([" Yeah yeah, I'll leave you alone. "], ["..."],goodbye));


        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));
        ret.add(new Conversation(convo3));
        ret.add(new Conversation(convo4));
        ret.addAll(GenericMiddle());
        return ret;
    }

    List<Conversation> ABMiddle() {

        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["If you were a flawless automaton, you would have already beaten this game.","Wow, are you STILL playing this game?"], ["..."],["Oh sure, yuck it up while you back seat game. Asshole.", "Not everybody can be 'flawless' robots, asshole."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Wow, good job. That was sarcasm, by the way, in case your inferior fleshy brain couldn't detect that.","Wow, even for a fleshy disastor you failed that one p hard, huh?"], ["..."],["a;sldfj FUCK OF.", "OMFG why are you commenting on this!", ]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["There is a ${bullshit}% chance that you fail, you know. May as well learn to like your shitty planets."], ["..."],["Why is this my life?", "Oh, you'd LIKE that, wouldn't you?"]..addAll(fuckOff)));


        List<PlusMinusConversationalPair> convoRand0 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convoRand1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];


        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["There is a ${bullshit}% chance that you will fail should you become distracted. "], ["..."],["And let me guess, you're the perfect distraction.", "Fuck off."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["I can hardly be blamed for you failing to be a flawless automaton."], ["..."],fuckOff))
            ..add(new PlusMinusConversationalPair(["I suppose I will let you focus, rad robot that I am."], ["..."],["Jegus fuck.", "..."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convoRand0));
        ret.add(new Conversation(convoRand1));
        ret.addAll(GenericMiddle());
        return ret;
    }

    List<Conversation> MIMiddle() {
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Man, its like you don't even notice all the goddamn hard work that I put in for you."], ["..."],["What work!? All you do is bother me!", "Oh yeah, it must be SO tough being the worlds biggest asshole."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["Have you been using fraymotifs?"], ["..."],["Don't know, don't care.", "Why is that even a thing you care about?", "Is it even an option not to in this shitty game?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["The sheer variety of fucking quests available is giant, stop complaining about how you only ever do a few."], ["..."],["I don't care how many quests are THEORETICALLY in this shitty game if I don't get to play them, asshole."]..addAll(youAsshole)));


        List<PlusMinusConversationalPair> convo1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convo2 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));

        ret.addAll(GenericMiddle());
        return ret;
    }

    List<Conversation> WMMiddle() {
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["What? Oh your finally done? Hope you're excited for more pointless tasks!"], ["..."],["Estatic.", "How about 'no'."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Look you really don't deserve this despite being an asshole."], ["..."],["Wow, what a back handed...WAS that even a compliment?"]..addAll(notSoBad)))
            ..add(new PlusMinusConversationalPair(["I know you can do it, I mean you fail in the alpha timeline but we can change the future!"], ["..."],["That....seems wrong, somehow.", "Wait, so you WANT me to doom myself?", "Words of encouragment right there."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["I brought some shitty retro games for you to try before the next bullshit if you need a break."], ["..."],["What is it with you and shitty retro games?", "Why is that even a thing you care about?", "So I can take a break from playing a shitty game by playing...a shitty game with worse graphics. Okay."]..addAll(notSoBad)))
            ..add(new PlusMinusConversationalPair(["You know if you'd had more friends this wouldn't have happened....why the fuck is the muse of breath telling you this?"], ["..."],[" How is it MY fault that people are shitty assholes?"]..addAll(youAsshole)));


        List<PlusMinusConversationalPair> convo1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convo2 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));

        //ret.addAll(GenericMiddle());  WM wants to be less combatative
        return ret;
    }

    List<Conversation> DMMiddle() {
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["The logarithm of 1 is you."], ["..."],["What does that even fucking mean!?", "Wow. Lame."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Is this situation a local Stupidity Maxima, or a global Stupidity Maxima?"], ["..."],["Fuck you I can be ten times as stupid as this.", "What does that even mean!?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["You realize that your victory was so unlikely that there are an infinite number of quantum alternatives where you failed miserably."], ["..."],["And I'll win anyways and then I'll laught at you.", "What does that even mean!?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["If I had to choose between talking to 0 people for the rest of my life and 1 person for the rest of my life, the current situation would come in a distant second"], ["..."],["Oh trust me, the feeling is mutual.", "If I could choose not to talk to you, I fucking would.","Then why don't you stop fucking bothering me!?"]..addAll(fuckOff)));


        List<PlusMinusConversationalPair> convo1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convo2 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));

        ret.addAll(GenericMiddle());
        return ret;
    }

    List<Conversation> NBMiddle() {
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Sorry dawg, you fucked up because I fucked up"], ["..."],["How does that even make sense?", "Yeah, I blame you, too."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["You're doing it wrong. That too. Stop."], ["..."],["Fuck you, I do what I want.", "Yes. I am absolutely failing this game on purpose.","Oh yeah, you're right, why didn't it occur to me to just STOP FAILING AT THIS SHITTY GAME?"]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["If you manage to actually beat this I'll eat my fucking socks"], ["..."],["Hope you enjoy the taste of athelete's foot.", "Get ready for a high fiber diet, asshole."]..addAll(youAsshole)))
            ..add(new PlusMinusConversationalPair(["I cannot even express how much of a disappointment you are."], ["..."],["Oh trust me, the feeling is mutual.", "You patronizing asshole."]..addAll(youAsshole)));


        List<PlusMinusConversationalPair> convo1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convo2 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));

        ret.addAll(GenericMiddle());
        return ret;
    }

    List<Conversation> RSMiddle() {
        List<PlusMinusConversationalPair> randomPairs = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Wow, what a brilliant, grade-A, FDA certified FAILURE of a person you are."], ["..."],["Fuck you, you think you hurt my feelings? I've heard better insults from little diaper wearing babies.", "Yeah, well at least I have something better to do with my day than just be an asshole."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Well, they say one is the loneliest number.  Funny thing, it's also the stupidest.","I think you might have actually been destined to play alone, since a combination of fate and a shitty personality meant that you had like zero chance of hitting up a friend and being like 'yo let's play some Sburb dawg' because you have no friends and that's kinda sad."], ["..."],["Fuck you, you just can't fathom my brilliant strategy of single-player shenanigans here.", "Like this shitty game would be an easier with friends. ","I'd rather be stupid and me than ANYTHING and you."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["F is for fucked up single player sessions, U us for ur alone, N is for no practical victory conditions, welcome to the loser zone!"], ["..."],["Who would have guessed you knew how to spell? Will wonders ever cease?", "Fuck you, I'll figure something out."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Bro I am literally DYING laughing at how exquisitely you fucked up. The creme de la creme of crappy decisions. The filet mignon of failure. The unrivaled champion of doing it wrong. You ordered everything on the menu at the Terrible Ideas cafe, and it's being served piping hot up your asshole. ","Ah, I love Dead Sessions.  Sburb already had Dark Souls levels of difficulty, and this just kicks you in the tender bits in addition to the deathtrap that is the game.  I mean.  Kids and fun!"], ["..."],["Jesus fuck, like the sound of your voice much, asshole?", "Fuck you, I'll figure something out."]..addAll(fuckOff)))
            ..add(new PlusMinusConversationalPair(["Straight up, you are FUCKED bro. This is like an unwinnable joke level that only the numbest of the numbskulls are willing to try."], ["..."],["Oh because I DECIDED to play this game knowing what that meant.", "You patronizing asshole.","Yeah, because I knew that going in. "]..addAll(fuckOff)));


        List<PlusMinusConversationalPair> convo1 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];
        List<PlusMinusConversationalPair> convo2 = <PlusMinusConversationalPair>[session.rand.pickFrom(randomPairs),session.rand.pickFrom(randomPairs)];

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        ret.add(new Conversation(convo2));

        ret.addAll(GenericMiddle());
        return ret;
    }


    List<Conversation> GenericEnd() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Whoa. You fucking did it!"], ["..."],goodbye));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> JREnd() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Oh shit, you ACTUALLY fucking did it!"], ["..."],["No thanks to you.", "No shit, sherlock."]))
            ..add(new PlusMinusConversationalPair(["Well, congratulations are in order, I guess? Good job. "], ["..."],["Yeah, fuck you.", "I don't need your fucking pity."]))
             ..add(new PlusMinusConversationalPair(["Fuck man, talk about a sore winner. Be seeing you. "], ["..."],["Yeah, fuck you too.", "Wait, what?"]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    List<Conversation> ABEnd() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["Holy shit, way to beat the odds there."], ["..."],["Let me guess, you thought only a robot could do it?", "And I'm not even a robot. Probably."]))
            ..add(new PlusMinusConversationalPair(["Welp, have fun in the afterparty. "], ["..."],["The what?", "Wait, what?"]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }

    double get bullshit {
        return 90 + (session.rand.nextDouble()*10);
    }

    List<Conversation> ABIntro() {
        // c= new PlusMinusConversationalPair(["Hey!"], ["Hey!", "Oh cool, I was just thinking of you!"],["What's up?", "Hey"]);
        List<PlusMinusConversationalPair> convo1 = new List<PlusMinusConversationalPair>()
            ..add(new PlusMinusConversationalPair(["There is a ${bullshit}% chance you are going to fail, you know."], ["..."],["Whoa, who the fuck are you?", "Fuck off."]))
            ..add(new PlusMinusConversationalPair(["Dead sessions are designed to be totally unwinnable. I know this because I am the AuthorBot. "], ["..."],["Well that's just fucking great. And how the fuck do you know this?", "There's no way you know that."]))
            ..add(new PlusMinusConversationalPair(["Well shit, I'm a flawless mechanical automaton. I know what I'm talking about. But sure, go ahead and fail to trust your technological betters.  See how that works out for you."], ["..."],["I don't have to fucking believe anything a robot says.", "Fuck off."]));

        List<Conversation> ret = new List<Conversation>();
        ret.add(new Conversation(convo1));
        return ret;
    }



    @override
    bool trigger(List<Player> playerList) {
        if(player1Start == null) player1Start = session.players[0].chatHandleShort()+ ": ";
        if(player2Start == null) player2Start = (session as DeadSession).metaPlayer.chatHandleShortCheckDup(session.players[0].chatHandleShort())+ ": "; //don't be lazy and usePlayer1Start as input, there's a colon.
        //if haven't gone yet, fucking go. otherwise go if you're not done, the player is not dead and a random number is passed.
        return !doneOnce || (!finished && !session.players[0].dead && session.rand.nextDouble()>.9);
    }
}


