
::048C::
048CUI()
return

048CUI()
{
	Send Prepaid{Enter}

	Shipper(0714361)
	if(bIsBlank("Consignee"))
		CLOSESEARCH()
	ELSE
		Consignee()

	ThirdParty()

	SignedFor(AskUser("Signed For:"))
	BOL(14)
	SLEEP 100
	VERIFY("bOL",6)

	Select("PO")
	DeleteLine(3)
		SelectMany(235,320,448,368)

	CleanUpCell(1)

	Send {Down}
	DeleteLine()
	TotalPieces(CalculateTotalPieces())
	
	Select("Class",2)
}


;VERY BETA
;~ ::048ATT::
;~ 048ATT()
;~ return

;~ 048ATT()
;~ {
	;~ Send COLLECT, {Enter}
	;~ Shipper(1075816)

	;~ Select("Consignee")
	;~ CloseSearch()
	;~ Send {Tab 3}
	;~ IF(bIsBlank())
	;~ {
		;~ Select("Consignee")
		;~ WinWaitActive, Consignee search
		;~ WinWaitClose, Consignee search	
	;~ }
	;~ else
	;~ {
		;~ Select("Consignee")
		;~ WinWaitActive, Consignee search, Search String,,3
		;~ Send {Home}AT and T{Space}{Enter}
		;~ Sleep 500 ; wait for the search to happen

		;~ Send {Tab}{Down}{Tab 2}{Enter} ;select the first address
		;~ WinWaitClose, Consignee search
		;~ Send {Enter}
	;~ }

	;~ SignedFor(AskUser("Signed For:"))

	;~ BOL(AskUser("BOL"))
	;~ PO(,150,582)
	;~ Verify("PO",7)

	;~ BlankTable(5)
	;~ AddItem(1,Copy("HU"),"Batteries",70,Copy("TotalWeight"))
	;~ AddItem(2,,,"DNDS")
	;~ Select("BOL")
	;~ DeleteLine(2)
;~ }

::048L::
048L()
return

048L()
{
	Send Prepaid{ENTER 2}
	CloseSearch(0.35)
	SEND {ENTER 5}
	Select("ThirdParty")
	Send {ENTER}
	SignedFor(AskUser("Signed For:"))

	REF(,636,376)
	SLEEP 100
	VERIFY("REF",12)
	SEND {ENTER 2}
	SELECT("CONSIGNEE")
}


::048T::
048Tempur()
return

048Tempur()
{
	Send Prepaid{Enter}
	Shipper(1070067)		;aka tempur pedic
	CloseSearch()

	if(bIsBlank("Consignee"))
	{		
		ControlGetText,Phone,%ConsigneePhoneField%,Brain
		
		;Did the bill pull in a phone number?
		if(Phone)
		{	
			;These phone number are all shared by one company so multiple addresses will be matched with them--override
			if(Phone == "608-323-6007" 			
			OR Phone == "843-656-0785" 
			OR Phone == "303-534-2136"
			OR Phone == "706-243-4877" 
			OR Phone == "662-869-5136"
			OR Phone == "516-844-8847"
			OR Phone == "706-323-2337"
			OR Phone == "512-891-0714"
			OR Phone == "910-397-7636"
			OR Phone == "865-681-2849"
			OR Phone == "205-733-0991")
			InputBox, Phone, Search Manually, Eh.. these have a lot of addresses, enter address.
			
			;if this worthless program picks up the shipper phone number--override
			IF(Phone == "864-277-5292")
			InputBox, Phone, Search Manually, The program pulled in the stupid Shipper phone, enter address.
		}
		
		;No phone number was pulled into the consignee phone number box
		else		
			InputBox, Phone, Search Manually, Search for an address.

		;Now find the address based on the phone number or some search string
		FindAddress(Phone)
	}
	
	;the bill already pulled in the account so just enter it
	else
		Consignee()
	
	if(bisblank("Consignee"))
		CONTROLFOCUS,%ConsigneeCityField%,Brain
		Send {Del}
	
	THIRDPARTY()


	SignedFor("NS")
	;~ SignedFor(AskUser("Signed For:"))

	Select("BOL")
	DeleteLine(1)
	SLEEP 1000
	VERIFY("BOL",10)
	Send {Enter}

	DeleteLine(2)
	Select("PO")
		
	Loop
	{
		SelectMany(85,526,392,622)
		if(bHasAnotherPage())
		{
			Send ^{PGDN}
			sleep 250
		}
		else
		{
			sleep 250
			Send ^{home}
			break	
		}
	}
	
InputBox,rqbyinput,Date,When?	
	if(RQBYINPUT)
	{
		addcode("RQAD")		
		WinWait, Requested Delivery Date

		Send %rqbyinput%{Enter}
		WinWaitClose, Requested Delivery
	}	

InputBox,callinput,Time,Call?,,200,125
	if(callinput)
	{
		addcode(callinput)
		sleep 500
		
		InputBox,phonedesc,Phone,Phone?,,200,125
		;~ DESCLINE := FindBlankCell("Description")
		;~ send %phonedesc%
		Description(FindBlankCell("Description"),phonedesc)
		 ;~ Description(5,%phonedesc%)
	}
	
	Select("HM")
	Loop,11
	{
		Delete()
		Send {Down}
	}
	SLEEP 100
	
	;if there is a consignee account number in the box

	
	Select("Quantity")
}

::048E::
048Esab()
return

048Esab()
{
	Send Prepaid{enter}
	Shipper(0994681)
	;~ closeSearch()
	Consignee()
	ThirdParty(0499400)
	;~ SignedFor(ASKUSER("SIGNED FOR:"))
	SIGNEDFOR(COPY("TOTALPIECES")"PT")
	Verify("Bol",4)

	BLANKTABLE(5)
	AddItem(1,Copy("HU"),"WELDING BARS",50,COPY("TOTALWEIGHT"))

	Select("Consignee")
}


::048M::
048Medical()
return

048Medical()
{
	Send Prepaid{enter}
	Shipper(0932392)
	;~ closeSearch()
	Consignee()
	ThirdParty()

	SIGNEDFOR(COPY("TOTALPIECES")"PL")
	
	BOL(,820,265)
	Verify("Bol",8)
	
	PO(,200,345)

	Description(1,"MEDICAL PRODUCTS AND / OR COATED")
	Class(1,150)
	Weight(1,Get("TotalWeight"))
	
	if(!bIsBlank(Description,2))
	{
		SELECT("Description",2)
		DeleteLine()
	}
	
;~ InputBox,callinput,Time,Call?,,200,125
	;~ if(callinput)
	;~ {
		;~ AddCode(%callinput%)
		;~ if(callinput == "appt" or callinput == "call24" or callinput == "call48" or callinput == "call72" or callinput == "cbd")
		;~ {
			;~ sleep 200
			;~ InputBox,phonedesc,Phone,Phone?,,200,125
			;~ Description(FindBlankCell("Description"),%phonedesc%)
		;~ }		
	;~ }

	TotalPieces(CalculateTotalPieces())
	Select("Consignee")
}

048M()
{
	Send prepaid{enter}
	Shipper(1159624)
	CloseSearch()
	
	ThirdParty()
	SignedFor(aSKuSER("sIGNED FOR:"))
	
	Select("BOL")
	DeleteLine(5)
	AddLine(3)
	BOL("2U7")
	sleep 250
	VERIFY("BOL",11)
	
	Select("PO")
	DeleteLine(5)
	AddLine(5)
	
	REF(,626,442)
	sleep 250
	VERIFY("REF",7)
	
	BLANKTABLE(8)
	SLEEP 250
	AddItem(1,Copy("HU"),"TIRES",110,COPY("TOTALWEIGHT"))
	sleep 250
	AddCode("PSA")
	AddCode("SLC")
	AddCode("RQBY")
}

048Gap()
{
	Send Prepaid {Enter}
	Shipper(0339128)
	closesearch()
	Consignee()
	ThirdParty()
	
	SignedFor(AskUser("Signed?"))
	
	Clear("BOL")
	BOL(,290,538)
	Clear("PO")
	PO(,315,560)	

	BlankTable(5)
	AddItem(1,Copy("HU"),"Fluted Corrugated Forms",70,COPY("TOTALWEIGHT"))
}

048Lindstrom()
{
	Send Prepaid {Enter}
	Shipper(0235682)
	Consignee()
	ThirdParty()
	
	Clear("BOL")
	BOL(,748,155)
	
	BlankTable(5)
	AddItem(1,Copy("HU"),"NUTS AND BOLTS",50,COPY("TOTALWEIGHT"))
}


