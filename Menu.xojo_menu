#tag Menu
Begin Menu Menu
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "File"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin MenuItem FileNew
         SpecialMenu = 0
         Text = "New..."
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem FileOpen
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem FileImportLandon
         SpecialMenu = 0
         Text = "Import Landon..."
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem FileSaveAs
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 3
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem FileTableDraw
         SpecialMenu = 0
         Text = "Table Draw"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem FileRatingDump
         SpecialMenu = 0
         Text = "Rating Dump"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 4
         AutoEnable = False
         Visible = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "Quit"
         Index = -2147483648
         ShortcutKey = "Q"
         Shortcut = "Cmd+Q"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "Edit"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 5
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cut"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "Clear"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
   End
   Begin MenuItem AddMenu
      SpecialMenu = 0
      Text = "Add"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin MenuItem AddPlayer
         SpecialMenu = 0
         Text = "Player"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem AddGrade
         SpecialMenu = 0
         Text = "Grade"
         Index = -2147483648
         ShortcutKey = "G"
         Shortcut = "Cmd+G"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem AddRound
         SpecialMenu = 0
         Text = "Round"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 6
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem AddCreateDraw
         SpecialMenu = 0
         Text = "Create Draw"
         Index = -2147483648
         ShortcutKey = "D"
         Shortcut = "Cmd+D"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
   End
   Begin MenuItem RemoveMenu
      SpecialMenu = 0
      Text = "Remove"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem RemovePlayers
         SpecialMenu = 0
         Text = "Players"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem RemoveGrades
         SpecialMenu = 0
         Text = "Grades"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem RemoveRounds
         SpecialMenu = 0
         Text = "Rounds"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ImportMenu
      SpecialMenu = 0
      Text = "Import"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin MenuItem ImportPlayers
         SpecialMenu = 0
         Text = "Players..."
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem ImportGrades
         SpecialMenu = 0
         Text = "Grades..."
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem ImportRounds
         SpecialMenu = 0
         Text = "Rounds..."
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
   End
   Begin MenuItem ExportMenu
      SpecialMenu = 0
      Text = "Export"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin MenuItem ExportPlayers
         SpecialMenu = 0
         Text = "Players..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ExportGrades
         SpecialMenu = 0
         Text = "Grades..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ExportRounds
         SpecialMenu = 0
         Text = "Rounds..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem WindowMenu
      SpecialMenu = 0
      Text = "Window"
      Index = -2147483648
      AutoEnable = False
      Visible = True
      Begin AppleMenuItem AppleAboutTournamentScorer
         SpecialMenu = 0
         Text = "About Tournament Scorer"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 0
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem WindowTournament
         SpecialMenu = 0
         Text = "Tournament"
         Index = -2147483648
         ShortcutKey = "T"
         Shortcut = "Cmd+T"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem WindowPlayers
         SpecialMenu = 0
         Text = "Players"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem WindowGrades
         SpecialMenu = 0
         Text = "Grades"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem WindowRounds
         SpecialMenu = 0
         Text = "Rounds"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 1
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem WindowCurrentRound
         SpecialMenu = 0
         Text = "Current Round"
         Index = -2147483648
         ShortcutKey = "U"
         Shortcut = "Cmd+U"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 2
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem WindowClose
         SpecialMenu = 0
         Text = "Close"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
   End
End
#tag EndMenu
