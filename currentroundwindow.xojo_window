#tag Window
Begin Window currentroundwindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   721
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "View Round"
   Visible         =   True
   Width           =   1016
   Begin PushButton prevbutton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Previous"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton nextbutton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Next"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   923
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton printsavebutton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Print/Save"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   439
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   13
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  return true
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  dim i,j,xx,yy as integer
		  
		  xx = x + 40
		  xx = xx/80
		  yy = y + 20
		  yy = yy/60
		  for i = 0 to ubound(app.gamelist)
		    if app.gamelist(i).round = round then
		      if yy = app.gamelist(i).grade and xx = app.gamelist(i).table - app.gradelist(app.gamelist(i).grade-1).firsttable + 1 then
		        if app.gamelist(i).played then
		          gamedialog.p1.text = app.gamelist(i).p1
		          gamedialog.p2.text = app.gamelist(i).p2
		          gamedialog.p1.text = app.gamelist(i).p1
		          gamedialog.p2.text = app.gamelist(i).p2
		          gamedialog.p1score.text = str(app.gamelist(i).p1score)
		          if gamedialog.p1score.text = "0" then
		            gamedialog.p1score.text = ""
		          end if
		          gamedialog.p2score.text = str(app.gamelist(i).p2score)
		          gamedialog.p1bonus.text = str(app.gamelist(i).p1bonus)
		          gamedialog.p2bonus.text = str(app.gamelist(i).p2bonus)
		          for j=0 to 2
		            if gamedialog.P1Attend(j).Caption = app.gamelist(i).p1attended then
		              gamedialog.P1Attend(j).Value = true
		            else
		              gamedialog.P1Attend(j).Value = false
		            end if
		            if gamedialog.P2Attend(j).Caption = app.gamelist(i).p2attended then
		              gamedialog.P2Attend(j).Value = true
		            else
		              gamedialog.P2Attend(j).Value = false
		            end if
		          next
		        else
		          orderdialog.noswapbutton.caption = app.gamelist(i).p1
		          orderdialog.noswapbutton.caption = orderdialog.noswapbutton.caption + chr(13) + app.gamelist(i).p2
		          orderdialog.swapbutton.caption = app.gamelist(i).p2
		          orderdialog.swapbutton.caption = orderdialog.swapbutton.caption + chr(13) + app.gamelist(i).p1
		          orderdialog.showmodal
		          if swap then
		            gamedialog.p1.text = app.gamelist(i).p2
		            gamedialog.p2.text = app.gamelist(i).p1
		            gamedialog.p1score.text = str(app.gamelist(i).p2score)
		            if gamedialog.p1score.text = "0" then
		              gamedialog.p1score.text = ""
		            end if
		            gamedialog.p2score.text = str(app.gamelist(i).p1score)
		            gamedialog.p1bonus.text = str(app.gamelist(i).p2bonus)
		            gamedialog.p2bonus.text = str(app.gamelist(i).p1bonus)
		            for j=0 to 2
		              if gamedialog.P1Attend(j).Caption = app.gamelist(i).p2attended then
		                gamedialog.P1Attend(j).Value = true
		              else
		                gamedialog.P1Attend(j).Value = false
		              end if
		              if gamedialog.P2Attend(j).Caption = app.gamelist(i).p1attended then
		                gamedialog.P2Attend(j).Value = true
		              else
		                gamedialog.P2Attend(j).Value = false
		              end if
		            next
		          else
		            gamedialog.p1.text = app.gamelist(i).p1
		            gamedialog.p2.text = app.gamelist(i).p2
		            gamedialog.p1score.text = str(app.gamelist(i).p1score)
		            if gamedialog.p1score.text = "0" then
		              gamedialog.p1score.text = ""
		            end if
		            gamedialog.p2score.text = str(app.gamelist(i).p2score)
		            gamedialog.p1bonus.text = str(app.gamelist(i).p1bonus)
		            gamedialog.p2bonus.text = str(app.gamelist(i).p2bonus)
		            for j=0 to 2
		              if gamedialog.P1Attend(j).Caption = app.gamelist(i).p1attended then
		                gamedialog.P1Attend(j).Value = true
		              else
		                gamedialog.P1Attend(j).Value = false
		              end if
		              if gamedialog.P2Attend(j).Caption = app.gamelist(i).p2attended then
		                gamedialog.P2Attend(j).Value = true
		              else
		                gamedialog.P2Attend(j).Value = false
		              end if
		            next
		          end if
		        end if
		        gamedialog.gradelabel.text = app.gradelist(app.gamelist(i).grade-1).gradename + " " + "grade"
		        gamedialog.gamelabel.text = "Game" + " " + str(app.gamelist(i).round)
		        gamedialog.tablelabel.text = "Table" + " " + str(app.gamelist(i).table)
		        gamedialog.gameindex = i
		        gamedialog.showmodal
		      end if
		    end if
		  next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim i,j as integer
		  
		  for i=0 to ubound(app.gamelist)
		    for j = 0 to ubound(app.playerlist)
		      if app.playerlist(j).abbrname = app.gamelist(i).p1 then
		        app.playerlist(j).grade = app.gamelist(i).grade
		      end if
		      if app.playerlist(j).abbrname = app.gamelist(i).p2 then
		        app.playerlist(j).grade = app.gamelist(i).grade
		      end if
		    next
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim i,j as integer
		  dim ch as boolean
		  
		  
		  for i=0 to ubound(app.gradelist)
		    g.TextSize=10
		    g.foreColor = rgb(0,0,127)
		    for j = app.gradelist(i).firsttable to app.gradelist(i).lasttable
		      g.drawstring str(j),(j-app.gradelist(i).firsttable)*80+60,i*60+55
		    next
		    g.TextSize=12
		    g.foreColor = rgb(0,0,255)
		    g.drawstring chr(i+65),20,i*60+80
		  next
		  ch = true
		  for i=0 to ubound(app.gamelist)
		    if app.gamelist(i).round = round then
		      if app.gamelist(i).table > 0 then
		        if app.gamelist(i).played then
		          g.foreColor = rgb(0,0,0)
		        else
		          ch = false
		          g.foreColor = rgb(255,0,0)
		        end if
		        g.drawstring app.gamelist(i).p1,(app.gamelist(i).table - app.gradelist(app.gamelist(i).grade-1).firsttable)*80+40, app.gamelist(i).grade*60+10
		        g.drawstring app.gamelist(i).p2,(app.gamelist(i).table - app.gradelist(app.gamelist(i).grade-1).firsttable)*80+40, app.gamelist(i).grade*60+30
		      end if
		    end if
		  next
		  printsavebutton.left = width/2 - 35
		  if ch then
		    printsavebutton.enabled = true
		  else
		    printsavebutton.enabled = false
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub exporttou()
		  dim f as folderItem
		  dim t as textoutputStream
		  dim i,j,k as Integer
		  
		  f = getsaveFolderItem("text","10tt.tou")
		  if f <> nil then
		    t = f.createtextfile
		    t.Delimiter = chr(10)
		    t.Write "*M"+str(app.roundlist(round-1).rounddate.day)+"."+format(app.roundlist(round-1).rounddate.month,"00")+"."+str(app.roundlist(round-1).rounddate.year)
		    t.writeline app.tname
		    t.WriteLine "*AUS:NZ"
		    t.WriteLine "                                    000"
		    for i=0 to UBound(app.playerlist)
		      t.Write app.playerlist(i).fullname
		      for j=1 to 20-len(app.playerlist(i).fullname)
		        t.Write " "
		      next
		      for k = 0 to UBound(app.playerlist(i).tou)
		        t.write " "
		        if app.playerlist(i).tou(k).result = 0 then
		          t.Write " "
		        else
		          t.Write str(app.playerlist(i).tou(k).result)
		        end if
		        t.Write format(app.playerlist(i).tou(k).score,"000")
		        if app.playerlist(i).tou(k).opponent < 10 then
		          if app.playerlist(i).tou(k).start then
		            t.Write "  +"
		          else
		            t.Write "   "
		          end if
		        else
		          if app.playerlist(i).tou(k).start then
		            t.write " +"
		          else
		            t.write "  "
		          end if
		        end if
		         t.write str(app.playerlist(i).tou(k).opponent)
		      next
		      t.WriteLine ""
		    next
		    t.WriteLine "*** END OF FILE ***"
		    t.close
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub printgrades()
		  dim ps as printerSetup
		  dim page as graphics
		  dim hin,hispread,k,m,n,playeroffset,playerpos as integer
		  dim tempplayers(0) as player
		  dim hiwins as double
		  dim hiname as string
		  
		  ps = new printersetup
		  if ps.pagesetupDialog then
		    page = openprinterdialog(ps)
		    if page <> nil then
		      for k = 0 to ubound(app.gradelist)
		        page.textfont="Times"
		        page.textsize=36
		        page.bold = true
		        page.drawstring app.tname,30,50
		        page.textsize = 24
		        page.drawstring app.roundlist(round-1).rounddate.longdate,30,80
		        page.bold = false
		        page.textsize = 36
		        page.drawstring app.gradelist(k).gradename+" Grade after Game "+str(round),100,160
		        page.textsize = 24
		        redim tempplayers(-1)
		        for m = 0 to ubound(app.playerlist)
		          if app.playerlist(m).grade = k+1 and app.playerlist(m).abbrname <> "Bye " and app.playerlist(m).played > 0 then
		            tempplayers.append app.playerlist(m)
		          end if
		        next
		        page.bold = true
		        page.drawstring "Pos.",0,220
		        page.drawstring "Name",70,220
		        page.drawstring "Wins",220,220
		        page.drawstring "Spread",300,220
		        page.drawstring "Bonus Words",400,220
		        page.bold = false
		        page.textsize = 20
		        playeroffset = 225
		        playerpos = 0
		        while ubound(tempplayers) > -1
		          playerpos = playerpos + 1
		          playeroffset = playeroffset + 20
		          hin = -1
		          hiwins = -1
		          hispread = -20000
		          hiname = "ZZZ"
		          for n=0 to ubound(tempplayers)
		            if tempplayers(n).wins > hiwins then
		              hiwins = tempplayers(n).wins
		              hispread = tempplayers(n).spread
		              hiname = tempplayers(n).abbrname
		              hin = n
		            else
		              if tempplayers(n).wins = hiwins then
		                if tempplayers(n).spread > hispread then
		                  hispread = tempplayers(n).spread
		                  hiname = tempplayers(n).abbrname
		                  hin = n
		                else
		                  if tempplayers(n).spread = hispread then
		                    if tempplayers(n).abbrname < hiname then
		                      hiname = tempplayers(n).abbrname
		                      hin=n
		                    end if
		                  end if
		                end if
		              end if
		            end if
		          next
		          page.drawstring str(playerpos),0,playeroffset
		          page.drawstring tempplayers(hin).abbrname,70,playeroffset
		          page.drawstring str(tempplayers(hin).wins),270-page.stringwidth(str(tempplayers(hin).wins)),playeroffset
		          page.drawstring str(tempplayers(hin).spread),375-page.stringwidth(str(tempplayers(hin).spread)),playeroffset
		          page.drawstring str(tempplayers(hin).bonus),480-page.stringwidth(str(tempplayers(hin).bonus)),playeroffset
		          tempplayers.remove hin
		        wend
		        playeroffset=playeroffset+25
		        page.drawstring "High Game: " + str(app.gradelist(k).hg) + " - " + app.gradelist(k).hgn,0,playeroffset
		        playeroffset=playeroffset+20
		        page.drawstring "High Aggregate Game: " + str(app.gradelist(k).ha) + " - " + app.gradelist(k).han,0,playeroffset
		        playeroffset=playeroffset+20
		        page.drawstring "High Winning Margin: " + str(app.gradelist(k).hm) + " - " + app.gradelist(k).hmn,0,playeroffset
		        if k <> ubound(app.gradelist) then
		          page.nextPage
		        end if
		      next
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub printpage()
		  dim ps as printerSetup
		  dim page as graphics
		  dim hin,hispread,k,m,n,playeroffsetx,playeroffsety,playerpos as integer
		  dim tempplayers(0) as player
		  dim hiwins as double
		  dim dstring,hiname as string
		  dim c as double
		  
		  ps = new printersetup
		  if ps.pagesetupDialog then
		    page = openprinterdialog(ps)
		    if page <> nil then
		      MsgBox str(ubound(app.playerlist))
		      
		      
		      if ubound(app.gradelist) < 2 then
		        c = 2
		      else
		        c = 1
		      end if
		      
		      
		      page.textfont="Times"
		      page.textsize=21
		      page.bold = true
		      page.drawstring app.tname,30,18
		      page.textsize = 15
		      dstring = app.roundlist(0).rounddate.longdate
		      if dstring <> app.roundlist(ubound(app.roundlist)).rounddate.longdate then
		        dstring = dstring + " - " + app.roundlist(ubound(app.roundlist)).rounddate.longdate
		      end if
		      page.drawstring dstring,30,34
		      playeroffsetx = 5 * c
		      playeroffsety = 36
		      for k = 0 to ubound(app.gradelist)
		        page.bold = true
		        page.textsize = 14
		        playeroffsety = playeroffsety+15*c
		        page.drawstring app.gradelist(k).gradename+" Grade",playeroffsetx,playeroffsety
		        page.textsize = 10*c
		        redim tempplayers(-1)
		        for m = 0 to ubound(app.playerlist)
		          if app.playerlist(m).grade = k+1 and app.playerlist(m).abbrname <> "Bye " and app.playerlist(m).played > 0 then
		            tempplayers.append app.playerlist(m)
		          end if
		        next
		        playeroffsety = playeroffsety + 11*c
		        page.bold = true
		        page.drawstring "Name",playeroffsetx + 17*c,playeroffsety
		        page.drawstring "Club",playeroffsetx + 110*c,playeroffsety
		        page.drawstring "Wins",playeroffsetx + 145*c,playeroffsety
		        page.drawstring "Spread",playeroffsetx + 180*c,playeroffsety
		        page.drawstring "Ave",playeroffsetx + 218*c,playeroffsety
		        page.drawstring "B/W",playeroffsetx + 245*c,playeroffsety
		        page.bold = false
		        playerpos = 0
		        while ubound(tempplayers) > -1
		          playerpos = playerpos + 1
		          playeroffsety = playeroffsety + 11*c
		          hin = -1
		          hiwins = -1
		          hispread = -20000
		          hiname = "ZZZ"
		          for n=0 to ubound(tempplayers)
		            if tempplayers(n).wins > hiwins then
		              hiwins = tempplayers(n).wins
		              hispread = tempplayers(n).spread
		              hiname = tempplayers(n).abbrname
		              hin = n
		            else
		              if tempplayers(n).wins = hiwins then
		                if tempplayers(n).spread > hispread then
		                  hispread = tempplayers(n).spread
		                  hiname = tempplayers(n).abbrname
		                  hin = n
		                else
		                  if tempplayers(n).spread = hispread then
		                    if tempplayers(n).abbrname < hiname then
		                      hiname = tempplayers(n).abbrname
		                      hin=n
		                    end if
		                  end if
		                end if
		              end if
		            end if
		          next
		          page.drawstring str(playerpos),playeroffsetx,playeroffsety
		          page.drawstring tempplayers(hin).fullname,playeroffsetx + 17*c,playeroffsety
		          page.drawstring tempplayers(hin).club,playeroffsetx + 110*c,playeroffsety
		          page.drawstring str(tempplayers(hin).wins),playeroffsetx + 165*c-page.stringwidth(str(tempplayers(hin).wins)),playeroffsety
		          page.drawstring str(tempplayers(hin).spread),playeroffsetx + 200*c-page.stringwidth(str(tempplayers(hin).spread)),playeroffsety
		          page.drawstring str(round(tempplayers(hin).agg/tempplayers(hin).played)),playeroffsetx + 238*c-page.stringWidth(str(round(tempplayers(hin).agg/tempplayers(hin).played))),playeroffsety
		          page.drawstring str(tempplayers(hin).bonus),playeroffsetx + 265*c-page.stringwidth(str(tempplayers(hin).bonus)),playeroffsety
		          tempplayers.remove hin
		        wend
		        playeroffsety=playeroffsety+12*c
		        page.drawstring "High Game: " + str(app.gradelist(k).hg) + " - " + app.gradelist(k).hgn,playeroffsetx,playeroffsety
		        playeroffsety=playeroffsety+12*c
		        page.drawstring "High Aggregate Game: " + str(app.gradelist(k).ha) + " - " + app.gradelist(k).han,playeroffsetx,playeroffsety
		        playeroffsety=playeroffsety+12*c
		        page.drawstring "High Winning Margin: " + str(app.gradelist(k).hm) + " - " + app.gradelist(k).hmn,playeroffsetx,playeroffsety
		        if k = ubound(app.gradelist)\(3-c) then
		          playeroffsetx = 290
		          playeroffsety = 36
		        end if
		      next
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub savestandings()
		  dim dstring,hiname as string
		  dim hin,hispread,k,m,n,playerpos as integer
		  dim tempplayers(0) as player
		  dim hiwins as double
		  dim f as folderItem
		  dim t as textoutputStream
		  
		  f = getsaveFolderItem("text","untitled.txt")
		  if f <> nil then
		    t = f.createtextfile
		    t.writeline app.tname
		    dstring = app.roundlist(0).rounddate.longdate
		    if dstring <> app.roundlist(ubound(app.roundlist)).rounddate.longdate then
		      dstring = dstring + " - " + app.roundlist(ubound(app.roundlist)).rounddate.longdate
		    end if
		    t.writeline dstring + chr(13)
		    for k = 0 to ubound(app.gradelist)
		      t.writeline app.gradelist(k).gradename+" Grade" + chr(13)
		      redim tempplayers(-1)
		      for m = 0 to ubound(app.playerlist)
		        if app.playerlist(m).grade = k+1 and app.playerlist(m).abbrname <> "Bye " and app.playerlist(m).played > 0 then
		          tempplayers.append app.playerlist(m)
		        end if
		      next
		      t.writeline "Place" + chr(9) + "Name" + chr(9) + "Club" + chr(9) + "Wins" + chr(9) + "Spread" + chr(9) + "Ave" + chr(9) + "B/W"
		      playerpos = 0
		      while ubound(tempplayers) > -1
		        playerpos = playerpos + 1
		        hin = -1
		        hiwins = -1
		        hispread = -20000
		        hiname = "ZZZ"
		        for n=0 to ubound(tempplayers)
		          if tempplayers(n).wins > hiwins then
		            hiwins = tempplayers(n).wins
		            hispread = tempplayers(n).spread
		            hiname = tempplayers(n).abbrname
		            hin = n
		          else
		            if tempplayers(n).wins = hiwins then
		              if tempplayers(n).spread > hispread then
		                hispread = tempplayers(n).spread
		                hiname = tempplayers(n).abbrname
		                hin = n
		              else
		                if tempplayers(n).spread = hispread then
		                  if tempplayers(n).abbrname < hiname then
		                    hiname = tempplayers(n).abbrname
		                    hin=n
		                  end if
		                end if
		              end if
		            end if
		          end if
		        next
		        t.write str(playerpos) + chr(9) + tempplayers(hin).fullname + chr(9) + tempplayers(hin).club + chr(9)
		        t.write str(tempplayers(hin).wins) + chr(9) + str(tempplayers(hin).spread) + chr(9)
		        t.writeline str(round(tempplayers(hin).agg/tempplayers(hin).played)) + chr(9) + str(tempplayers(hin).bonus)
		        tempplayers.remove hin
		      wend
		      t.writeline chr(13) + "High Game: " + str(app.gradelist(k).hg) + " - " + app.gradelist(k).hgn
		      t.writeline "High Aggregate Game: " + str(app.gradelist(k).ha) + " - " + app.gradelist(k).han
		      t.writeline "High Winning Margin: " + str(app.gradelist(k).hm) + " - " + app.gradelist(k).hmn + chr(13)
		    next
		    t.close
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ttprintpage()
		  dim ps as printerSetup
		  dim page as graphics
		  dim hin,hispread,k,m,n,playeroffsetx,playeroffsety,playerpos as integer
		  dim tempplayers(0) as player
		  dim hiwins as double
		  dim dstring,hiname as string
		  dim c as double
		  
		  ps = new printersetup
		  if ps.pagesetupDialog then
		    page = openprinterdialog(ps)
		    if page <> nil then
		      if ubound(app.gradelist) < 2 then
		        c = 2
		      else
		        c = 1
		      end if
		      page.textfont="Times"
		      page.textsize=21
		      page.bold = true
		      page.drawstring app.tname,30,18
		      page.textsize = 15
		      dstring = app.roundlist(0).rounddate.longdate
		      if dstring <> app.roundlist(ubound(app.roundlist)).rounddate.longdate then
		        dstring = dstring + " - " + app.roundlist(ubound(app.roundlist)).rounddate.longdate
		      end if
		      page.bold = false
		      page.drawstring dstring,30,34
		      page.bold = true
		      page.drawstring "Round " + str(round),30,62
		      page.bold = false
		      page.drawstring "Australia" + chr(9) + str(ausround) + " - " + str(nzround) + chr(9) + "New Zealand" + chr(13),30,78
		      page.bold = true
		      page.drawstring "Total",30,102
		      page.bold = false
		      page.drawstring "Australia" + chr(9) + str(austotal) + " - " + str(nztotal) + chr(9) + "New Zealand" + chr(13),30,118
		      playeroffsetx = 5 * c
		      playeroffsety = 100
		      for k = 0 to ubound(app.gradelist)
		        page.bold = true
		        page.textsize = 14
		        playeroffsety = playeroffsety+15*c
		        page.textsize = 10*c
		        redim tempplayers(-1)
		        for m = 0 to ubound(app.playerlist)
		          if app.playerlist(m).grade = k+1 and app.playerlist(m).abbrname <> "Bye " then
		            tempplayers.append app.playerlist(m)
		          end if
		        next
		        playeroffsety = playeroffsety + 11*c
		        page.bold = true
		        page.drawstring "Name",playeroffsetx + 17*c,playeroffsety
		        page.drawstring "Team",playeroffsetx + 110*c,playeroffsety
		        page.drawstring "Wins",playeroffsetx + 145*c,playeroffsety
		        page.drawstring "Spread",playeroffsetx + 180*c,playeroffsety
		        page.drawstring "Ave",playeroffsetx + 218*c,playeroffsety
		        page.drawstring "B/W",playeroffsetx + 245*c,playeroffsety
		        page.bold = false
		        playerpos = 0
		        while ubound(tempplayers) > -1
		          playerpos = playerpos + 1
		          playeroffsety = playeroffsety + 11*c
		          hin = -1
		          hiwins = -1
		          hispread = -20000
		          hiname = "ZZZ"
		          for n=0 to ubound(tempplayers)
		            if tempplayers(n).wins > hiwins then
		              hiwins = tempplayers(n).wins
		              hispread = tempplayers(n).spread
		              hiname = tempplayers(n).abbrname
		              hin = n
		            else
		              if tempplayers(n).wins = hiwins then
		                if tempplayers(n).spread > hispread then
		                  hispread = tempplayers(n).spread
		                  hiname = tempplayers(n).abbrname
		                  hin = n
		                else
		                  if tempplayers(n).spread = hispread then
		                    if tempplayers(n).abbrname < hiname then
		                      hiname = tempplayers(n).abbrname
		                      hin=n
		                    end if
		                  end if
		                end if
		              end if
		            end if
		          next
		          page.drawstring str(playerpos),playeroffsetx,playeroffsety
		          page.drawstring tempplayers(hin).fullname,playeroffsetx + 17*c,playeroffsety
		          page.drawstring tempplayers(hin).club,playeroffsetx + 110*c,playeroffsety
		          page.drawstring str(tempplayers(hin).wins),playeroffsetx + 165*c-page.stringwidth(str(tempplayers(hin).wins)),playeroffsety
		          page.drawstring str(tempplayers(hin).spread),playeroffsetx + 200*c-page.stringwidth(str(tempplayers(hin).spread)),playeroffsety
		          page.drawstring str(round(tempplayers(hin).agg/tempplayers(hin).played)),playeroffsetx + 238*c-page.stringWidth(str(round(tempplayers(hin).agg/tempplayers(hin).played))),playeroffsety
		          page.drawstring str(tempplayers(hin).bonus),playeroffsetx + 265*c-page.stringwidth(str(tempplayers(hin).bonus)),playeroffsety
		          tempplayers.remove hin
		        wend
		        playeroffsety=playeroffsety+18*c
		        page.TextSize = 16
		        page.drawstring "High Game: " + str(app.gradelist(k).hg) + " - " + app.gradelist(k).hgn,playeroffsetx,playeroffsety
		        playeroffsety=playeroffsety+12*c
		        page.drawstring "High Aggregate Game: " + str(app.gradelist(k).ha) + " - " + app.gradelist(k).han,playeroffsetx,playeroffsety
		        playeroffsety=playeroffsety+12*c
		        page.drawstring "High Winning Margin: " + str(app.gradelist(k).hm) + " - " + app.gradelist(k).hmn,playeroffsetx,playeroffsety
		        if k = ubound(app.gradelist)\2 then
		          playeroffsetx = 300
		          playeroffsety = 36
		        end if
		      next
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ttsavestandings()
		  dim dstring,hiname as string
		  dim hin,hispread,k,m,n,playerpos as integer
		  dim tempplayers(0) as player
		  dim hiwins as double
		  dim f as folderItem
		  dim t as textoutputStream
		  
		  f = getsaveFolderItem("text","untitled.txt")
		  if f <> nil then
		    t = f.createtextfile
		    t.writeline app.tname
		    dstring = app.roundlist(0).rounddate.longdate
		    if dstring <> app.roundlist(ubound(app.roundlist)).rounddate.longdate then
		      dstring = dstring + " - " + app.roundlist(ubound(app.roundlist)).rounddate.longdate
		    end if
		    t.writeline dstring + chr(13)
		    t.WriteLine "Round " + str(round)
		    t.writeline "Australia" + chr(9) + str(ausround) + " - " + str(nzround) + chr(9) + "New Zealand" + chr(13)
		    t.writeline "Total"
		    t.writeline "Australia" + chr(9) + str(austotal) + " - " + str(nztotal) + chr(9) + "New Zealand" + chr(13)
		    for k = 0 to ubound(app.gradelist)
		      redim tempplayers(-1)
		      for m = 0 to ubound(app.playerlist)
		        if app.playerlist(m).grade = k+1 and app.playerlist(m).abbrname <> "Bye " then
		          tempplayers.append app.playerlist(m)
		        end if
		      next
		      t.writeline "Place" + chr(9) + "Name" + chr(9) + "Team" + chr(9) + "Wins" + chr(9) + "Spread" + chr(9) + "Ave" + chr(9) + "B/W"
		      playerpos = 0
		      while ubound(tempplayers) > -1
		        playerpos = playerpos + 1
		        hin = -1
		        hiwins = -1
		        hispread = -20000
		        hiname = "ZZZ"
		        for n=0 to ubound(tempplayers)
		          if tempplayers(n).wins > hiwins then
		            hiwins = tempplayers(n).wins
		            hispread = tempplayers(n).spread
		            hiname = tempplayers(n).abbrname
		            hin = n
		          else
		            if tempplayers(n).wins = hiwins then
		              if tempplayers(n).spread > hispread then
		                hispread = tempplayers(n).spread
		                hiname = tempplayers(n).abbrname
		                hin = n
		              else
		                if tempplayers(n).spread = hispread then
		                  if tempplayers(n).abbrname < hiname then
		                    hiname = tempplayers(n).abbrname
		                    hin=n
		                  end if
		                end if
		              end if
		            end if
		          end if
		        next
		        t.write str(playerpos) + chr(9) + tempplayers(hin).fullname + chr(9) + tempplayers(hin).club + chr(9)
		        t.write str(tempplayers(hin).wins) + chr(9) + str(tempplayers(hin).spread) + chr(9)
		        t.writeline str(round(tempplayers(hin).agg/tempplayers(hin).played)) + chr(9) + str(tempplayers(hin).bonus)
		        tempplayers.remove hin
		      wend
		      t.writeline chr(13) + "High Game: " + str(app.gradelist(k).hg) + " - " + app.gradelist(k).hgn
		      t.writeline "High Aggregate Game: " + str(app.gradelist(k).ha) + " - " + app.gradelist(k).han
		      t.writeline "High Winning Margin: " + str(app.gradelist(k).hm) + " - " + app.gradelist(k).hmn + chr(13)
		    next
		    t.close
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ausround As double
	#tag EndProperty

	#tag Property, Flags = &h0
		austotal As double
	#tag EndProperty

	#tag Property, Flags = &h0
		nzround As double
	#tag EndProperty

	#tag Property, Flags = &h0
		nztotal As double
	#tag EndProperty

	#tag Property, Flags = &h0
		printsaveoption As string
	#tag EndProperty

	#tag Property, Flags = &h0
		round As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		swap As boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events prevbutton
	#tag Event
		Sub Action()
		  if round > 1 then
		    round = round -1
		    self.title = "Round " + str(round)
		    nextbutton.enabled = true
		    if round = 1 then
		      me.enabled = false
		    end if
		    refresh
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events nextbutton
	#tag Event
		Sub Action()
		  if round < ubound(app.roundlist)+1 then
		    round = round +1
		    self.title = "Round " + str(round)
		    prevbutton.enabled = true
		    if round = ubound(app.roundlist)+1 then
		      me.enabled = false
		    end if
		    refresh
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events printsavebutton
	#tag Event
		Sub Action()
		  dim i,j,k,l as integer
		  dim t as tougame
		  
		  app.savetournfile
		  ausround = 0
		  nzround = 0
		  austotal = 0
		  nztotal = 0
		  for j = 0 to ubound(app.playerlist)
		    app.playerlist(j).played = 0
		    app.playerlist(j).wins = 0
		    app.playerlist(j).byewins = 0
		    app.playerlist(j).forfeits = 0
		    app.playerlist(j).bonus = 0
		    app.playerlist(j).spread = 0
		    app.playerlist(j).agg = 0
		    ReDim app.playerlist(j).tou(-1)
		  next
		  for j = 0 to ubound(app.gradelist)
		    app.gradelist(j).hg = 0
		    app.gradelist(j).hgn = ""
		    app.gradelist(j).ha = 0
		    app.gradelist(j).han = ""
		    app.gradelist(j).hm = 0
		    app.gradelist(j).hmn = ""
		  next
		  for i = 0 to ubound(app.gamelist)
		    if app.gamelist(i).round <= round then
		      if app.gamelist(i).played then
		        if app.gamelist(i).p1 <> "Bye " and app.gamelist(i).p2 <> "Bye " then
		          if app.gamelist(i).p1score > app.gradelist(app.gamelist(i).grade-1).hg then
		            app.gradelist(app.gamelist(i).grade-1).hg = app.gamelist(i).p1score
		            app.gradelist(app.gamelist(i).grade-1).hgn = app.gamelist(i).p1
		          else
		            if app.gamelist(i).p1score = app.gradelist(app.gamelist(i).grade-1).hg then
		              app.gradelist(app.gamelist(i).grade-1).hgn = app.gradelist(app.gamelist(i).grade-1).hgn + ", " + app.gamelist(i).p1
		            end if
		          end if
		          if app.gamelist(i).p2score > app.gradelist(app.gamelist(i).grade-1).hg then
		            app.gradelist(app.gamelist(i).grade-1).hg = app.gamelist(i).p2score
		            app.gradelist(app.gamelist(i).grade-1).hgn = app.gamelist(i).p2
		          else
		            if app.gamelist(i).p2score = app.gradelist(app.gamelist(i).grade-1).hg then
		              app.gradelist(app.gamelist(i).grade-1).hgn = app.gradelist(app.gamelist(i).grade-1).hgn + ", " + app.gamelist(i).p2
		            end if
		          end if
		          if app.gamelist(i).p1score - app.gamelist(i).p2score > app.gradelist(app.gamelist(i).grade-1).hm then
		            app.gradelist(app.gamelist(i).grade-1).hm = app.gamelist(i).p1score - app.gamelist(i).p2score
		            app.gradelist(app.gamelist(i).grade-1).hmn = app.gamelist(i).p1
		          else
		            if app.gamelist(i).p1score - app.gamelist(i).p2score = app.gradelist(app.gamelist(i).grade-1).hm then
		              app.gradelist(app.gamelist(i).grade-1).hmn = app.gradelist(app.gamelist(i).grade-1).hmn + ", " + app.gamelist(i).p1
		            end if
		          end if
		          if app.gamelist(i).p2score - app.gamelist(i).p1score > app.gradelist(app.gamelist(i).grade-1).hm then
		            app.gradelist(app.gamelist(i).grade-1).hm = app.gamelist(i).p2score - app.gamelist(i).p1score
		            app.gradelist(app.gamelist(i).grade-1).hmn = app.gamelist(i).p2
		          else
		            if app.gamelist(i).p2score - app.gamelist(i).p1score = app.gradelist(app.gamelist(i).grade-1).hm then
		              app.gradelist(app.gamelist(i).grade-1).hmn = app.gradelist(app.gamelist(i).grade-1).hmn + ", " + app.gamelist(i).p2
		            end if
		          end if
		          if app.gamelist(i).p1score + app.gamelist(i).p2score > app.gradelist(app.gamelist(i).grade-1).ha then
		            app.gradelist(app.gamelist(i).grade-1).ha = app.gamelist(i).p1score + app.gamelist(i).p2score
		            app.gradelist(app.gamelist(i).grade-1).han = app.gamelist(i).p1 + "/" + app.gamelist(i).p2
		          else
		            if app.gamelist(i).p1score + app.gamelist(i).p2score = app.gradelist(app.gamelist(i).grade-1).ha then
		              app.gradelist(app.gamelist(i).grade-1).han = app.gradelist(app.gamelist(i).grade-1).han + ", " + app.gamelist(i).p1 + "/" + app.gamelist(i).p2
		            end if
		          end if
		        end if
		        for j = 0 to ubound(app.playerlist)
		          if app.playerlist(j).abbrname = app.gamelist(i).p1 then
		            app.playerlist(j).grade = app.gamelist(i).grade
		            if app.gamelist(i).p1attended <> "Present" or app.gamelist(i).p2attended <> "Present" then
		              if app.gamelist(i).p1attended = "Present" then
		                app.playerlist(j).byewins = app.playerlist(j).byewins + 1
		              elseif app.gamelist(i).p1attended = "Forfeited" then
		                app.playerlist(j).forfeits = app.playerlist(j).forfeits + 1
		              end if
		            else
		              if app.gamelist(i).p1score > app.gamelist(i).p2score then
		                app.playerlist(j).wins = app.playerlist(j).wins + 1
		                if app.drawtype = 2 then
		                  if app.playerlist(j).club = "AUS" then
		                    austotal = austotal + 1
		                    if app.gamelist(i).round = round then
		                      ausround = ausround + 1
		                    end if
		                  end if
		                  if app.playerlist(j).club = "NZ" then
		                    nztotal = nztotal + 1
		                    if app.gamelist(i).round = round then
		                      nzround = nzround + 1
		                    end if
		                  end if
		                end if
		              else
		                if app.gamelist(i).p1score = app.gamelist(i).p2score then
		                  app.playerlist(j).wins = app.playerlist(j).wins + 0.5
		                  if app.drawtype = 2 then
		                    if app.playerlist(j).club = "AUS" then
		                      austotal = austotal + 0.5
		                      if app.gamelist(i).round = round then
		                        ausround = ausround + 0.5
		                      end if
		                    end if
		                    if app.playerlist(j).club = "NZ" then
		                      nztotal = nztotal + 0.5
		                      if app.gamelist(i).round = round then
		                        nzround = nzround + 0.5
		                      end if
		                    end if
		                  end if
		                end if
		              end if
		              app.playerlist(j).played = app.playerlist(j).played + 1
		              app.playerlist(j).bonus = app.playerlist(j).bonus + app.gamelist(i).p1bonus
		              app.playerlist(j).spread = app.playerlist(j).spread + app.gamelist(i).p1score - app.gamelist(i).p2score
		              app.playerlist(j).agg = app.playerlist(j).agg + app.gamelist(i).p1score
		            end if
		          end if
		          if app.playerlist(j).abbrname = app.gamelist(i).p2 then
		            app.playerlist(j).grade = app.gamelist(i).grade
		            if app.gamelist(i).p1attended <> "Present" or app.gamelist(i).p2attended <> "Present" then
		              if app.gamelist(i).p2attended = "Present" then
		                app.playerlist(j).byewins = app.playerlist(j).byewins + 1
		              elseif app.gamelist(i).p2attended = "Forfeited" then
		                app.playerlist(j).forfeits = app.playerlist(j).forfeits + 1
		              end if
		            else
		              if app.gamelist(i).p2score > app.gamelist(i).p1score then
		                app.playerlist(j).wins = app.playerlist(j).wins + 1
		                if app.drawtype = 2 then
		                  if app.playerlist(j).club = "AUS" then
		                    austotal = austotal + 1
		                    if app.gamelist(i).round = round then
		                      ausround = ausround + 1
		                    end if
		                  end if
		                  if app.playerlist(j).club = "NZ" then
		                    nztotal = nztotal + 1
		                    if app.gamelist(i).round = round then
		                      nzround = nzround + 1
		                    end if
		                  end if
		                end if
		              else
		                if app.gamelist(i).p2score = app.gamelist(i).p1score then
		                  app.playerlist(j).wins = app.playerlist(j).wins + 0.5
		                  if app.drawtype = 2 then
		                    if app.playerlist(j).club = "AUS" then
		                      austotal = austotal + 0.5
		                      if app.gamelist(i).round = round then
		                        ausround = ausround + 0.5
		                      end if
		                    end if
		                    if app.playerlist(j).club = "NZ" then
		                      nztotal = nztotal + 0.5
		                      if app.gamelist(i).round = round then
		                        nzround = nzround + 0.5
		                      end if
		                    end if
		                  end if
		                end if
		              end if
		              app.playerlist(j).played = app.playerlist(j).played + 1
		              app.playerlist(j).bonus = app.playerlist(j).bonus + app.gamelist(i).p2bonus
		              app.playerlist(j).spread = app.playerlist(j).spread + app.gamelist(i).p2score - app.gamelist(i).p1score
		              app.playerlist(j).agg = app.playerlist(j).agg + app.gamelist(i).p2score
		            end if
		          end if
		        next
		      else
		        msgBox "unplayed game"
		      end if
		    end if
		  next
		  for i = 1 to round
		    for j = 0 to UBound(app.gamelist)
		      if i = app.gamelist(j).round then
		        for k = 0 to UBound(app.playerlist)
		          if app.gamelist(j).p1 = app.playerlist(k).abbrname then
		            t = new tougame
		            if app.gamelist(j).p1score > app.gamelist(j).p2score then
		              t.result = 2
		            elseif app.gamelist(j).p1score = app.gamelist(j).p2score then
		              t.result = 1
		            else
		              t.result = 0
		            end if
		            t.score = app.gamelist(j).p1score
		            t.start = true
		            for l = 0 to UBound(app.playerlist)
		              if app.gamelist(j).p2 = app.playerlist(l).abbrname then
		                t.opponent = l+1
		              end if
		            next
		            app.playerlist(k).tou.append t
		          end if
		          if app.gamelist(j).p2 = app.playerlist(k).abbrname then
		            t = new tougame
		            if app.gamelist(j).p1score > app.gamelist(j).p2score then
		              t.result = 0
		            elseif app.gamelist(j).p1score = app.gamelist(j).p2score then
		              t.result = 1
		            else
		              t.result = 2
		            end if
		            t.score = app.gamelist(j).p2score
		            t.start = false
		            for l = 0 to UBound(app.playerlist)
		              if app.gamelist(j).p1 = app.playerlist(l).abbrname then
		                t.opponent = l+1
		              end if
		            next
		            app.playerlist(k).tou.append t
		          end if
		        next
		      end if
		    next
		  next
		  for j = 0 to ubound(app.playerlist)
		    if app.playerlist(j).played > 0 then
		      app.playerlist(j).bonus = app.playerlist(j).bonus + round((app.playerlist(j).bonus/app.playerlist(j).played)*app.playerlist(j).byewins)
		      app.playerlist(j).agg = app.playerlist(j).agg + round((app.playerlist(j).agg/app.playerlist(j).played)*app.playerlist(j).byewins)
		    end if
		    app.playerlist(j).spread = app.playerlist(j).spread + 50*app.playerlist(j).byewins
		    app.playerlist(j).wins = app.playerlist(j).wins + app.playerlist(j).byewins
		    app.playerlist(j).played = app.playerlist(j).played + app.playerlist(j).byewins
		    app.playerlist(j).spread = app.playerlist(j).spread - 50*app.playerlist(j).forfeits
		    app.playerlist(j).played = app.playerlist(j).played + app.playerlist(j).forfeits
		  next
		  printsavechooser.CurrentRound.Text = "Standings as at Round " + str(round)
		  printsavechooser.showmodal
		  select case app.drawtype
		  case 0
		    if printsaveoption = "file" then
		      savestandings
		    else
		      if printsaveoption = "page" then
		        printpage
		      else
		        printgrades
		      end if
		    end if
		  case 2
		    if printsaveoption = "file" then
		      ttsavestandings
		    else
		      if printsaveoption = "page" then
		        ttprintpage
		      else
		        exporttou
		      end if
		    end if
		  end Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="ausround"
		Group="Behavior"
		InitialValue="0"
		Type="double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="austotal"
		Group="Behavior"
		InitialValue="0"
		Type="double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="nzround"
		Group="Behavior"
		InitialValue="0"
		Type="double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="nztotal"
		Group="Behavior"
		InitialValue="0"
		Type="double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="printsaveoption"
		Group="Behavior"
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="round"
		Group="Behavior"
		InitialValue="0"
		Type="integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="swap"
		Group="Behavior"
		InitialValue="0"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
