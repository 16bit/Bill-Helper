
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
	Terms("P")
	
	Shipper(0346627)	
	Consignee()
	ThirdParty()

	SIGNEDFOR(Get("TOTALPIECES")"SK")
	sleep 100
	Quote(430,447)
	SLEEP 100

	Clear("BOL")
	PO(,700,445)
	;~ VERIFY("PO",5)

	SLEEP 400
	TotalPieces(CalculateTotalPieces())
}

100Air()
{
	Terms("Prepaid")
	Shipper(0491138)
	Consignee()
	ThirdParty()
	
	SignedFor("AVRT SLC")
	
	Clear("BOL")
	BOL(001)
	
	Clear("PO")
	PO(,700,280)
	
	Clear("REF")
	REF(,728,260)
	
	BLANKTABLE(6)
	AddItem(1,Get("HU"),"DIFFUSERS",70,Get("TOTALWEIGHT"))
}

100PARAGON()
{
	Terms("P")
	
	Shipper(1358514)
	Consignee()
	ThirdParty()
	
	SignedFor(AskUser("SIGNED FOR:",Get("TOTALPIECES")"SK"))
	
	Clear("BOL")
	BOL(,403,1036)
	
	Clear("PO")
	PO(,688,177)	
	
	BLANKTABLE(5)
	SLEEP 500
	AddItem(1,Get("HU"),"PLASTIC STRETCH FILM",55,Get("TOTALWEIGHT"))
}

100National()
{
	Terms("P")
	
	Shipper(0589057)
	Consignee()	
	ThirdParty()
	
	SignedFor(Get("HU")"SK")
	BOL(AskUser("BOL?",Copy("BOL")))
	
	Clear("PO")
	PO(,280,477)
	
	BlankTable(5)
	Sleep 500
	AddItem(1,AskUser("Quantity:"),"WELD WIRE",50,Get("TotalWeight"))
	
	SLEEP 500
	TotalPieces(CalculateTotalPieces())
	
}

100Stillwater()
{
	Terms("P")
	Shipper(0591388)
	Consignee()	
	ThirdParty()
	
	SignedFor(AskUser("SIGNED FOR:",Get("TOTALPIECES")"SK"))

	Clear("Bol")
	BOL(,720,165)
	
	Clear("PO")
	;~ PO(,280,477)
	
	BlankTable(5)
	;~ Sleep 500
	AddItem(1,AskUser("Quantity:"),"AUDIO PRODUCTS",100,Get("TotalWeight"))
	
	SLEEP 500
	TotalPieces(CalculateTotalPieces())

}

100ContinentalIindustries()
{
	Terms("P")
	
	Shipper(0347940)
	Consignee()
	ThirdParty()
	
	SignedFor(Get("HU")"pl")
	
	Clear("BOL")	
	BOL(,873,154)
	
	BlankTable(5)
	AddItem(1,AskUser("Quantity:"),"FITTINGS N.O.I PLASTIC",70,Get("TotalWeight"))
	
	PO(AskUser("PO?"))
	
}

100TulsaTube()
{
	Terms("P")
	Shipper(0383280)	
	Consignee()
	ThirdParty()
	
	SignedFor(AskUser("SIGNED FOR:",Get("TOTALPIECES")))
	
	Clear("BOL")
	;~ BOL(,675,103)
	BOL(72)
	
	Clear("PO")
	PO(,496,264)
	
	BlankTable(5)
	AddItem(1,AskUser("Quantity:"),"PIPE",70,Get("TotalWeight"))
	sleep 250
	TotalPieces(CalculateTotalPieces())
}

100Carlisle()
{
	Terms("P")
	
	Shipper(1087842)
	Consignee()
	ThirdParty()
	
	SignedFor(AskUser("SIGNED FOR:"))
	
	Clear("BOL")
	
	BLANKTABLE(5)
	AddItem(1,Get("HU"),"clutch facings",70,Get("TOTALWEIGHT"))
	
	BOL(AskUser("BOL?"))
}


