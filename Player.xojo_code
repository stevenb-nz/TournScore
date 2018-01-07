#tag Class
Protected Class Player
	#tag Property, Flags = &h0
		abbrname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		agg As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		bonus As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		byewins As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		club As string
	#tag EndProperty

	#tag Property, Flags = &h0
		forfeits As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fullname As string
	#tag EndProperty

	#tag Property, Flags = &h0
		grade As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		played As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		realrating As double
	#tag EndProperty

	#tag Property, Flags = &h0
		sortrating As double
	#tag EndProperty

	#tag Property, Flags = &h0
		spread As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		tou(-1) As tougame
	#tag EndProperty

	#tag Property, Flags = &h0
		wins As double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="abbrname"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="agg"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bonus"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="byewins"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="club"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="forfeits"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="fullname"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="grade"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="played"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="realrating"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sortrating"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="spread"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="wins"
			Group="Behavior"
			InitialValue="0"
			Type="double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
