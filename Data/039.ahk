
::039S::
039STANDARD()
RETURN


::039t::
039Trane()
RETURN


039Trane()		; this is the easy Trane bill
{
	Send Prepaid{ENTER}

	Shipper(0352084)
	;~ if(!bIsBlank("Consignee"))
		;~ Send {Enter}
		;MsgBox,4,, Hmm, no account here `nHit Okay when you are ready to continue
		
	Consignee()


	ThirdParty()

	SignedFor("SLC")
	bol("Y1")
	Verify("BOL",7)
	PO("29")
	Verify("PO",7)

	CleanUpCell(1)
	Select("Description")

	Send {DOWN}

	DeleteLine()
	SLEEP 200
	if(bIsBlank("Description"))
	{
		AddItem(1,AskUser("Quantity"),"ND",150,Copy("TotalWeight"))
		AddItem(2,,,"NDBOL")

	}
	ELSE
	{
		Class(1,150)
		Weight(1,Copy("TotalWeight"))
	}
	SLEEP 100
	TotalPieces(CalculateTotalPieces())
}

039TraneAberdeen()
{
	Send Prepaid {Enter}
	Shipper(0352084)
	;~ closesearch()
	Consignee()
	
	ThirdParty(0689377)
	SignedFor("SLC")
	BOL(,230,233)
	
}

::039R::
039Ruskin()
return

039Ruskin()
{
Send Prepaid{ENTER}

;~ MsgBox, 4, , Is RUS?
	;~ IfMsgBox yes		
		Shipper(0507919)
	;~ ifmsgbox No
	;~ {
		;~ shipperVar := AskUser("Enter abbreviation")
		;~ if(shipperVar == "GRD")
			;~ Shipper(1253734)
		;~ if(shipperVar == "ASC")
			;~ Shipper(0811990)
		;~ if(shipperVar == "NYS")
			;~ Shipper(0691879)
		;~ if(shipperVar == "H&C")
			;~ Shipper(0797432)
		;~ if(shipperVar == "T&B")
			;~ Shipper(0797431)
		;~ if(shipperVar == "KU")
			;~ Shipper(0507923)
		;~ if(shipperVar == "TTS")
			;~ Shipper(0507922)
		;~ if(shipperVar == "RUS")
			;~ Shipper(0507919)
	;~ }

Consignee()
;~ if(!bIsBlank("Consignee"))
	;~ Send {Enter}
;~ else
	;~ CloseSearch()

ThirdParty()

SignedFor("SLC")
BOL(003)
Verify("BOL",8)

	Select("PO")
	CLEAR("PO")
;~ PO(AskUser("PO?",Copy("PO")))
SelectMany(190,620,418,704)

;~ BLANKTABLE(5)
;AddItem(1,Copy("HU"),"DAMPERS SHUTTERS OR LOUVERS",70,COPY("TOTALWEIGHT"))
;~ Quantity(1,(Copy("HU")))
Description(1,"DAMPERS SHUTTERS OR LOUVERS")
Weight(1,Get("TotalWeight"))

Description(3,AskUser("NAME"))

}

039STANDARD()
{
SEND PREPAID {ENTER}
SHIPPER(1043549)
CLOSESEARCH()
THIRDPARTY()

SIGNEDFOR(ASKUSER("SIGNED FOR:"))
BOL(,619,451)
PO(,115,454)

COPY("QUANTITY")
BLANKTABLE(6)
SLEEP 500
AddItem(1,ASKUSER("QUANTITY:",CLIPBOARD),"SHEETS , PILLOW CASES , TOWELS , WASHCLOTHS , DRAPERY & DRY GOODS , NOI",100,COPY("TOTALWEIGHT"))

TotalPieces(CalculateTotalPieces())
send {enter}

}