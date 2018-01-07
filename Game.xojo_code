#tag Class
Protected Class Game
	#tag Property, Flags = &h0
		grade As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		p1 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		p1attended As string = "Present"
	#tag EndProperty

	#tag Property, Flags = &h0
		p1bonus As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		p1score As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		p2 As string
	#tag EndProperty

	#tag Property, Flags = &h0
		p2attended As string = "Present"
	#tag EndProperty

	#tag Property, Flags = &h0
		p2bonus As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		p2score As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		played As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		round As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		table As integer
	#tag EndProperty


	#tag ViewBehavior
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
			Name="p1"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p1attended"
			Group="Behavior"
			InitialValue="Present"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p1bonus"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p1score"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p2"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p2attended"
			Group="Behavior"
			InitialValue="Present"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p2bonus"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="p2score"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="played"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="table"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
