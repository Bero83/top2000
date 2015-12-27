# A = 1e waarschuwinh
# B = 2e waarschuwing
# C = 3e waarschuwing
# D = ban 10 minuten voor zowel #top2000 als voor #top2000cafe.
# E = 24uur ban voor zowel #top2000 als voor #top2000cafe.

# Bij elke gebeurtenis, wordt er een notice naar kanaal #ballenbak gestuurd met de actie
# Voorbeeld: "Bero heeft zijn 1e waarschuwing gekregen voor vloeken"

# password voor gebruiker
set bword "badword1"

###woordenlijst

# #top2000
bind pubm - "#top2000 * hoer" badword
bind pubm - "#top2000 * hoer *" badword
bind pubm - "#top2000 * kanker" badword
bind pubm - "#top2000 * kanker *" badword
bind pubm - "#top2000 * klote" badword
bind pubm - "#top2000 * klote *" badword
bind pubm - "#top2000 * tyfus" badword
bind pubm - "#top2000 * tyfus *" badword
bind pubm - "#top2000 * mongool" badword
bind pubm - "#top2000 * mongool *" badword
bind pubm - "#top2000 * slet" badword
bind pubm - "#top2000 * slet *" badword
bind pubm - "#top2000 * eikel" badword 
bind pubm - "#top2000 * eikel *" badword 
bind pubm - "#top2000 * neuken" badword
bind pubm - "#top2000 * neuken *" badword
bind pubm - "#top2000 * shit" badword
bind pubm - "#top2000 * shit *" badword
bind pubm - "#top2000 * fuk" badword
bind pubm - "#top2000 * fuk *" badword
bind pubm - "#top2000 * fuck" badword
bind pubm - "#top2000 * fuck *" badword
bind pubm - "#top2000 * nigger" badword
bind pubm - "#top2000 * nigger *" badword
bind pubm - "#top2000 * bitch" badword
bind pubm - "#top2000 * bitch *" badword
bind pubm - "#top2000 * lul" badword
bind pubm - "#top2000 * lul *" badword
bind pubm - "#top2000 * kut" badword
bind pubm - "#top2000 * kut *" badword

bind pubm - "#top2000cafe * hoer" badword
bind pubm - "#top2000cafe * hoer *" badword
bind pubm - "#top2000cafe * kanker" badword
bind pubm - "#top2000cafe * kanker *" badword
bind pubm - "#top2000cafe * klote" badword
bind pubm - "#top2000cafe * klote *" badword
bind pubm - "#top2000cafe * tyfus" badword
bind pubm - "#top2000cafe * tyfus *" badword
bind pubm - "#top2000cafe * mongool" badword
bind pubm - "#top2000cafe * mongool *" badword
bind pubm - "#top2000cafe * slet" badword
bind pubm - "#top2000cafe * slet *" badword
bind pubm - "#top2000cafe * eikel" badword 
bind pubm - "#top2000cafe * eikel *" badword 
bind pubm - "#top2000cafe * neuken" badword
bind pubm - "#top2000cafe * neuken *" badword
bind pubm - "#top2000cafe * shit" badword
bind pubm - "#top2000cafe * shit *" badword
bind pubm - "#top2000cafe * fuk" badword
bind pubm - "#top2000cafe * fuk *" badword
bind pubm - "#top2000cafe * fuck" badword
bind pubm - "#top2000cafe * fuck *" badword
bind pubm - "#top2000cafe * nigger" badword
bind pubm - "#top2000cafe * nigger *" badword
bind pubm - "#top2000cafe * bitch" badword
bind pubm - "#top2000cafe * bitch *" badword
bind pubm - "#top2000cafe * lul" badword
bind pubm - "#top2000cafe * lul *" badword
bind pubm - "#top2000cafe * kut" badword
bind pubm - "#top2000cafe * kut *" badword

 #waarschuwingen
set warn_chan_1_tot_3 	"Je hebt een waarschuwing. Ik heb je een privebericht gestuurd met waarom."
set warn_pb_1_tot_3 	"Je hebt een waarschuwing gekregen in verband met je taalgebruik. De Top2000 is namelijk een openbare chat voor alle leeftijden. Denk daarom aan je taalgebruik"
set warn_chan_4			"Helaas kan $nick zich niet aan de regeltjes houden en mag 10 minuten afkoelen"
set warn_pb_4			"Helaas hebben de 3 waarschuwingen voor taalgebruik niet geholpen. Je bent voor 10 minuten gebanned van de Top2000 kanalen. Niet eens met dit besluit? Dan kun je naar kanaal #ballenbak gaan om je beklacht te doen bij de beheerders."
set warn_chan_5			"Helaas heeft alle kansen verspeeld en heeft een ban voor 24uur"
set warn_pb_5			"Helaas hebben de waarschuwingen en de 10 minuten ban niet geholpen. Je bent voor 24uur gebannedn uit van de Top2000 kanalen. Niet eens met dit besluit? Dan kun je naar kanaal #ballenbak gaan om je beklacht te doen bij de beheerders."


proc badword {nick uhost hand chan rest} {
if {[matchattr $hand m]} {
	putquick "PRIVMSG #ballenbak : $nick vloekte in $chan, maar is beheerder: $rest"
	return 0
	} elseif  {![matchattr $hand m]} {

		global botnick warn_chan_1_tot_3 warn_pb_1_tot_3 warn_chan_4 warn_pb_4 warn_chan_5 warn_pb_5 bword
		set open [open /home/waakvlam/eggdrop/scripts/badword.log a] 
		puts $open "[strftime "%d-%m-%Y \[%T\]"] <$nick> $rest" 
		close $open 
		set regel "[strftime "%d-%m-%Y \[%T\]"] <$nick> $rest"




#   #
# B #
#   #
# als flag A is set naar B
set testnick [nick2hand $nick]

		if {([ matchattr $hand A ])} {
			putquick "PRIVMSG #ballenbak :vloek level $nick is 2 : $rest"
			putquick "NOTICE $nick :\001$nick $warn_chan_1_tot_3\001"
			putquick "PRIVMSG $nick :$warn_pb_1_tot_3"
			chattr $hand -A+B
			setuser $hand COMMENT "Tweede vloek overtreding"
			return 1
#   #
# C #		
#   #
# als flag B is set naar C
	} elseif {([matchattr $hand B])} {
			putquick "PRIVMSG #ballenbak :vloek level $nick is 3 : $rest"
			putquick "NOTICE $nick :\001 $nick $warn_chan_1_tot_3\001"
			putquick "PRIVMSG $nick :$warn_pb_1_tot_3"
			chattr $hand -B+C
			setuser $hand COMMENT "Derde vloek overtreding"
			return 1

#	#	
# D #
#	#		
# als flag C is net naar D
		} elseif {([matchattr $hand C])} {
		set de_reden "Ban voor 10 minuten wegens vloeken"
			putquick "PRIVMSG #ballenbak :vloek level $nick is 4 : $rest"
			putquick "NOTICE $nick :\001$nick $warn_chan_4\001"
			putquick "PRIVMSG $nick :$warn_pb_4"
			putquick "INVITE $nick :#ballenbak"
			set banlamer [maskhost [getchanhost $nick $chan]]
			newchanban #top2000 $banlamer $de_reden $de_reden 10
			newchanban #top2000cafe $banlamer $de_reden $de_reden 10
			putquick "KICK #top2000 $nick :10 minuten ban wegens vloeken"
			putquick "KICK #top2000cafe $nick :10 minuten ban wegens vloeken"
   		chattr $nick -C+D
			setuser $nick COMMENT "$rest"
			return 1

#	#	
# E #
#	#
# als flag D is set naar E
		} elseif {([matchattr $hand D])} {
			set de_reden "Ban voor 24uur wegens vloeken"
			putquick "PRIVMSG #ballenbak :vloek level $hand is 5(24uur ban) : $rest"
			putquick "NOTICE $nick :\001$nick $warn_chan_5\001"
			putquick "PRIVMSG $nick :$warn_pb_5"
			putquick "INVITE $nick :#ballenbak"
			set banlamer [maskhost [getchanhost $nick $chan]]
			newchanban #top2000 $banlamer $de_reden $de_reden 1440 sticky
			newchanban #top2000cafe $banlamer $de_reden $de_reden 1440 sticky
			putquick "KICK #top2000 $nick :24uurs ban wegens vloeken"
			putquick "KICK #top2000cafe $nick :24uurs ban wegens vloeken"
			chattr $nick -D+E
			setuser $nick COMMENT "5e vloek overtreding en 24uurs. ban"
			return 1

		} else {
	
		# 1e overtreding. adduser, privmsg, notice, chattr A, pass, comment
		# 
		    if {![matchattr $nick O] && ![matchattr $nick n]} {

				adduser $nick [maskhost [getchanhost $nick $chan]]
				putquick "PRIVMSG #ballenbak :vloek level $nick is 1 : $rest"
				putquick "PRIVMSG #top2000 :$nick :\001$nick $warn_chan_1_tot_3\001"
				putquick "PRIVMSG $nick :$warn_pb_1_tot_3"
				set nick_add [nick2hand $nick]
				chattr $nick_add +A
				setuser $nick_add PASS $bword 
				setuser $nick_add COMMENT "Eerste vloek overtreding"
				return 0
			}
		}
	}
}
putlog "VloekerBan v1.6 - 2015"
