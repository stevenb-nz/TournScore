#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub EnableMenuItems()
		  filenew.enabled = true
		  fileopen.enabled = true
		  filesaveas.enabled = true
		  if ubound(gamelist) > -1 then
		    filetabledraw.enabled = true
		    fileratingdump.enabled = true
		    windowcurrentround.enabled = true
		  end if
		  if not(keepcheck) then
		    importplayers.enabled = true
		    addplayer.enabled = true
		    addgrade.enabled = true
		    addround.enabled = true
		  end if
		  if ubound(app.playerlist) > -1 and ubound(app.roundlist) > -1 then
		    addcreatedraw.enabled = true
		  end if
		  windowtournament.enabled = true
		  windowgrades.enabled = true
		  windowplayers.enabled = true
		  windowrounds.enabled = true
		  if windowcount > 0 then
		    windowclose.enabled = true
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub NewDocument()
		  dim f,g as folderItem
		  dim s as string
		  dim t as textinputStream
		  
		  f=SpecialFolder.Preferences.Child("nzts prefs")
		  if f.exists then
		    t = f.openastextFile
		    g = getfolderItem(t.readline)
		    t.close
		    if g.exists then
		      opendocument(g)
		    else
		      nofiledialog.showmodal
		    end if
		  else
		    nofiledialog.showmodal
		  end if
		  exception err as nilobjectexception
		    nofiledialog.showmodal
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  currenttournfile = nil
		  epsonlandscape = ""
		  epsonportrait = ""
		  gamelist.remove 0
		  roundlist.remove 0
		  playerlist.remove 0
		  gradelist.remove 0
		  keepcheck = false
		  drawstring(1) = "AB"
		  drawstring(2) = "BCADCADBABCD"
		  drawstring(3) = "ADBECFDBECAFBCFDEADECAFBABCDEF"
		  drawstring(4) = "FGADBECHDBECHFGACFEAHDBGBCFDGEAHDEGCAFHBCADGEHFBABCDEFGH"
		  drawstring(5) = "ADBEFIGJCHDBECHFIGAJEHGCAFDIJBFGEAHDBICJCFIEBGJDAHDEJFGAHBICBCFDGEJHIAHICADGFBEJABCDEFGHIJ"
		  drawstring(6) = "HIGCAFDKELJBCFLHBGJDKEIAGJEAHDFKBICLDEKGHBICLFAJJKADBEFICHGLDBECHFIGLJKAFGIEAHCJLDBKEHJFDIGAKCLBBCFDGEJHKIALCADGHKILFBEJABCDEFGHIJKL"
		  drawstring(7) = "EHKGDINFAJLBMCJKEAHDBIFMGNCLGJIEFKAHLDBMCNDENJHBICLFMGKACFMIBGJDKENHALILGCAFHMDKJBENADBEFIJMKNCHGLDBECHFIGLJMKANFGLHCJIAMEBKNDHIJFGAELKCDMNBBCFDGEJHKINLMALMCADGHKFBEJINABCDEFGHIJKLMN"
		  drawstring(8) = "EHNJDIOGKALBMCPFJKIEAHGNLDFOBMCPILJFHMGAKCDOEPNBFGMICJPHBKNDOEALKNEAHDJOBIFMCLGPDEOKHBICLFMGPJANNOADBEFIJMCHGLKPDBECHFIGLJMKPNOACFPLBGJDKENHOIMALMGCAFDKHOIPJBENGJLHFKIAMECNPDBOHIKGELNFAJDMOCPBBCFDGEJHKINLOMAPCADGHKLOMPFBEJINABCDEFGHIJKLMNOP"
		  drawstring(9) = "ADBEFIJMNQORCHGLKPDBECHFIGLJMKPNQOARHINJELOGDMKARFPBQCJKLHGNIAMEFOPDBQCRNOEAHDBIFMJQKRCLGPDERNHBICLFMGPJQKOACFQMBGJDKENHOIRLAPMPGCAFLQDKHOJBENIRGJMIFKPHALCNQEBORDILKGHMNFAJEPOCDQRBKNIEJOAHLDBMFQGRCPEHOKDIRJLBMCPFQGANFGPLCJQIBKNDOERHMALMJFGAIPKCHQDONBERBCFDGEJHKINLOMRPQAPQCADGHKLOFBEJINMRABCDEFGHIJKLMNOPQR"
		  drawstring(10) = "DESOHBICLFMGPJQKTNAROREAHDNSBIFMJQCLGPKTCFTPBGJDKENHOIRLSMQAPQGCAFDKHOLSMTJBENIRGJPLFKQICNMATHBORDSELMKGIPNFAJHQOCDSETRBRSADBEFIJMNQCHGLKPOTDBECHFIGLJMKPNQOTRSANOIEAHKRLDJSBMFQCPGTHIOKELRJDMSGANPBQCTFKNLHJOIAMEGRPDFSBQCTEHRNDISKLBMCPFQGTJOAFGQMCJTLBKNDOERHSIAPMPJFLQGAKCDOHSITNBERJKMIGNPHFOALQECRTDBSILNJHMOGKAEPRFDQSCTBBCFDGEJHKINLOMRPSQATCADGHKLOPSQTFBEJINMRABCDEFGHIJKLMNOPQRST"
		  drawstring(11) = "ADBEFIJMNQRUSVCHGLKPOTDBECHFIGLJMKPNQOTRUSAVHIRNELSKDMVJOAPBQCTFUGNOLHKRIAMEJSPDBQFUGVCTGJQMFKTLCNUIBORDSEVHAPMPKGLQNFAJITOCHUDSRBEVJKPLGNQIFOMATHCRUEBSVDLMNJIPOGHQKARFETSCDUVBORIENSAHLDBMFQJUKVCPGTEHSODIVNLBMCPFQGTJUKARRSEAHDBIFMJQNUOVCLGPKTDEVRHBICLFMGPJQKTNUOSACFUQBGJDKENHOIRLSMVPATQTGCAFPUDKHOLSJBENIRMVKNMIJOPHALGRQEFSTDBUCVILOKHMRJEPSGANDQVFTBUCFGTPCJUMBKNDOERHSIVLQAPQJFGAMTKCLUDOHSNBERIVBCFDGEJHKINLOMRPSQVTUATUCADGHKLOPSFBEJINMRQVABCDEFGHIJKLMNOPQRSTUV"
		  drawstring(12) = "VWADBEFIJMNQRUCHGLKPOTSXDBECHFIGLJMKPNQOTRUSXVWATUGCAFDKHOLSPWQXJBENIRMVCFXTBGJDKENHOIRLSMVPWQUAGJTPFKUMCNXLBORDSEVHWIQAPQKGMTNFAJLUOCDSHWIXRBEVNOMIKRPHJSALQEGVTDFWBUCXILRNHMSKEPVJDQOAWGTBUCXFORLHNSIAMEKVPDJWBQFUCTGXHISOELVNDMWKPBQCTFUGXJARRSIEAHOVLDNWBMFQJUCPGTKXEHVRDIWOLBMCPFQGTJUKXNSASVEAHDRWBIFMJQNUCLGPKTOXDEWSHBICLFMGPJQKTNUOXRAVFGUQCJXPBKNDOERHSIVLWMATQTJFPUGAKCDOHSLWMXNBERIVJKQMGNTLFOUIAPCRXHBSVDWEMPNJLQOGKAITRFHUSCDWEXVBKNPLJOQIGRMATHFSUECVXDBWLMOKIPRJHQSGANETVFDUWCXBBCFDGEJHKINLOMRPSQVTWUAXCADGHKLOPSTWUXFBEJINMRQVABCDEFGHIJKLMNOPQRSTUVWX"
		  drawstring(13) = "ILSOHMVNEPWKDQZJARTBUCXFYGORMINSPHALKVQEJWTDBUFYGZCXSVIERWAHLDBMFQJUNYOZCPGTKXEHWSDIZRLBMCPFQGTJUKXNYOAVLMRNIPSKHQVJOAETWGDUZFXBYCNOPLKRQIJSMATHGVUEFWXDBYCZPQNJMTOGLUKARFIXSCHYDWVBEZJKTPGNUMFOXLCRQAYIBSVDWEZHQTKGPUNFAJMXOCLYDSHWRBEVIZGJUQFKXPCNYMBORDSEVHWIZLATUXGCAFTYDKHOLSPWJBENIRMVQZCFYUBGJDKENHOIRLSMVPWQZTAXVWEAHDBIFMJQNURYSZCLGPKTOXDEZVHBICLFMGPJQKTNUOXRYSWARSLHOVIAMENWPDBQFUJYKZCTGXHIVRELWODMZNPBQCTFUGXJYKSAADBEFIJMNQRUVYWZCHGLKPOTSXDBECHFIGLJMKPNQOTRUSXVYWAZKNQMJOTLGRUIFSAPXHCVYEBWZDMPOKLQRJITSGANHUVFEXWCDYZBFGXTCJYQBKNDOERHSIVLWMZPUATUJFGAQXKCPYDOHSLWNBERIVMZBCFDGEJHKINLOMRPSQVTWUZXYAXYCADGHKLOPSTWFBEJINMRQVUZABCDEFGHIJKLMNOPQRSTUVWXYZ"
		  ttdrawstring = "NBCOPDEQRFGSTHIUVJKWXLAYSABTUCDVWEFXYGHNOIJPQKLRNCDOPEFQRGHSTIJUVKLWXABYARSBCTUDEVWFGXYHINOJKPQLDNOEFPQGHRSIJTUKLVWABXYCAQRBCSTDEUVFGWXHIYNJKOPLENOFGPQHIRSJKTULAVWBCXYDPABQRCDSTEFUVGHWXIJYNKLONFGOPHIQRJKSTLAUVBCWXDEYOABPQCDRSEFTUGHVWIJXYKLNTANGBUHOVCPIDWJQXERKFYLSANOBCPQDERSFGTUHIVWJKXYL"
		  wwdrawstring(12) = "NBCOPDEQRFGSTHIUVJKWXLAYSABTUCDVWEFXYGHNOIJPQKLRNCDOPEFQRGHSTIJUVKLWXABYARSBCTUDEVWFGXYHINOJKPQLDNOEFPQGHRSIJTUKLVWABXYCAQRBCSTDEUVFGWXHIYNJKOPLENOFGPQHIRSJKTULAVWBCXYDPABQRCDSTEFUVGHWXIJYNKLONFGOPHIQRJKSTLAUVBCWXDEYOABPQCDRSEFTUGHVWIJXYKLNTANGBUHOVCPIDWJQXERKFYLSANOBCPQDERSFGTUHIVWJKXYL"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim t as textinputStream
		  dim i,j as integer
		  dim s as string
		  dim d as date
		  dim check as boolean
		  dim ro as r0und
		  dim pl as player
		  dim gr as grade
		  dim ga as game
		  
		  if currenttournfile <> nil then
		    savetournfile
		  end if
		  while windowcount > 0
		    window(0).close
		  wend
		  redim gamelist(-1)
		  redim gradelist(-1)
		  redim playerlist(-1)
		  redim roundlist(-1)
		  currenttournfile = item
		  t = currenttournfile.openastextfile
		  tname = t.readline
		  if InStr(tname,"•") > 0 then
		    drawtype = val(right(tname,1))
		    tname = Left(tname,len(tname)-2)
		  else
		    drawtype = 0
		  end if
		  i = val(t.readline)
		  for j = 0 to i
		    ro = new r0und
		    ro.drawn = false
		    s = t.readline
		    check = ParseDate(s, d)
		    ro.rounddate = d
		    s = t.readline
		    if instr(s,"/") = 0 then
		      ro.spotprize = s
		      ro.drawtype = "RR"
		    else
		      ro.spotprize = left(s,instr(s,"/")-1)
		      ro.drawtype = right(s,len(s)-instr(s,"/"))
		    end if
		    ro.starttime = t.readline
		    roundlist.append ro
		  next
		  i = val(t.readline)
		  for j = 0 to i
		    pl = new player
		    pl.abbrname = t.readline
		    pl.club = t.readline
		    pl.fullname = t.readline
		    pl.grade = val(t.readline)
		    s = t.readline
		    if instr(s,"/") = 0 then
		      pl.realrating = val(s)
		      pl.sortrating = -1
		    else
		      pl.realrating = val(left(s,instr(s,"/")-1))
		      pl.sortrating = val(right(s,len(s)-instr(s,"/")))
		    end if
		    playerlist.append pl
		  next
		  i = val(t.readline)
		  for j = 0 to i
		    gr = new grade
		    gr.firsttable = val(t.readline)
		    gr.gradename = t.readline
		    gr.lasttable = val(t.readline)
		    gr.numplayers = val(t.readline)
		    gradelist.append gr
		  next
		  i = val(t.readline)
		  for j = 0 to i
		    ga = new game
		    ga.grade = val(t.readline)
		    ga.p1 = t.readline
		    ga.p1bonus = val(t.readline)
		    s = t.readline
		    if s = "false" or s = "" then
		      ga.p1attended = "Present"
		    elseif s = "true" then
		      ga.p1attended = "Excused"
		    else
		      ga.p1attended = s
		    end if
		    ga.p1score = val(t.readline)
		    ga.p2 = t.readline
		    ga.p2bonus = val(t.readline)
		    s = t.readline
		    if s = "false" or s = "" then
		      ga.p2attended = "Present"
		    elseif s = "true" then
		      ga.p2attended = "Excused"
		    else
		      ga.p2attended = s
		    end if
		    ga.p2score = val(t.readline)
		    s = t.readline
		    if s = "true" then
		      ga.played = true
		    else
		      ga.played = false
		    end if
		    if ga.p1 = "Bye " or ga.p2 = "Bye " then
		      ga.played = true
		    end if
		    if ga.p1attended <> "Present" or ga.p2attended <> "Present" then
		      ga.played = true
		    end if
		    ga.round = val(t.readline)
		    roundlist(ga.round).drawn = true
		    ga.table = val(t.readline)
		    gamelist.append ga
		  next
		  t.close
		  if ubound(gamelist) > -1 then
		    keepcheck = true
		    showcurrentround
		  else
		    keepcheck = false
		  end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AddCreateDraw() As Boolean Handles AddCreateDraw.Action
			dim playedcheck as boolean
			dim i as integer
			
			drawcheck = false
			if ubound(app.gamelist) > -1 then
			playedcheck = false
			for i = 0 to ubound(app.gamelist)
			if app.gamelist(i).played then
			playedcheck = true
			end if
			next
			if playedcheck then
			drawcheckstring = "Delete games already entered?"
			drawcheckdialog.showmodal
			else 
			if keepcheck then
			drawcheckstring = "Delete existing draw?"
			drawcheckdialog.showmodal
			else
			drawcheck = true
			end if
			end if
			else
			drawcheck = true
			end if
			if drawcheck then
			select case app.drawtype
			case 0
			RRdraw
			case 1
			MsgBox "SS"
			case 2
			TTdraw
			end Select
			end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function AddCreateDrawoldcode() As Boolean Handles AddCreateDrawoldcode.Action
			dim i,j,k,l,m,n,o,p,gpc,r as integer
			dim drawlist1(0),drawlist2(0),drawlist3(0),temp,templist(0) as string
			dim g as game
			dim playedcheck,shufflecheck as boolean
			
			drawcheck = false
			if ubound(app.gamelist) > -1 then
			playedcheck = false
			for i = 0 to ubound(app.gamelist)
			if app.gamelist(i).played then
			playedcheck = true
			end if
			next
			if playedcheck then
			drawcheckstring = "Delete games already entered?"
			drawcheckdialog.showmodal
			else 
			if keepcheck then
			drawcheckstring = "Delete existing draw?"
			drawcheckdialog.showmodal
			else
			drawcheck = true
			end if
			end if
			else
			drawcheck = true
			end if
			if drawcheck then
			redim app.gamelist(-1)
			gpc = 0
			for i=0 to ubound(app.gradelist)
			gpc = gpc + app.gradelist(i).numplayers
			next
			if gpc <> ubound(app.playerlist) + 1 then
			msgBox "Grade counts must equal player count."
			else
			for i = 0 to ubound(app.gradelist)
			if app.gradelist(i).numplayers mod 2 = 0 then
			if i = 0 then
			firstplayer = 0
			else
			firstplayer = firstplayer + app.gradelist(i-1).numplayers
			end if
			lastplayer = (firstplayer + app.gradelist(i).numplayers) - 1
			constantpdialog.showmodal
			if constantp = "[none]" then
			constantp = app.playerlist(firstplayer).abbrname
			shufflecheck = true
			else
			shufflecheck = false
			end if
			redim drawlist1((lastplayer-firstplayer)-1)
			redim templist(-1)
			for m=firstplayer to lastplayer
			if app.playerlist(m).abbrname <> constantp then
			templist.append app.playerlist(m).abbrname
			end if
			next
			for l=0 to ubound(drawlist1)
			r = floor(rnd*(ubound(templist)+1))
			drawlist1(l) = templist(r)
			templist.remove r
			next
			if ubound(app.roundlist) > (lastplayer-firstplayer)-1 then
			p = (lastplayer-firstplayer)-1
			while ubound(app.roundlist) > p
			p=p+(lastplayer-firstplayer)
			wend
			redim drawlist1(p)
			for o=0 to ubound(drawlist1)
			drawlist1(o) = drawlist1(o mod (lastplayer-firstplayer))
			next
			redim drawlist2(p)
			redim drawlist3(p)
			else
			redim drawlist2((lastplayer-firstplayer)-1)
			redim drawlist3((lastplayer-firstplayer)-1)
			end if
			for n=0 to ubound(drawlist1)
			drawlist2(n) = drawlist1(n)
			drawlist3(n) = drawlist1(n)
			next
			for j = app.gradelist(i).firsttable to app.gradelist(i).lasttable
			for k = 1 to ubound(app.roundlist)+1
			g = new game
			g.played = false
			g.grade = i +1
			g.table = j
			g.round = k
			if j = app.gradelist(i).firsttable then
			if g.round mod 2 = 0 then
			g.p2 = constantp
			g.p1 = drawlist3(k-1)
			else
			g.p1 = constantp
			g.p2 = drawlist3(k-1)
			end if
			else
			g.p1 = drawlist1(k-1)
			g.p2 = drawlist2(k-1)
			end if
			app.gamelist.append g
			next
			temp = drawlist1(0)
			drawlist1.remove 0
			drawlist1.append temp
			temp = drawlist2(ubound(drawlist2))
			drawlist2.remove ubound(drawlist2)
			drawlist2.insert 0,temp
			next
			if shufflecheck then
			shufflegrade(i)
			end if
			else
			if i = 0 then
			firstplayer = 0
			else
			firstplayer = firstplayer + app.gradelist(i-1).numplayers
			end if
			lastplayer = (firstplayer + app.gradelist(i).numplayers) - 1
			constantp = "Bye "
			redim drawlist1(lastplayer-firstplayer)
			redim drawlist2(lastplayer-firstplayer)
			redim drawlist3(lastplayer-firstplayer)
			redim templist(-1)
			for m=firstplayer to lastplayer
			templist.append app.playerlist(m).abbrname
			next
			for l=0 to ubound(drawlist1)
			r = floor(rnd*(ubound(templist)+1))
			drawlist1(l) = templist(r)
			templist.remove r
			next
			for n=0 to ubound(drawlist1)
			drawlist2(n) = drawlist1(n)
			drawlist3(n) = drawlist1(n)
			next
			for j = app.gradelist(i).firsttable-1 to app.gradelist(i).lasttable
			for k = 1 to ubound(app.roundlist)+1
			g = new game
			g.played = false
			g.grade = i +1
			g.round = k
			if j = app.gradelist(i).firsttable-1 then
			g.table = 0
			g.p1 = constantp
			g.p2 = drawlist3(k-1)
			g.played = true
			else
			g.table = j
			g.p1 = drawlist1(k-1)
			g.p2 = drawlist2(k-1)
			end if
			app.gamelist.append g
			next
			temp = drawlist1(0)
			drawlist1.remove 0
			drawlist1.append temp
			temp = drawlist2(ubound(drawlist2))
			drawlist2.remove ubound(drawlist2)
			drawlist2.insert 0,temp
			next
			end if
			next
			balance
			end if
			showcurrentround
			end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function AddGrade() As Boolean Handles AddGrade.Action
			gradedialog.gnumfield.text = str(ubound(app.gradelist)+2)
			gradedialog.gnamefield.text = chr(ubound(app.gradelist)+66)
			gradedialog.showmodal
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function AddPlayer() As Boolean Handles AddPlayer.Action
			playerdialog.playerid = -1
			playerdialog.showmodal
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function AddRound() As Boolean Handles AddRound.Action
			dim td as date
			
			td = new date
			if UBound(app.roundlist)<0 then
			rounddialog.dfield.Text = td.LongDate
			else
			rounddialog.dfield.Text = app.roundlist(UBound(app.roundlist)).rounddate.longdate
			end if
			rounddialog.gnfield.text = str(ubound(app.roundlist)+2)
			rounddialog.showmodal
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNew() As Boolean Handles FileNew.Action
			newtournfile(true)
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			opentournfile
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileQuit() As Boolean Handles FileQuit.Action
			dim t as textoutputStream
			
			savetournfile
			if currenttournfile <> nil then
			t=SpecialFolder.Preferences.child("nzts prefs").createtextFile
			t.writeline currenttournfile.absolutepath
			t.close
			end if
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRatingDump() As Boolean Handles FileRatingDump.Action
			dim d as new MessageDialog
			dim b as MessageDialogButton
			dim cr as string
			
			cr = EndOfLine
			d.Message = "Please click the 'Print/Save' button on the final round page, choose 'Save standings to text file', and send the contents of the text file to the NZ Scrabble News mailing list." + cr + "Then, when you have quit this program, please send the whole tournament file (Tournament Name.trn or similar) to the ratings officer."
			b=d.ShowModal
			
			'dim i,j as integer
			'dim f as folderItem
			'dim t as textoutputStream
			'dim wins,draws,losses,toplay as string
			'
			'f = getsaveFolderItem("text","")
			'if f <> nil then
			't = f.createtextFile
			'for i = 0 to ubound(app.playerlist)
			't.writeline "Player: " + app.playerlist(i).fullname
			'wins = "Wins:"
			'draws = "Draws:"
			'losses = "Losses:"
			'toplay = "To Play:"
			'for j=0 to ubound(app.gamelist)
			'if app.gamelist(j).p1 = app.playerlist(i).abbrname then
			'if app.gamelist(j).played = false then
			'if right(toplay,1)=":" then
			'toplay = toplay + " " + app.gamelist(j).p2
			'else
			'toplay = toplay + ", " + app.gamelist(j).p2
			'end if
			'else
			'if app.gamelist(j).p1score > app.gamelist(j).p2score  or app.gamelist(j).p2 = "Bye " then
			'if right(wins,1)=":" then
			'wins = wins + " " + app.gamelist(j).p2
			'else
			'wins = wins + ", " + app.gamelist(j).p2
			'end if
			'else
			'if app.gamelist(j).p1score = app.gamelist(j).p2score then
			'if right(draws,1)=":" then
			'draws = draws + " " + app.gamelist(j).p2
			'else
			'draws = draws + ", " + app.gamelist(j).p2
			'end if
			'else
			'if right(losses,1)=":" then
			'losses = losses + " " + app.gamelist(j).p2
			'else
			'losses = losses + ", " + app.gamelist(j).p2
			'end if
			'end if
			'end if
			'end if
			'end if
			'if app.gamelist(j).p2 = app.playerlist(i).abbrname then
			'if app.gamelist(j).played = false then
			'if right(toplay,1)=":" then
			'toplay = toplay + " " + app.gamelist(j).p1
			'else
			'toplay = toplay + ", " + app.gamelist(j).p1
			'end if
			'else
			'if app.gamelist(j).p2score > app.gamelist(j).p1score  or app.gamelist(j).p1 = "Bye " then
			'if right(wins,1)=":" then
			'wins = wins + " " + app.gamelist(j).p1
			'else
			'wins = wins + ", " + app.gamelist(j).p1
			'end if
			'else
			'if app.gamelist(j).p2score = app.gamelist(j).p1score then
			'if right(draws,1)=":" then
			'draws = draws + " " + app.gamelist(j).p1
			'else
			'draws = draws + ", " + app.gamelist(j).p1
			'end if
			'else
			'if right(losses,1)=":" then
			'losses = losses + " " + app.gamelist(j).p1
			'else
			'losses = losses + ", " + app.gamelist(j).p1
			'end if
			'end if
			'end if
			'end if
			'end if
			'next
			'if right(wins,1) <> ":" or right(draws,1) <> ":" or right(losses,1) <> ":" then
			't.writeline wins
			't.writeline draws
			't.writeline losses
			'end if
			'if right(toplay,1) <> ":" then
			't.writeline toplay
			'end if
			't.writeline ""
			'next
			't.close
			'end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
			newtournfile(false)
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileTableDraw() As Boolean Handles FileTableDraw.Action
			dim tdarray(0,0) as string
			dim f,g,h,i,j,k as integer
			dim e as folderItem
			dim t as textoutputStream
			
			e = getsaveFolderItem("text","td.txt")
			if e <> nil then
			t = e.createtextFile
			for i = 0 to ubound(gradelist)
			j = (gradelist(i).numplayers-1)/2
			k = ubound(roundlist)*2+1
			redim tdarray(j,k)
			for h=0 to ubound(gamelist)
			if gamelist(h).grade = i+1 then
			if gamelist(h).table = 0 then
			tdarray(j-1,(gamelist(h).round-1)*2) = gamelist(h).p1
			tdarray(j-1,(gamelist(h).round-1)*2+1) = gamelist(h).p2
			else
			tdarray(gamelist(h).table-gradelist(i).firsttable,(gamelist(h).round-1)*2) = gamelist(h).p1
			tdarray(gamelist(h).table-gradelist(i).firsttable,(gamelist(h).round-1)*2+1) = gamelist(h).p2
			end if
			end if
			next
			for g=0 to k
			for f=0 to j
			t.write tdarray(f,g)
			if f<>j then
			t.write chr(9)
			else
			t.writeline ""
			end if
			next
			next
			t.writeline ""
			next
			keepcheck = true
			end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ImportPlayers() As Boolean Handles ImportPlayers.Action
			dim f as folderItem
			dim t as textinputStream
			dim s,abn,u as string
			dim i as integer
			dim p as player
			dim anck as Boolean
			
			f = getopenFolderItem("text")
			if f <> nil then
			t = f.openastextFile
			while not t.eof
			s = t.readline
			abn = nthField(s,chr(9),2)
			anck = true
			if abn = "" then
			anck  = false
			else
			for i = 0 to UBound(app.playerlist)
			if abn = app.playerlist(i).abbrname then
			anck = false
			end if
			next
			end if
			if anck then
			p = new player
			p.fullname = nthField(s,chr(9),1)
			p.abbrname = nthField(s,chr(9),2)
			p.club = nthField(s,chr(9),3)
			u = nthField(s,chr(9),4)
			if instr(u,"/") = 0 then
			p.realrating = val(u)
			p.sortrating = -1
			else
			p.realrating = val(left(u,instr(u,"/")-1))
			p.sortrating = val(right(u,len(u)-instr(u,"/")))
			end if
			app.playerlist.append p
			end if
			wend
			t.close
			app.resortplayers
			end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowClose() As Boolean Handles WindowClose.Action
			window(0).close
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowCurrentRound() As Boolean Handles WindowCurrentRound.Action
			showcurrentround
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowGrades() As Boolean Handles WindowGrades.Action
			gradewindow.Close
			gradewindow.show
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowPlayers() As Boolean Handles WindowPlayers.Action
			resortplayers
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowRounds() As Boolean Handles WindowRounds.Action
			roundwindow.Close
			roundwindow.show
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowTournament() As Boolean Handles WindowTournament.Action
			newtourndialog.showmodal
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub balance()
		  dim i,j,p,p1n,p2n as integer
		  dim temp as string
		  
		  for i=0 to ubound(gamelist)
		    if not(gamelist(i).played) then
		      for j=0 to ubound(playerlist)
		        if playerlist(j).abbrname = gamelist(i).p1 then
		          p1n = j
		        end if
		        if playerlist(j).abbrname = gamelist(i).p2 then
		          p2n = j
		        end if
		      next
		      p = abs(p1n mod 2 - p2n mod 2)
		      if p = 0 then
		        if p1n > p2n then
		          temp = gamelist(i).p1
		          gamelist(i).p1 = gamelist(i).p2
		          gamelist(i).p2 = temp
		        end if
		      else
		        if p2n > p1n then
		          temp = gamelist(i).p1
		          gamelist(i).p1 = gamelist(i).p2
		          gamelist(i).p2 = temp
		        end if
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function flipstarts(s as string) As String
		  dim r as string
		  dim i as integer
		  
		  r = ""
		  for i = 2 to len(s) step 2
		    r = r + mid(s,i,1) + mid(s,i-1,1)
		  next i
		  return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub newtournfile(newtourn as boolean)
		  dim check as Boolean
		  dim d as date
		  dim f as folderItem
		  dim g as grade
		  dim h as R0und
		  dim i,j as integer
		  dim savecheck as boolean
		  
		  if currenttournfile <> nil then
		    savetournfile
		  end if
		  ntfcancheck = false
		  newtournapp = newtourn
		  newtourndialog.showmodal
		  if ntfcancheck then
		    f = getsaveFolderItem("tournamentfile",tname+".trn")
		    if f<> nil then
		      currenttournfile = f
		      if newtourn then
		        while windowcount > 0
		          window(0).close
		        wend
		        redim gamelist(-1)
		        redim gradelist(-1)
		        redim playerlist(-1)
		        redim roundlist(-1)
		        if drawtype = 2 then
		          g = new grade
		          g.gradename = "TT"
		          g.numplayers = 24
		          g.firsttable = 1
		          g.lasttable = 12
		          app.gradelist.append g
		          for i = 1 to 3
		            for j = 1 to 8
		              h = new R0und
		              if j > 4 then
		                h.starttime = str(j-4)+".30"
		              else
		                h.starttime = str(j+8)+".00"
		              end if
		              h.spotprize = "-"
		              check = ParseDate(str(i+13)+"/8/2010", d)
		              if check then
		                h.rounddate = d
		              end if
		              app.roundlist.append h
		            next
		          next
		        end if
		        keepcheck = false
		      end if
		    else
		      if currenttournfile = nil then
		        nofiledialog.showmodal
		      end if
		    end if
		  else
		    if currenttournfile = nil then
		      nofiledialog.showmodal
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub opentournfile()
		  dim f as folderItem
		  
		  f = getopenFolderItem("tournamentfile")
		  if f<>nil then
		    #if targetmacOS then
		      if f.maccreator = "NZTS" then
		        opendocument(f)
		      else
		        if currenttournfile = nil then
		          nofiledialog.showmodal
		        end if
		      end if
		    #else
		      if right(f.name,4)=".trn" then
		        opendocument(f)
		      else
		        if currenttournfile = nil then
		          nofiledialog.showmodal
		        end if
		      end if
		    #endif
		  else
		    if currenttournfile = nil then
		      nofiledialog.showmodal
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resortplayers()
		  dim i as integer
		  dim p as player
		  
		  if not(playerwindow.Visible) then
		    playerwindow.height = screen(0).height - 65
		  end if
		  playerwindow.playerlist.columnalignment(3) = 4
		  playerwindow.playerlist.columnalignmentoffset(3) = -24
		  playerwindow.playerlist.DeleteAllRows
		  for i=0 to ubound(playerlist)
		    playerwindow.playerlist.addrow playerlist(i).fullname
		    playerwindow.playerlist.cell(i,1) = playerlist(i).abbrname
		    playerwindow.playerlist.cell(i,2) = playerlist(i).club
		    playerwindow.playerlist.cell(i,3) = str(playerlist(i).realrating)
		    playerwindow.playerlist.cell(i,4) = str(playerlist(i).sortrating)
		    if playerlist(i).sortrating = - 1 then
		      playerwindow.playerlist.cell(i,5) = format(5000-playerlist(i).realrating,"0000.000")
		    else
		      playerwindow.playerlist.cell(i,5) = format(5000-playerlist(i).sortrating,"0000.000")
		    end if
		  next
		  playerwindow.playerlist.headingindex = 5
		  playerwindow.Title = "Player List (" + str(playerwindow.playerlist.ListCount) + ")"
		  redim playerlist(-1)
		  for i = 0 to playerwindow.playerlist.ListCount-1
		    p = new player
		    p.fullname = playerwindow.playerlist.cell(i,0)
		    p.abbrname = playerwindow.playerlist.cell(i,1)
		    p.club = playerwindow.playerlist.cell(i,2)
		    p.realrating = val(playerwindow.playerlist.cell(i,3))
		    p.sortrating = val(playerwindow.playerlist.cell(i,4))
		    playerlist.append p
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RRdraw()
		  dim gpc,i,j,k,l,m,constantptable,drawnum,movetable,movebyetable,partial,wholes as integer
		  dim drawstring as string
		  dim g as game
		  dim cpbye,preached,shufflecheck as boolean
		  dim plist(0) as string
		  
		  redim app.gamelist(-1)
		  gpc = 0
		  for i=0 to ubound(app.gradelist)
		    gpc = gpc + app.gradelist(i).numplayers
		  next
		  if gpc <> ubound(app.playerlist) + 1 then
		    msgBox "Grade counts must equal player count."
		  else
		    coinflipdialog.showmodal
		    for i = 0 to ubound(app.gradelist)
		      if i = 0 then
		        firstplayer = 0
		      else
		        firstplayer = firstplayer + app.gradelist(i-1).numplayers
		      end if
		      lastplayer = (firstplayer + app.gradelist(i).numplayers) - 1
		      redim plist(-1)
		      for l = firstplayer to lastplayer
		        plist.append playerlist(l).abbrname
		      next
		      if (lastplayer-firstplayer) mod 2 = 0 then
		        plist.append "Bye "
		      end if
		      constantpdialog.showmodal
		      drawnum = floor((app.gradelist(i).numplayers+1)/2)
		      partial = (ubound(app.roundlist)+1) mod (drawnum*2-1)
		      if partial = 0 then
		        drawstring = ""
		        wholes = (ubound(app.roundlist)+1) \ (drawnum*2-1)
		        for l = 1 to wholes
		          if l mod 2 = 0 then
		            drawstring = drawstring + flipstarts(app.drawstring(drawnum))
		          else
		            drawstring = drawstring + app.drawstring(drawnum)
		          end if
		        next
		      else
		        drawstring = right(app.drawstring(drawnum),partial*drawnum*2)
		        wholes = (ubound(app.roundlist)+1) \ (drawnum*2-1)
		        for l = 1 to wholes
		          if l mod 2 = 0 then
		            drawstring = drawstring + app.drawstring(drawnum)
		          else
		            drawstring = drawstring + flipstarts(app.drawstring(drawnum))
		          end if
		        next
		      end if
		      if app.coinflip then
		        drawstring = flipstarts(drawstring)
		      end if
		      constantptable = 0
		      for m = 0 to UBound(plist)
		        if constantp = plist(m) then
		          constantptable = app.gradelist(i).firsttable + m / 2
		        end if
		      next
		      if constantptable > app.gradelist(i).lasttable then
		        constantptable = app.gradelist(i).lasttable
		      end if
		      for k = 1 to ubound(app.roundlist)+1
		        movetable = 0
		        preached = false
		        if (lastplayer-firstplayer) mod 2 = 0 then
		          movebyetable = 1
		          cpbye = false
		          for j = app.gradelist(i).firsttable-1 to app.gradelist(i).lasttable
		            g = new game
		            g.p1 = plist(asc(mid(drawstring,(k-1)*drawnum*2+((j+1)-app.gradelist(i).firsttable)*2+1,1))-65)
		            if g.p1 = "Bye " then
		              g.p1attended = "Excused"
		            end if
		            g.p2 = plist(asc(mid(drawstring,(k-1)*drawnum*2+((j+1)-app.gradelist(i).firsttable)*2+2,1))-65)
		            if g.p2 = "Bye " then
		              g.p2attended = "Excused"
		            end if
		            if g.p1 = "Bye " and g.p2 = constantp then
		              cpbye = true
		            end if
		            if g.p2 = "Bye " and g.p1 = constantp then
		              cpbye = true
		            end if
		          next
		          for j = app.gradelist(i).firsttable-1 to app.gradelist(i).lasttable
		            g = new game
		            g.played = false
		            g.grade = i +1
		            g.round = k
		            g.p1 = plist(asc(mid(drawstring,(k-1)*drawnum*2+((j+1)-app.gradelist(i).firsttable)*2+1,1))-65)
		            if g.p1 = "Bye " then
		              g.p1attended = "Excused"
		            end if
		            g.p2 = plist(asc(mid(drawstring,(k-1)*drawnum*2+((j+1)-app.gradelist(i).firsttable)*2+2,1))-65)
		            if g.p2 = "Bye " then
		              g.p2attended = "Excused"
		            end if
		            if g.p1 = "Bye " or g.p2 = "Bye " then
		              g.played = true
		              g.table = 0
		              movebyetable = 0
		            else
		              if not(preached) then
		                if (j + movebyetable) = constantptable and not(cpbye) then
		                  movetable = movetable + 1
		                end if
		              end if
		              g.table = j + movebyetable + movetable
		              if g.p1 = constantp or g.p2 = constantp then
		                g.table = constantptable
		                movetable = movetable - 1
		                preached = true
		                if (j + movebyetable) = constantptable then
		                  movetable = movetable - 1
		                end if
		              end if
		              if preached then
		                if (j + movebyetable) = constantptable then
		                  movetable = movetable + 1
		                end if
		              end if
		            end if
		            app.gamelist.append g
		          next
		        else
		          for j = app.gradelist(i).firsttable to app.gradelist(i).lasttable
		            g = new game
		            g.played = false
		            g.grade = i +1
		            g.round = k
		            g.p1 = plist(asc(mid(drawstring,(k-1)*drawnum*2+(j-app.gradelist(i).firsttable)*2+1,1))-65)
		            g.p2 = plist(asc(mid(drawstring,(k-1)*drawnum*2+(j-app.gradelist(i).firsttable)*2+2,1))-65)
		            if not(preached) then
		              if j = constantptable then
		                movetable = movetable + 1
		              end if
		            end if
		            g.table = j + movetable
		            if g.p1 = constantp or g.p2 = constantp then
		              g.table = constantptable
		              movetable = movetable - 1
		              preached = true
		              if j = constantptable then
		                movetable = movetable - 1
		              end if
		            end if
		            if preached then
		              if j = constantptable then
		                movetable = movetable + 1
		              end if
		            end if
		            app.gamelist.append g
		          next
		        end if
		      next
		    next
		  end if
		  showcurrentround
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub savetournfile()
		  'define schema for SQLite
		  
		  dim i as integer
		  dim t as textoutputStream
		  
		  if currenttournfile <> nil then
		    t = currenttournfile.createtextfile
		    #if targetmacOS then
		      currenttournfile.maccreator = "NZTS"
		    #else
		      if right(currenttournfile.name,4) <>".trn" then
		        currenttournfile.name = currenttournfile.name + ".trn"
		      end if
		    #endif
		    t.writeline tname + "•" + str(drawtype)
		    t.writeline str(ubound(roundlist))
		    for i=0 to ubound(roundlist)
		      t.writeline roundlist(i).rounddate.longdate
		      t.writeline roundlist(i).spotprize + "/" + roundlist(i).drawtype
		      t.writeline roundlist(i).starttime
		    next
		    t.writeline str(ubound(playerlist))
		    for i=0 to ubound(playerlist)
		      t.writeline playerlist(i).abbrname
		      t.writeline playerlist(i).club
		      t.writeline playerlist(i).fullname
		      t.writeline str(playerlist(i).grade)
		      if playerlist(i).sortrating > -1 then
		        t.writeline str(playerlist(i).realrating)+"/"+str(playerlist(i).sortrating)
		      else
		        t.writeline str(playerlist(i).realrating)
		      end if
		    next
		    t.writeline str(ubound(gradelist))
		    for i=0 to ubound(gradelist)
		      t.writeline str(gradelist(i).firsttable)
		      t.writeline gradelist(i).gradename
		      t.writeline str(gradelist(i).lasttable)
		      t.writeline str(gradelist(i).numplayers)
		    next
		    t.writeline str(ubound(gamelist))
		    for i=0 to ubound(gamelist)
		      t.writeline str(gamelist(i).grade)
		      t.writeline gamelist(i).p1
		      t.writeline str(gamelist(i).p1bonus)
		      t.writeline gamelist(i).p1attended
		      t.writeline str(gamelist(i).p1score)
		      t.writeline gamelist(i).p2
		      t.writeline str(gamelist(i).p2bonus)
		      t.writeline gamelist(i).p2attended
		      t.writeline str(gamelist(i).p2score)
		      if gamelist(i).played then
		        t.writeline "true"
		      else
		        t.writeline "false"
		      end if
		      t.writeline str(gamelist(i).round)
		      t.writeline str(gamelist(i).table)
		    next
		    t.close
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showcurrentround()
		  dim i,round as integer
		  
		  round = ubound(roundlist)+1
		  for i=0 to ubound(gamelist)
		    if gamelist(i).played = false then
		      if gamelist(i).round < round then
		        round = gamelist(i).round
		      end if
		    end if
		  next
		  currentroundwindow.round = round
		  currentroundwindow.title = "Round " + str(currentroundwindow.round)
		  if currentroundwindow.round = 1 then
		    currentroundwindow.prevbutton.enabled = false
		  else
		    currentroundwindow.prevbutton.enabled = true
		  end if
		  if currentroundwindow.round = ubound(roundlist)+1 then
		    currentroundwindow.nextbutton.enabled = false
		  else
		    currentroundwindow.nextbutton.enabled = true
		  end if
		  currentroundwindow.width = screen(0).width - 13
		  currentroundwindow.height = screen(0).height - 49
		  currentroundwindow.left = 6
		  currentroundwindow.top = 42
		  currentroundwindow.refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub shufflegrade(grade as integer)
		  dim i,j,k,l,temp as integer
		  dim rtt(0) as integer
		  dim ttt(0,0) as integer
		  
		  redim rtt(ubound(roundlist))
		  for i=0 to ubound(roundlist)
		    rtt(i) = i
		  next
		  for i=1 to 50
		    j = floor(rnd*ubound(roundlist))
		    k = floor(rnd*ubound(roundlist))
		    temp = rtt(j)
		    rtt(j) = rtt(k)
		    rtt(k) = temp
		  next
		  for i = 0 to ubound(gamelist)
		    if gamelist(i).grade = grade+1 then
		      gamelist(i).round = rtt(gamelist(i).round-1)+1
		    end if
		  next
		  redim ttt(ubound(roundlist),gradelist(grade).lasttable - gradelist(grade).firsttable)
		  for i = 0 to ubound(roundlist)
		    for j = 0 to gradelist(grade).lasttable - gradelist(grade).firsttable
		      ttt(i,j) = j + gradelist(grade).firsttable
		    next
		  next
		  for i = 0 to ubound(roundlist)
		    for l=1 to 50
		      j = floor(rnd*(1+gradelist(grade).lasttable - gradelist(grade).firsttable))
		      k = floor(rnd*(1+gradelist(grade).lasttable - gradelist(grade).firsttable))
		      temp = ttt(i,j)
		      ttt(i,j) = ttt(i,k)
		      ttt(i,k) = temp
		    next
		  next
		  for i = 0 to ubound(gamelist)
		    if gamelist(i).grade = grade+1 then
		      gamelist(i).table = ttt(gamelist(i).round-1,gamelist(i).table-gradelist(grade).firsttable)
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TTdraw()
		  dim i,j,k,l as integer
		  dim g as game
		  dim drawstring as string
		  dim plist(0) as string
		  
		  redim app.gamelist(-1)
		  if ubound(app.playerlist) <> 23 then
		    msgBox "Player count must be 24."
		  else
		    coinflipdialog.showmodal
		    for i = 0 to ubound(app.gradelist)
		      redim plist(-1)
		      for l = 0 to 11
		        plist.append playerlist(l).abbrname
		      next
		      plist.Append ""
		      for l = 12 to 23
		        plist.append playerlist(l).abbrname
		      next
		      drawstring = app.ttdrawstring + flipstarts(app.ttdrawstring)
		      if app.coinflip then
		        drawstring = flipstarts(drawstring)
		      end if
		      for k = 1 to ubound(app.roundlist)+1
		        for j = app.gradelist(i).firsttable to app.gradelist(i).lasttable
		          g = new game
		          g.played = false
		          g.grade = i +1
		          g.round = k
		          g.p1 = plist(asc(mid(drawstring,(k-1)*24+(j-app.gradelist(i).firsttable)*2+1,1))-65)
		          g.p2 = plist(asc(mid(drawstring,(k-1)*24+(j-app.gradelist(i).firsttable)*2+2,1))-65)
		          g.table = j
		          app.gamelist.append g
		        next
		      next
		    next
		  end if
		  showcurrentround
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		coinflip As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		constantp As string
	#tag EndProperty

	#tag Property, Flags = &h0
		currenttournfile As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		drawcheck As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		drawcheckstring As string
	#tag EndProperty

	#tag Property, Flags = &h0
		drawstring(13) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		drawtype As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		epsonlandscape As string
	#tag EndProperty

	#tag Property, Flags = &h0
		epsonportrait As string
	#tag EndProperty

	#tag Property, Flags = &h0
		firstplayer As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		gamelist(0) As game
	#tag EndProperty

	#tag Property, Flags = &h0
		gradelist(0) As grade
	#tag EndProperty

	#tag Property, Flags = &h0
		keepcheck As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		lastplayer As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		newtname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		newtournapp As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ntfcancheck As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		playerlist(0) As player
	#tag EndProperty

	#tag Property, Flags = &h0
		roundlist(0) As r0und
	#tag EndProperty

	#tag Property, Flags = &h0
		tname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ttdrawstring As string
	#tag EndProperty

	#tag Property, Flags = &h0
		wwdrawstring(13) As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="coinflip"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="constantp"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="drawcheck"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="drawcheckstring"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="drawtype"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="epsonlandscape"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="epsonportrait"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="firstplayer"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="keepcheck"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastplayer"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="newtname"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="newtournapp"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ntfcancheck"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tname"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ttdrawstring"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
