#tag Class
Protected Class Grade
	#tag Property, Flags = &h0
		firsttable As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		gradename As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ha As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		han As string
	#tag EndProperty

	#tag Property, Flags = &h0
		hg As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		hgn As string
	#tag EndProperty

	#tag Property, Flags = &h0
		hm As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		hmn As string
	#tag EndProperty

	#tag Property, Flags = &h0
		lasttable As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		numplayers As integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="firsttable"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gradename"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ha"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="han"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hg"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hgn"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hm"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hmn"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="lasttable"
			Group="Behavior"
			InitialValue="0"
			Type="integer"
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
			Name="numplayers"
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
	#tag EndViewBehavior
End Class
#tag EndClass
