// Week 6 - Day 2 - Proxy Pattern


// This is the interface that the concrete class and the proxy both implement.
protocol IBookParser {
    func getWordCount() -> Int
}

// This is the concrete class that you want to add a proxy for.
class ConcreteBookParser: IBookParser {
    
    var bookArray: [String]
    
    init(book: String) {
        self.bookArray = book.components(separatedBy: .whitespacesAndNewlines)
    }
    
    func getWordCount() -> Int {
        return bookArray.count
    }
}

// This is the proxy class which implements the interface and contains a concrete class.
// The functions don't do the calculation they only run the proxy logic in the proxy functions then call the concrete class for the actual calculations.
class LazyProxyBookParser: IBookParser {
    
    var bookParser: ConcreteBookParser?
    var book: String
    
    init(book: String) {
        self.book = book
    }
    
    func getWordCount() -> Int {
        if bookParser == nil {
            self.bookParser = ConcreteBookParser(book: book)
        }
        return self.bookParser!.getWordCount()
    }
}

let henryV = """
ACT I
PROLOGUE
Enter Chorus
Chorus
O for a Muse of fire, that would ascend
The brightest heaven of invention,
A kingdom for a stage, princes to act
And monarchs to behold the swelling scene!
Then should the warlike Harry, like himself,
Assume the port of Mars; and at his heels,
Leash'd in like hounds, should famine, sword and fire
Crouch for employment. But pardon, and gentles all,
The flat unraised spirits that have dared
On this unworthy scaffold to bring forth
So great an object: can this cockpit hold
The vasty fields of France? or may we cram
Within this wooden O the very casques
That did affright the air at Agincourt?
O, pardon! since a crooked figure may
Attest in little place a million;
And let us, ciphers to this great accompt,
On your imaginary forces work.
Suppose within the girdle of these walls
Are now confined two mighty monarchies,
Whose high upreared and abutting fronts
The perilous narrow ocean parts asunder:
Piece out our imperfections with your thoughts;
Into a thousand parts divide on man,
And make imaginary puissance;
Think when we talk of horses, that you see them
Printing their proud hoofs i' the receiving earth;
For 'tis your thoughts that now must deck our kings,
Carry them here and there; jumping o'er times,
Turning the accomplishment of many years
Into an hour-glass: for the which supply,
Admit me Chorus to this history;
Who prologue-like your humble patience pray,
Gently to hear, kindly to judge, our play.
Exit

SCENE I. London. An ante-chamber in the KING'S palace.
Enter the ARCHBISHOP OF CANTERBURY, and the BISHOP OF ELY
CANTERBURY
My lord, I'll tell you; that self bill is urged,
Which in the eleventh year of the last king's reign
Was like, and had indeed against us pass'd,
But that the scambling and unquiet time
Did push it out of farther question.
ELY
But how, my lord, shall we resist it now?
CANTERBURY
It must be thought on. If it pass against us,
We lose the better half of our possession:
For all the temporal lands which men devout
By testament have given to the church
Would they strip from us; being valued thus:
As much as would maintain, to the king's honour,
Full fifteen earls and fifteen hundred knights,
Six thousand and two hundred good esquires;
And, to relief of lazars and weak age,
Of indigent faint souls past corporal toil.
A hundred almshouses right well supplied;
And to the coffers of the king beside,
A thousand pounds by the year: thus runs the bill.
ELY
This would drink deep.
CANTERBURY
'Twould drink the cup and all.
ELY
But what prevention?
CANTERBURY
The king is full of grace and fair regard.
ELY
And a true lover of the holy church.
CANTERBURY
The courses of his youth promised it not.
The breath no sooner left his father's body,
But that his wildness, mortified in him,
Seem'd to die too; yea, at that very moment
Consideration, like an angel, came
And whipp'd the offending Adam out of him,
Leaving his body as a paradise,
To envelop and contain celestial spirits.
Never was such a sudden scholar made;
Never came reformation in a flood,
With such a heady currance, scouring faults
Nor never Hydra-headed wilfulness
So soon did lose his seat and all at once
As in this king.
ELY
We are blessed in the change.
CANTERBURY
Hear him but reason in divinity,
And all-admiring with an inward wish
You would desire the king were made a prelate:
Hear him debate of commonwealth affairs,
You would say it hath been all in all his study:
List his discourse of war, and you shall hear
A fearful battle render'd you in music:
Turn him to any cause of policy,
The Gordian knot of it he will unloose,
Familiar as his garter: that, when he speaks,
The air, a charter'd libertine, is still,
And the mute wonder lurketh in men's ears,
To steal his sweet and honey'd sentences;
So that the art and practic part of life
Must be the mistress to this theoric:
Which is a wonder how his grace should glean it,
Since his addiction was to courses vain,
His companies unletter'd, rude and shallow,
His hours fill'd up with riots, banquets, sports,
And never noted in him any study,
Any retirement, any sequestration
From open haunts and popularity.
ELY
The strawberry grows underneath the nettle
And wholesome berries thrive and ripen best
Neighbour'd by fruit of baser quality:
And so the prince obscured his contemplation
Under the veil of wildness; which, no doubt,
Grew like the summer grass, fastest by night,
Unseen, yet crescive in his faculty.
CANTERBURY
It must be so; for miracles are ceased;
And therefore we must needs admit the means
How things are perfected.
ELY
But, my good lord,
How now for mitigation of this bill
Urged by the commons? Doth his majesty
Incline to it, or no?
CANTERBURY
He seems indifferent,
Or rather swaying more upon our part
Than cherishing the exhibiters against us;
For I have made an offer to his majesty,
Upon our spiritual convocation
And in regard of causes now in hand,
Which I have open'd to his grace at large,
As touching France, to give a greater sum
Than ever at one time the clergy yet
Did to his predecessors part withal.
ELY
How did this offer seem received, my lord?
CANTERBURY
With good acceptance of his majesty;
Save that there was not time enough to hear,
As I perceived his grace would fain have done,
The severals and unhidden passages
Of his true titles to some certain dukedoms
And generally to the crown and seat of France
Derived from Edward, his great-grandfather.
ELY
What was the impediment that broke this off?
CANTERBURY
The French ambassador upon that instant
Craved audience; and the hour, I think, is come
To give him hearing: is it four o'clock?
ELY
It is.
CANTERBURY
Then go we in, to know his embassy;
Which I could with a ready guess declare,
Before the Frenchman speak a word of it.
ELY
I'll wait upon you, and I long to hear it.
Exeunt

SCENE II. The same. The Presence chamber.
Enter KING HENRY V, GLOUCESTER, BEDFORD, EXETER, WARWICK, WESTMORELAND, and Attendants
KING HENRY V
Where is my gracious Lord of Canterbury?
EXETER
Not here in presence.
KING HENRY V
Send for him, good uncle.
WESTMORELAND
Shall we call in the ambassador, my liege?
KING HENRY V
Not yet, my cousin: we would be resolved,
Before we hear him, of some things of weight
That task our thoughts, concerning us and France.
Enter the ARCHBISHOP OF CANTERBURY, and the BISHOP of ELY

CANTERBURY
God and his angels guard your sacred throne
And make you long become it!
KING HENRY V
Sure, we thank you.
My learned lord, we pray you to proceed
And justly and religiously unfold
Why the law Salique that they have in France
Or should, or should not, bar us in our claim:
And God forbid, my dear and faithful lord,
That you should fashion, wrest, or bow your reading,
Or nicely charge your understanding soul
With opening titles miscreate, whose right
Suits not in native colours with the truth;
For God doth know how many now in health
Shall drop their blood in approbation
Of what your reverence shall incite us to.
Therefore take heed how you impawn our person,
How you awake our sleeping sword of war:
We charge you, in the name of God, take heed;
For never two such kingdoms did contend
Without much fall of blood; whose guiltless drops
Are every one a woe, a sore complaint
'Gainst him whose wrong gives edge unto the swords
That make such waste in brief mortality.
Under this conjuration, speak, my lord;
For we will hear, note and believe in heart
That what you speak is in your conscience wash'd
As pure as sin with baptism.
CANTERBURY
Then hear me, gracious sovereign, and you peers,
That owe yourselves, your lives and services
To this imperial throne. There is no bar
To make against your highness' claim to France
But this, which they produce from Pharamond,
'In terram Salicam mulieres ne succedant:'
'No woman shall succeed in Salique land:'
Which Salique land the French unjustly gloze
To be the realm of France, and Pharamond
The founder of this law and female bar.
Yet their own authors faithfully affirm
That the land Salique is in Germany,
Between the floods of Sala and of Elbe;
Where Charles the Great, having subdued the Saxons,
There left behind and settled certain French;
Who, holding in disdain the German women
For some dishonest manners of their life,
Establish'd then this law; to wit, no female
Should be inheritrix in Salique land:
Which Salique, as I said, 'twixt Elbe and Sala,
Is at this day in Germany call'd Meisen.
Then doth it well appear that Salique law
Was not devised for the realm of France:
Nor did the French possess the Salique land
Until four hundred one and twenty years
After defunction of King Pharamond,
Idly supposed the founder of this law;
Who died within the year of our redemption
Four hundred twenty-six; and Charles the Great
Subdued the Saxons, and did seat the French
Beyond the river Sala, in the year
Eight hundred five. Besides, their writers say,
King Pepin, which deposed Childeric,
Did, as heir general, being descended
Of Blithild, which was daughter to King Clothair,
Make claim and title to the crown of France.
Hugh Capet also, who usurped the crown
Of Charles the duke of Lorraine, sole heir male
Of the true line and stock of Charles the Great,
To find his title with some shows of truth,
'Through, in pure truth, it was corrupt and naught,
Convey'd himself as heir to the Lady Lingare,
Daughter to Charlemain, who was the son
To Lewis the emperor, and Lewis the son
Of Charles the Great. Also King Lewis the Tenth,
Who was sole heir to the usurper Capet,
Could not keep quiet in his conscience,
Wearing the crown of France, till satisfied
That fair Queen Isabel, his grandmother,
Was lineal of the Lady Ermengare,
Daughter to Charles the foresaid duke of Lorraine:
By the which marriage the line of Charles the Great
Was re-united to the crown of France.
So that, as clear as is the summer's sun.
King Pepin's title and Hugh Capet's claim,
King Lewis his satisfaction, all appear
To hold in right and title of the female:
So do the kings of France unto this day;
Howbeit they would hold up this Salique law
To bar your highness claiming from the female,
And rather choose to hide them in a net
Than amply to imbar their crooked titles
Usurp'd from you and your progenitors.
KING HENRY V
May I with right and conscience make this claim?
CANTERBURY
The sin upon my head, dread sovereign!
For in the book of Numbers is it writ,
When the man dies, let the inheritance
Descend unto the daughter. Gracious lord,
Stand for your own; unwind your bloody flag;
Look back into your mighty ancestors:
Go, my dread lord, to your great-grandsire's tomb,
From whom you claim; invoke his warlike spirit,
And your great-uncle's, Edward the Black Prince,
Who on the French ground play'd a tragedy,
Making defeat on the full power of France,
Whiles his most mighty father on a hill
Stood smiling to behold his lion's whelp
Forage in blood of French nobility.
O noble English. that could entertain
With half their forces the full Pride of France
And let another half stand laughing by,
All out of work and cold for action!
ELY
Awake remembrance of these valiant dead
And with your puissant arm renew their feats:
You are their heir; you sit upon their throne;
The blood and courage that renowned them
Runs in your veins; and my thrice-puissant liege
Is in the very May-morn of his youth,
Ripe for exploits and mighty enterprises.
EXETER
Your brother kings and monarchs of the earth
Do all expect that you should rouse yourself,
As did the former lions of your blood.
WESTMORELAND
They know your grace hath cause and means and might;
So hath your highness; never king of England
Had nobles richer and more loyal subjects,
Whose hearts have left their bodies here in England
And lie pavilion'd in the fields of France.
CANTERBURY
O, let their bodies follow, my dear liege,
With blood and sword and fire to win your right;
In aid whereof we of the spiritualty
Will raise your highness such a mighty sum
As never did the clergy at one time
Bring in to any of your ancestors.
KING HENRY V
We must not only arm to invade the French,
But lay down our proportions to defend
Against the Scot, who will make road upon us
With all advantages.
CANTERBURY
They of those marches, gracious sovereign,
Shall be a wall sufficient to defend
Our inland from the pilfering borderers.
KING HENRY V
We do not mean the coursing snatchers only,
But fear the main intendment of the Scot,
Who hath been still a giddy neighbour to us;
For you shall read that my great-grandfather
Never went with his forces into France
But that the Scot on his unfurnish'd kingdom
Came pouring, like the tide into a breach,
With ample and brim fulness of his force,
Galling the gleaned land with hot assays,
Girding with grievous siege castles and towns;
That England, being empty of defence,
Hath shook and trembled at the ill neighbourhood.
CANTERBURY
She hath been then more fear'd than harm'd, my liege;
For hear her but exampled by herself:
When all her chivalry hath been in France
And she a mourning widow of her nobles,
She hath herself not only well defended
But taken and impounded as a stray
The King of Scots; whom she did send to France,
To fill King Edward's fame with prisoner kings
And make her chronicle as rich with praise
As is the ooze and bottom of the sea
With sunken wreck and sunless treasuries.
WESTMORELAND
But there's a saying very old and true,
'If that you will France win,
Then with Scotland first begin:'
For once the eagle England being in prey,
To her unguarded nest the weasel Scot
Comes sneaking and so sucks her princely eggs,
Playing the mouse in absence of the cat,
To tear and havoc more than she can eat.
EXETER
It follows then the cat must stay at home:
Yet that is but a crush'd necessity,
Since we have locks to safeguard necessaries,
And pretty traps to catch the petty thieves.
While that the armed hand doth fight abroad,
The advised head defends itself at home;
For government, though high and low and lower,
Put into parts, doth keep in one consent,
Congreeing in a full and natural close,
Like music.
CANTERBURY
Therefore doth heaven divide
The state of man in divers functions,
Setting endeavour in continual motion;
To which is fixed, as an aim or butt,
Obedience: for so work the honey-bees,
Creatures that by a rule in nature teach
The act of order to a peopled kingdom.
They have a king and officers of sorts;
Where some, like magistrates, correct at home,
Others, like merchants, venture trade abroad,
Others, like soldiers, armed in their stings,
Make boot upon the summer's velvet buds,
Which pillage they with merry march bring home
To the tent-royal of their emperor;
Who, busied in his majesty, surveys
The singing masons building roofs of gold,
The civil citizens kneading up the honey,
The poor mechanic porters crowding in
Their heavy burdens at his narrow gate,
The sad-eyed justice, with his surly hum,
Delivering o'er to executors pale
The lazy yawning drone. I this infer,
That many things, having full reference
To one consent, may work contrariously:
As many arrows, loosed several ways,
Come to one mark; as many ways meet in one town;
As many fresh streams meet in one salt sea;
As many lines close in the dial's centre;
So may a thousand actions, once afoot.
End in one purpose, and be all well borne
Without defeat. Therefore to France, my liege.
Divide your happy England into four;
Whereof take you one quarter into France,
And you withal shall make all Gallia shake.
If we, with thrice such powers left at home,
Cannot defend our own doors from the dog,
Let us be worried and our nation lose
The name of hardiness and policy.
KING HENRY V
Call in the messengers sent from the Dauphin.
Exeunt some Attendants

Now are we well resolved; and, by God's help,
And yours, the noble sinews of our power,
France being ours, we'll bend it to our awe,
Or break it all to pieces: or there we'll sit,
Ruling in large and ample empery
O'er France and all her almost kingly dukedoms,
Or lay these bones in an unworthy urn,
Tombless, with no remembrance over them:
Either our history shall with full mouth
Speak freely of our acts, or else our grave,
Like Turkish mute, shall have a tongueless mouth,
Not worshipp'd with a waxen epitaph.
Enter Ambassadors of France

Now are we well prepared to know the pleasure
Of our fair cousin Dauphin; for we hear
Your greeting is from him, not from the king.
First Ambassador
May't please your majesty to give us leave
Freely to render what we have in charge;
Or shall we sparingly show you far off
The Dauphin's meaning and our embassy?
KING HENRY V
We are no tyrant, but a Christian king;
Unto whose grace our passion is as subject
As are our wretches fetter'd in our prisons:
Therefore with frank and with uncurbed plainness
Tell us the Dauphin's mind.
First Ambassador
Thus, then, in few.
Your highness, lately sending into France,
Did claim some certain dukedoms, in the right
Of your great predecessor, King Edward the Third.
In answer of which claim, the prince our master
Says that you savour too much of your youth,
And bids you be advised there's nought in France
That can be with a nimble galliard won;
You cannot revel into dukedoms there.
He therefore sends you, meeter for your spirit,
This tun of treasure; and, in lieu of this,
Desires you let the dukedoms that you claim
Hear no more of you. This the Dauphin speaks.
KING HENRY V
What treasure, uncle?
EXETER
Tennis-balls, my liege.
KING HENRY V
We are glad the Dauphin is so pleasant with us;
His present and your pains we thank you for:
When we have march'd our rackets to these balls,
We will, in France, by God's grace, play a set
Shall strike his father's crown into the hazard.
Tell him he hath made a match with such a wrangler
That all the courts of France will be disturb'd
With chaces. And we understand him well,
How he comes o'er us with our wilder days,
Not measuring what use we made of them.
We never valued this poor seat of England;
And therefore, living hence, did give ourself
To barbarous licence; as 'tis ever common
That men are merriest when they are from home.
But tell the Dauphin I will keep my state,
Be like a king and show my sail of greatness
When I do rouse me in my throne of France:
For that I have laid by my majesty
And plodded like a man for working-days,
But I will rise there with so full a glory
That I will dazzle all the eyes of France,
Yea, strike the Dauphin blind to look on us.
And tell the pleasant prince this mock of his
Hath turn'd his balls to gun-stones; and his soul
Shall stand sore charged for the wasteful vengeance
That shall fly with them: for many a thousand widows
Shall this his mock mock out of their dear husbands;
Mock mothers from their sons, mock castles down;
And some are yet ungotten and unborn
That shall have cause to curse the Dauphin's scorn.
But this lies all within the will of God,
To whom I do appeal; and in whose name
Tell you the Dauphin I am coming on,
To venge me as I may and to put forth
My rightful hand in a well-hallow'd cause.
So get you hence in peace; and tell the Dauphin
His jest will savour but of shallow wit,
When thousands weep more than did laugh at it.
Convey them with safe conduct. Fare you well.
Exeunt Ambassadors

EXETER
This was a merry message.
KING HENRY V
We hope to make the sender blush at it.
Therefore, my lords, omit no happy hour
That may give furtherance to our expedition;
For we have now no thought in us but France,
Save those to God, that run before our business.
Therefore let our proportions for these wars
Be soon collected and all things thought upon
That may with reasonable swiftness add
More feathers to our wings; for, God before,
We'll chide this Dauphin at his father's door.
Therefore let every man now task his thought,
That this fair action may on foot be brought.
Exeunt. Flourish
"""


let bookProxy = LazyProxyBookParser(book: henryV)
bookProxy.getWordCount()
bookProxy.getWordCount()
