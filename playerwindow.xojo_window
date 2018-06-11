#tag Window
Begin Window playerwindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Player List"
   Visible         =   True
   Width           =   652
   Begin ListBox playerlist
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   False
      ColumnWidths    =   "50%,30%,10%,10%,0%,0%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   574
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   626
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events playerlist
	#tag Event
		Sub DoubleClick()
		  dim i,j,k as integer
		  dim s as string
		  
		  if app.keepcheck then
		    playerhistorywindow.phistlist.deleteallrows
		    s = playerlist.Cell(playerlist.ListIndex,1)
		    playerhistorywindow.title = playerhistorywindow.title + " - " + s
		    for j=0 to ubound(app.roundlist)
		      for i=0 to ubound(app.gamelist)
		        if app.gamelist(i).round = j+1 and app.gamelist(i).played then
		          if app.gamelist(i).p1 = s then
		            playerhistorywindow.phistlist.addrow "Rd."+str(j+1)+" - "+app.gamelist(i).p2
		            if app.gamelist(i).p1score > app.gamelist(i).p2score then
		              playerhistorywindow.phistlist.cell(j*2,1) = str(1)
		            else
		              if app.gamelist(i).p2score > app.gamelist(i).p1score then
		                playerhistorywindow.phistlist.cell(j*2,1) = str(0)
		              else
		                if app.gamelist(i).p1attended = "present" then
		                  if app.gamelist(i).p2attended = "present" then
		                    playerhistorywindow.phistlist.cell(j*2,1) = str(.5)
		                  else
		                    playerhistorywindow.phistlist.cell(j*2,1) = str(1)
		                  end
		                else
		                  playerhistorywindow.phistlist.cell(j*2,1) = str(0)
		                end
		              end if
		            end if
		            playerhistorywindow.phistlist.cell(j*2,2) = str(app.gamelist(i).p1score)
		            playerhistorywindow.phistlist.cell(j*2,3) = str(app.gamelist(i).p2score)
		            if app.gamelist(i).p1attended = "present" then
		              if app.gamelist(i).p2attended = "present" then
		                playerhistorywindow.phistlist.cell(j*2,4) = str(app.gamelist(i).p2score-app.gamelist(i).p1score)
		              else
		                playerhistorywindow.phistlist.cell(j*2,4) = str(50)
		              end
		            else
		              playerhistorywindow.phistlist.cell(j*2,4) = str(0)
		            end
		            playerhistorywindow.phistlist.cell(j*2,5) = str(app.gamelist(i).p1bonus)
		            playerhistorywindow.phistlist.addrow ""
		            if j=0 then
		              playerhistorywindow.phistlist.cell(j*2+1,1) = playerhistorywindow.phistlist.cell(j*2,1)
		              playerhistorywindow.phistlist.cell(j*2+1,2) = playerhistorywindow.phistlist.cell(j*2,2)
		              playerhistorywindow.phistlist.cell(j*2+1,3) = playerhistorywindow.phistlist.cell(j*2,3)
		              playerhistorywindow.phistlist.cell(j*2+1,4) = playerhistorywindow.phistlist.cell(j*2,4)
		              playerhistorywindow.phistlist.cell(j*2+1,5) = playerhistorywindow.phistlist.cell(j*2,5)
		            else
		              playerhistorywindow.phistlist.cell(j*2+1,1) = str(val(playerhistorywindow.phistlist.cell(j*2,1))+val(playerhistorywindow.phistlist.cell(j*2-1,1)))
		              playerhistorywindow.phistlist.cell(j*2+1,2) = str(val(playerhistorywindow.phistlist.cell(j*2,2))+val(playerhistorywindow.phistlist.cell(j*2-1,2)))
		              playerhistorywindow.phistlist.cell(j*2+1,3) = str(val(playerhistorywindow.phistlist.cell(j*2,3))+val(playerhistorywindow.phistlist.cell(j*2-1,3)))
		              playerhistorywindow.phistlist.cell(j*2+1,4) = str(val(playerhistorywindow.phistlist.cell(j*2,4))+val(playerhistorywindow.phistlist.cell(j*2-1,4)))
		              playerhistorywindow.phistlist.cell(j*2+1,5) = str(val(playerhistorywindow.phistlist.cell(j*2,5))+val(playerhistorywindow.phistlist.cell(j*2-1,5)))
		            end if
		          end if
		          if app.gamelist(i).p2 = s then
		            playerhistorywindow.phistlist.addrow "Rd."+str(j+1)+" - "+app.gamelist(i).p1
		            if app.gamelist(i).p2score > app.gamelist(i).p1score then
		              playerhistorywindow.phistlist.cell(j*2,1) = str(1)
		            else
		              if app.gamelist(i).p1score > app.gamelist(i).p2score then
		                playerhistorywindow.phistlist.cell(j*2,1) = str(0)
		              else
		                if app.gamelist(i).p2attended = "present" then
		                  if app.gamelist(i).p1attended = "present" then
		                    playerhistorywindow.phistlist.cell(j*2,1) = str(.5)
		                  else
		                    playerhistorywindow.phistlist.cell(j*2,1) = str(1)
		                  end
		                else
		                  playerhistorywindow.phistlist.cell(j*2,1) = str(0)
		                end
		              end if
		            end if
		            playerhistorywindow.phistlist.cell(j*2,2) = str(app.gamelist(i).p2score)
		            playerhistorywindow.phistlist.cell(j*2,3) = str(app.gamelist(i).p1score)
		            if app.gamelist(i).p2attended = "present" then
		              if app.gamelist(i).p1attended = "present" then
		                playerhistorywindow.phistlist.cell(j*2,4) = str(app.gamelist(i).p2score-app.gamelist(i).p1score)
		              else
		                playerhistorywindow.phistlist.cell(j*2,4) = str(50)
		              end
		            else
		              playerhistorywindow.phistlist.cell(j*2,4) = str(0)
		            end
		            playerhistorywindow.phistlist.cell(j*2,5) = str(app.gamelist(i).p2bonus)
		            playerhistorywindow.phistlist.addrow ""
		            if j=0 then
		              playerhistorywindow.phistlist.cell(j*2+1,1) = playerhistorywindow.phistlist.cell(j*2,1)
		              playerhistorywindow.phistlist.cell(j*2+1,2) = playerhistorywindow.phistlist.cell(j*2,2)
		              playerhistorywindow.phistlist.cell(j*2+1,3) = playerhistorywindow.phistlist.cell(j*2,3)
		              playerhistorywindow.phistlist.cell(j*2+1,4) = playerhistorywindow.phistlist.cell(j*2,4)
		              playerhistorywindow.phistlist.cell(j*2+1,5) = playerhistorywindow.phistlist.cell(j*2,5)
		            else
		              playerhistorywindow.phistlist.cell(j*2+1,1) = str(val(playerhistorywindow.phistlist.cell(j*2,1))+val(playerhistorywindow.phistlist.cell(j*2-1,1)))
		              playerhistorywindow.phistlist.cell(j*2+1,2) = str(val(playerhistorywindow.phistlist.cell(j*2,2))+val(playerhistorywindow.phistlist.cell(j*2-1,2)))
		              playerhistorywindow.phistlist.cell(j*2+1,3) = str(val(playerhistorywindow.phistlist.cell(j*2,3))+val(playerhistorywindow.phistlist.cell(j*2-1,3)))
		              playerhistorywindow.phistlist.cell(j*2+1,4) = str(val(playerhistorywindow.phistlist.cell(j*2,4))+val(playerhistorywindow.phistlist.cell(j*2-1,4)))
		              playerhistorywindow.phistlist.cell(j*2+1,5) = str(val(playerhistorywindow.phistlist.cell(j*2,5))+val(playerhistorywindow.phistlist.cell(j*2-1,5)))
		            end if
		          end if
		        end if
		      next
		      for k = 0 to 5
		        playerhistorywindow.phistlist.CellBorderBottom(j*2,k)=ListBox.BorderThinDotted
		        playerhistorywindow.phistlist.CellBorderBottom(j*2+1,k)=ListBox.BorderThinSolid
		      next
		    next
		  else
		    playerdialog.playerid = playerlist.ListIndex
		    playerdialog.fnfield.Text = app.playerlist(playerlist.ListIndex).fullname
		    playerdialog.snfield.Text = app.playerlist(playerlist.ListIndex).abbrname
		    playerdialog.clubfield.Text = app.playerlist(playerlist.ListIndex).club
		    playerdialog.ratingfield.Text = str(app.playerlist(playerlist.ListIndex).realrating)
		    playerdialog.sortratingfield.Text = str(app.playerlist(playerlist.ListIndex).sortrating)
		    playerdialog.showmodal
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim i,j as integer
		  dim s as string
		  
		  if not(app.keepcheck) then
		    if asc(Key)=127 or asc(Key)=8 then
		      if me.listindex > -1 then
		        s = playerlist.Cell(playerlist.listindex,1)
		        j=-1
		        for i=0 to ubound(app.playerlist)
		          if s = app.playerlist(i).abbrname then
		            j=i
		          end if
		        next
		        app.playerlist.remove j
		        app.resortplayers
		      end if
		    end if
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
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
