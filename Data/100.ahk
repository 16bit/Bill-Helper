
::100I::
100Innovative()
return

::100A::
100Air()
return

::100P::
100PARAGON()
RETURN

::100N::
100National()
return

100Innovative()
{
	Send Prepaid{Enter}
	
	Shipper(0346627)
	CloseSearch()
	
	consignee()
	ThirdParty()
		
	;~ SignedFor(AskUser("Signed For:"))
	SIGNEDFOR(COPY("TOTALPIECES")"SK")
		SLEEP 250
	Quote(430,447)
	SLEEP 250
	;VERIFY("QUOTE",7)

	Clear("BOL")
	PO(,700,445)

	AddCode("SW",4)
	SLEEP 500
	TotalPieces(CalculateTotalPieces())
}

100Air()
{
	Send Prepaid{Enter}
	
	Shipper(0491138)
	CloseSearch()
	ThirdParty()
	
	;SignedFor(AskUser("Signed For:"))
	SIGNEDFOR("AVRT SLC")
	
	Clear("BOL")
	BOL(0013)
	
	Clear("PO")
	PO(,700,280)
	
	;Clear("REF")
	REF(,728,260)
	;Verify("REF",6)
	
	BLANKTABLE(6)
	SLEEP 500
	AddItem(1,Copy("HU"),"DIFFUSERS",70,COPY("TOTALWEIGHT"))
}

100PARAGON()
{
	Send Prepaid{Enter}
	
	Shipper(1358514)
	;~ CloseSearch()
	ThirdParty()
	
	SIGNEDFOR(Copy("HU") "SLC")
	
	Clear("BOL")
	BOL(,403,1036)
	
	Clear("PO")
	PO(,688,177)	
	
	BLANKTABLE(6)
	SLEEP 500
	AddItem(1,Copy("HU"),"PLASTIC STRETCH FILM",55,COPY("TOTALWEIGHT"))
}

100National()
{
	Send Prepaid{Enter}
	
	Shipper(0589057)
	Consignee()
	
	ThirdParty()
	
	SignedFor(Copy("HU")"SK")
	;~ Clear("Bol")
	BOL(AskUser("BOL?",Copy("BOL")))
	
	Clear("PO")
	PO(,280,477)
	
	BlankTable(5)
	Sleep 500
	AddItem(1,AskUser("Quantity:"),"WELD WIRE",50,Copy("TotalWeight"))
	
	SLEEP 500
	TotalPieces(CalculateTotalPieces())
	
}

100Stillwater()
{
	Send Prepaid{Enter}
	
	Shipper(0591388)
	Consignee()	
	ThirdParty()
	
	SIGNEDFOR(COPY("TOTALPIECES")"SK")

	Clear("Bol")
	BOL(,720,165)
	
	Clear("PO")
	;~ PO(,280,477)
	
	BlankTable(5)
	Sleep 500
	AddItem(1,AskUser("Quantity:"),"AUDIO PRODUCTS",100,Copy("TotalWeight"))
	
	SLEEP 500
	TotalPieces(CalculateTotalPieces())

}