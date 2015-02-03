CoordMode,Mouse,Screen
CoordMode,Pixel,Screen
SendMode, Input
SysGet, MonitorWorkArea, MonitorWorkArea


;Get ready for a shit ton of variables
global TestField := "WindowsForms10.EDIT.app.0.2bf8098_r13_ad18"

global SVCField := "CdrFieldEdit22"
global ProField := "CdrFieldEdit1"

global TermsField := "#3277020"

global ShipperField := "CdrFieldEdit35"
global ShipperNameField := "CdrFieldEdit17"
global ShipperStreet1Field := "CdrFieldEdit18"
global ShipperStreet2Field := "CdrFieldEdit34"
global ShipperCityField := "CdrFieldEdit19"
global ShipperStateField := "CdrFieldEdit20"
global ShipperZipField := "CdrFieldEdit21"

global ConsigneeField := "CdrFieldEdit37"
global ConsigneeNameField := "CdrFieldEdit2"
global ConsigneeStreet1Field := "CdrFieldEdit3"
global ConsigneeStreet2Field := "CdrFieldEdit38"
global ConsigneeCityField := "CdrFieldEdit4"
global ConsigneeStateField := "CdrFieldEdit5"
global ConsigneeZipField := "CdrFieldEdit6"
global ConsigneePhoneField := "CdrFieldEdit44"

global ThirdPartyField := "CdrFieldEdit40"
global ThirdPartyNameField := "CdrFieldEdit7"
global ThirdPartyStreet1Field := "CdrFieldEdit8"
global ThirdPartyStreet2Field := "CdrFieldEdit41"
global ThirdPartyCityField := "CdrFieldEdit9"
global ThirdPartyStateField := "CdrFieldEdit10"
global ThirdPartyZipField := "CdrFieldEdit11"

global SignedForField := "CdrFieldEdit43"
global SuffixField :=
global QuoteField := "CdrFieldEdit42"

global HUField := "CdrFieldEdit58"
global TotalPiecesField := "CdrFieldEdit12"
global TotalWeightField := "CdrFieldEdit13"


global TermsPos := [1200,120]

global ShipperPos := [1190, 150]
global ShipperWidth = 60
global ConsigneePos := [1190, 280]
global ConsgineeWidth = 60
global ThirdPartyPos := [1190, 440]
global ThirdPartyWidth = 60

global SignedForPos := [1980,95]
global SignedForWidth = 165

global BOLPos := [1250,590]
global BOLWidth = 100
global POPos := [1440,590]
global POWidth = 100
global REFPos := [1630,590]
global REFWidth = 100

global QuantityPos := [1180,746]
global QuantityWidth = 40
global HMPos := [1285,746]
global DescriptionPos := [1624,746]
global DescriptionWidth = 330
global ClassPos := [1752,746]
global ClassWidth = 30
global WeightPos := [1810,746]
global WeightWidth = 40

global HUPos := [1240,690]
global TotalPiecesPos := [1385,690]
global TotalWeightPos := [1568,690]
global CalcWeightPos := [1800,690]

global SuffixPos := [1840,120]

#Persistent
SetTimer, MoveSearch, 250
return

MoveSearch:
WinMove, Consignee search,,1404,277 
return



^!r::
Reload  ; assigns Ctrl Alt r to reload scripts
return

+^B::
;~ BLANKTABLE(7)
;~ AddItem(1,ASKUSER("QUANTITY"),"SHEETS PILLOW CASES",100,COPY("TOTALWEIGHT"))
;~ AddItem(1,COPY("HU"),"NEWSPAPER",150,COPY("TOTALWEIGHT"))
s := "Shipper"
x := 1358514

sleep 500
ControlSend,% %s%Field,^{BackSpace},Brain
ControlSend,% %s%Field,%x%,Brain
return

^M::
SLEEP 250
IF(get("Shipper") = 1051382)
	048L()

IF(get("Shipper") = 0352084)
	039TraneAberdeen()

IF(get("Shipper") = 0994681)
	048Esab()

IF(get("Shipper") = 0491541)
	100Air()

IF(get("Shipper") = 0346627)
	100Innovative()

IF(get("Shipper") = 1070067)
	048Tempur()

IF(get("Shipper") = 0932392)
	048Medical()

IF(get("Shipper") = 0714361)
	048CUI()

IF(get("Shipper") = 0235682)
	048Lindstrom()

IF(get("Shipper") = 0507919 || get("Shipper") = 1253734)
	039Ruskin()

IF(get("Shipper") = 0339128)
	048Gap()

IF(get("Shipper") = 0589057)
	100National()

IF(get("Shipper") = 0591388)
	100Stillwater()

IF(get("Shipper") = 1358514)
	100Paragon()

return

#z::
TotalPieces(CalculateTotalPieces())
return

#s::
MouseClick, LEFT, % A_CaretX,% A_CaretY,2
return

;Functions

#c::
addcode(ASKUSER("CODE?"))
return

^Q::
{
	WinWaitActive, Brainware Distiller Verifier [AVERITT\nferrell - VER] : [VerifierNF.set.dvs - bol.sdp], Cash / Certified Che
	controlfocus, %QuoteField%, Brain
	
	RETURN
}

CloseSearch(T=0.35)
{
	WinWaitActive, Consignee search ,,T	; IF THE WAIT IS SHORTER, IT DOESNT COPY CONSIGNEE NUMBERS WELL.
	WinClose
	WinWaitClose, Consignee search
}
DeleteLine(l = 1)
{
	send +^{D %l%}
}
AddLine(l = 1)
{
	send +^{A %l%}
}
Clear(S)
{
	Select(s)
	DeleteLine(3)
	AddLine(3)
}
BlankTable(n)
{
	SendMode Event
	MouseClick, left,  QuantityPos[1],  QuantityPos[2]
	Sleep, 100
	send +^{D %n%}
	send +^{A %n%}
	SendMode Input
}

Get(s)
{
	if(s = "BOL" or s = "PO" or s = "REF" or s = "Quantity" or s = "Description" or s = "Class" or s = "Weight")
		msgbox,,, you know you cant use %s%
	else
	{
		ControlGetText,OutputVar,% %s%Field,Brain
		return %OutputVar%		
	}
}

Set(s,x)
{
	if(s = "BOL" or s = "PO" or s = "REF" or s = "Quantity" or s = "Description" or s = "Class" or s = "Weight")
		msgbox,,, you know you cant use %s%
	else
	{
		ControlSend,% %s%Field,^{BackSpace},Brain
		sleep 50
		ControlSend,% %s%Field,%x%,Brain
	}
}

Copy(s="",l=1)
{
	clipboard=
	if(s)
	Select(s,l)
	
	if(s == "Consignee")
	CloseSearch()	
	
	Send {Home}+{End}^c
	ClipWait,.25
	
	if(s == "Consignee")
	CloseSearch()
	
	return clipboard	
}
Delete(s="",l=1)
{
	if(s)
	Select(s,l)
	
	if(s == "Consignee")
	CloseSearch()	
	
	Send ^{Backspace}
	
	if(s == "Consignee")
	CloseSearch()
}
bStringInCell(string,s="",l=1)
{
	if(s)
		Select(s,l)
	Copy()	
	
	IfInString, Clipboard, %string%
		return true
	else
		return false
	
}

CleanUpCell(line)
{
	Select("Description",line)
	Select("Description",line)
	SLEEP 100
	Send ^{Del}
}

FindAddress(string)
{	
	AddressFound = false
	if(string)
	{
		Loop, read, AddressBook.csv
		{
			IfInString,A_LoopReadLine,%string%
			{		 
				Loop, parse, A_LoopReadLine, CSV
				stringParse%A_Index% = %A_Loopfield%		;This assigns each value seperated by a comma into an array
				
				MsgBox, 4,, %stringParse1%`n%stringParse2%`n%stringParse3%`n%stringParse4%`n%stringParse6% %stringParse7% %stringParse5%`n%stringParse8%
				IfMsgBox, Yes
					AddressFound = true
				IfMsgBox, No
					continue
				
				Select("Consignee")
				CloseSearch()
				Loop, parse, A_LoopReadLine, CSV
				{
					if A_Index = 1		;if the current field is the account number
						CloseSearch()
					else
						Delete()
					
					send %A_LoopField%
					
					if A_Index = 2
						send {Tab 2} 	;if we are at the Name part of the consignee, press tab twice to skip the plant field
					else
						send {Tab}
				}
				break ;This should break out if  address was found
			}
		}
		
		if AddressFound = false
		{	
			
			MsgBox, 4, , Couldn't find an account at %string% boss, want to add it?
			IfMsgBox, Yes
				AddAddress()			
		}
	}
}
AddAddress()
{	
	Select("Consignee")
	CloseSearch(0.35)
	
	Loop, 8
	{
		Copy()
		
		if A_Index = 1
		{
			CloseSearch(0.35)
			FileAppend,
			(
			`n%Clipboard%,
			),048TempurAddress.txt
		}
		else if (A_Index > 1 && A_Index < 8)
		{	
			FileAppend,
			(
			%Clipboard%,
			),048TempurAddress.txt
		}
		else
		FileAppend,		
		(
		%Clipboard%
		),048TempurAddress.txt
		
		if A_Index = 2
			send {Tab 2}
		else			
			send {Tab}		
	}
}
CalculateTotalPieces()
{
	Select("Quantity",1)
	AddLine(1)
	Loop
	{		
		Copy()
		if(clipboard)
		{
			sum += %clipboard%
			Send {Down}
		}
		
		else
		return sum
	}
}
Verify(s,n,l=1)
{
	Select(s,l)

	OldString := Copy()

	;Gets rid of spaces
	StringReplace, NewStr,OldString, %A_SPACE%, , All	

	if(NewStr)
	{
		if(StrLen(NewStr) < n)
		{
			InputBox,input,Replace Field,%NewStr% looks a little small,,200,125,,,,,%NewStr%
			if ErrorLevel = 0
			if(input)
			NewStr := input
		}
	}
	
	else
	{
		InputBox,input,Enter Field,Nothing detected,,200,125
		if ErrorLevel = 0
		if(input)
		NewStr := input
	}		
	
	Send %NewStr%			
}
AskUser(s = "User Input",v = "")
{
	InputBox,input,%s%,%s%,,200,125,500,200,,,%v%
	WinWaitClose,%S%
	return input
}
GetCaret()
{
	;Is the Caret in BOL?
	if(A_CaretX > 1125 && A_CaretX < 1290 && A_CaretY < 680)
		return "BOL"
	
	;Is the Caret in po?
	if(A_CaretX > 1320 && A_CaretX < 1480 && A_CaretY < 680)
		return "PO"

	;Is the Caret in ref?
	if(A_CaretX > 1500 && A_CaretX < 1670 && A_CaretY < 680)
		return "REF"
	
	;Is the Caret in Quantity?
	if(A_CaretX > 1130 && A_CaretX < 1196 && A_CaretY > 680)
		return "Quantity"

	;Is the Caret in Description?
	if(A_CaretX > 1293 && A_CaretX < 1645 && A_CaretY > 680)
		return "Description"

	;Is the Caret in Class?
	if(A_CaretX > 1722 && A_CaretX < 1771 && A_CaretY > 680)
		return "Class"
	
	;Is the Caret in Weight?
	if(A_CaretX > 1772 && A_CaretX < 1830 && A_CaretY > 680)
		return "Weight"
}
bHasAnotherPage()
{
	ImageSearch, FoundX, FoundY, 500, 51, 800, 74, Templates\NextPageGreen.bmp
	if ErrorLevel = 2
		return false
	else if ErrorLevel = 1
		return false
	else
		return true
}
bIsBlank(s="",l=1)
{	
	if(s)	;if a specified field was entered to be searched
	{
		;If its in the table
		if(s = "BOL" or s = "PO" or s = "REF" or s = "Quantity" or s = "Description" or s = "Class" or s = "Weight")
		{
			;~ Select(s,l)
			;~ Copy()
				
			PixelSearch,Px,Py,	% %s%Pos[1] - %s%Width,		% %s%Pos[2] + (17 * (l - 1)) - 5,	% %s%Pos[1] ,		% %s%Pos[2] + (17 * (l - 1)), 0x000000,50,Fast
			if(Px)
				Return false
			else
				return true
		}
		
		;if its not in the table, get the control and look at that
		else
		{
			ControlGetText, OutputVar,% %s%Field, Brainware
				if(OutputVar)
					return false
				else
					return true		
		}
	}
	
	;if there is no cell to look at, look around the caret which should be in a cell
	else
	{		
		pixelsearch,PxRight,PyRight,(A_CaretX - 6),A_CaretY,(A_CaretX - 6) + 10,A_CaretY+10,0x000000,50,Fast
		pixelsearch,PxLeft,PyLeft,(A_CaretX - 20),A_CaretY,(A_CaretX - 20) + 10,A_CaretY+10,0x000000,50,Fast

		If(PxRight || PxLeft)
			return false
		else
			return true
		
		;~ if(clipboard)
			;~ return FALSE
		;~ else
			;~ return TRUE
	}		
}
bBottomofTable()	;Does a pixel search of the number column on the table, if it isn't white there is more below it.
{

	pixelsearch,Px,Py,1122,942,1124,944,0xF0F0F0,0,Fast
	if(Px)
		return true
	else
		return false
}
FindBlankCell(s)
{
	MaxRows = 12 		;Number of rows on a single page, should always be 12 unless an update changes it.
	;~ Select(s)
	AddLine(1)
	;~ Loop
	;~ {
		;~ if(!bIsBlank())
		;~ {
			;~ Send {Down}
			;~ continue
		;~ }
		;~ else
		;~ break
	;~ }
	
	loop
	{
		;If we haven't reached the bottom of the page yet 
		if(A_Index < MaxRows)
		{
			if(bIsBlank(s,A_Index))
			{
				return A_Index
				break
			}
		}
		else
		{
			mouseclick,Left,2050,940	;replace this with the control click when you get the control name
			if(!bBottomofTable())
			{
				if(bIsBlank(s,(A_Index - (A_Index - MaxRows))))
				{
					return A_Index - MaxRows
					break
				}
			}
		}		
	}
}
Select(s,l=1)
{
	if(s == "Quantity" or s == "Description" or s == "Class" or s == "Weight" or s == "HM")
	MouseClick, left, %s%Pos[1] , %s%Pos[2] + (17 * (l - 1))
	else
	MouseClick, Left, %s%Pos[1], %s%Pos[2]
	;ControlFocus,%s%Field,Brain
	sleep 10
}
SelectMany(x1,y1,x2,y2)
{
	SendMode EVENT
	MouseClickDrag,Left,x1,y1,x2,y2,12
	InsertColumn(x1,y1)
	SendMode INPUT
}

InsertColumn(x,y)
{
	SendMode EVENT
	MouseClick, right, x+25,y+13
	Sleep, 100
	MouseClick, left, x+25+34,y+13-39
	Sleep, 100
	SendMode INPUT
}

Terms(n) ;This never seems to work, fix later
{
	Select("Terms")
	Send %n%{Enter}
	;ControlSetText, %TermsField%, %n%, brain
}
Shipper(n="")
{
	;~ if(n)
		;~ Set("Shipper",n)
	Select("Shipper")
	
	if(n)		;if I specified a specific account enter it
	{
		Delete()
		Send %n%
		;~ Send {Enter}
	}
	
	if(!bIsBlank("Consignee"))
		Send {Enter}	
	else
		Send {Enter}
		CloseSearch()
}
Consignee(n="")
{
	Select("Consignee")
	closesearch()
	
	if(n)		;if I specified a specific account enter it
	{
		Delete()
		Send %n%
		Send {Enter}
	}	
	
	else		;If I didn't specify an account and there is already an account pulled in.
	{
		if(!bIsBlank("Consignee"))
			Send {Enter}	
	}
}
ThirdParty(n="")
{
	Select("ThirdParty")
	
	if(n)
	{
		Delete()
		Send %n%
	}
	Send {Enter}
}
SignedFor(S) ;no problems
{
	Select("SignedFor")
	Delete()
	IF(S)
		Send %s%{Enter}
	else
		SEND NS {ENTER}
}
BOL(S="",x=0,y=0) ; this works most of the time, problems usually arise with numbers not being in the same spot most of the time
{
	Select("BOL")
	Delete()
	
	;let the program find it
	if(s)
		Send %s%{Enter}
	
	;or click on the document
	Else
	{
		PixelSearch,Px,Py,x,y,x+40,y+40,0x000000,2,Fast
		MouseClick,left,%Px%,%Py%,15
	}
}
PO(S="",x=0,y=0) ; see BOL()
{
	Select("PO")
	Delete()	
	if(s)
		Send %s%{Enter}
	Else
	{
		PixelSearch,Px,Py,x,y,x+30,y+30,0x000000,2,Fast
		MouseClick,left,%Px%,%Py%,15
	}
}
REF(S="",x=0,y=0) ;Rarely used.
{
	Select("REF")
	Delete()
	if(s)
		Send %s%{Enter}
	Else
	{
		PixelSearch,Px,Py,x,y,x+30,y+30,0x000000,2,Fast
		MouseClick,left,%Px%,%Py%,15
	}
}
Quote(x,y) ;since the program doesn't auto complete quotes, these have to be entered by clicking
{
	controlfocus,%QuoteField%,Brain
	Delete()
	PixelSearch,Px,Py,x,y,x+30,y+30,0x000000,2,Fast
	MouseClick,left,%Px%,%Py%,15
}

Quantity(line,quantity)
{
	Select("Quantity",line)
	Delete()
	Send %quantity%
}
Description(line,description)
{
	Select("Description",line)
	Delete()
	Send %description%
}
Class(line,class)
{
	Select("Class",line)
	Delete()
	Send %class%
}
Weight(line,weight)
{
	Select("Weight",line)
	Delete()
	Send %weight%
	
	If(clipboard == weight)
	Select("CalcWeight")
}
TotalPieces(n) ;This works maybe 50% of the time, depends on the bill
{

	controlsend,%TotalPiecesField%,^{BackSpace},Brain
	sleep 250
	controlsend,%TotalPiecesField%,%n%,Brain
	;~ set("TotalPieces",n)
}

AddItem(line = 1,quantity = "",description = "",class = "",weight = "")
{
	Quantity(line,quantity)
	Description(line,description)
	Class(line,class)
	Weight(line,weight)
}

;still wip
AddCode(code, line = "")
{
	;enter the code on the specified line or find a blank cell
	if(line)
		Class(line,code)
	else
		Class(FindBlankCell("Class"),code)

	send {down}
	
}

#include test.ahk
#include 039.ahk
#include 048.ahk
#include 100.ahk


::000d::

	Send Prepaid{enter}
	if(!bIsBlank("Shipper"))
		Shipper()
	else
	{
		Controlsend,%ShipperNameField%,"Duplicate",Brain
		Controlsend,%ShipperStreet1Field%,"Duplicate",Brain
		Controlsend,%ShipperCityField%,"Cookeville",Brain
		Controlsend,%ShipperStateField%,"TN",Brain
		Controlsend,%ShipperZipField%,38501,Brain
	}
	closeSearch()
	
	if(!bIsBlank("Consignee"))
		Consignee()
	else
	{
		mouseclick,left,1245,273
		Controlsend,%ConsigneeNameField%,Duplicate,Brain
		Controlsend,%ConsigneeStreet1Field%,Duplicate,Brain
		Controlsend,%ConsigneeCityField%,Livingston,Brain
		Controlsend,%ConsigneeStateField%,TN,Brain
		Controlsend,%ConsigneeZipField%,38570,Brain
	}	

	Thirdparty()

	SIGNEDFOR(COPY("TOTALPIECES")"PT")


	BLANKTABLE(5)
	SLEEP 250
	AddItem(1,Copy("HU"),"DUPLICATE DUPLICATE DUPLICATE",150,COPY("TOTALWEIGHT"))




