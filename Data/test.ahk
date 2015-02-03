
#X::
;~ Select("REF")
;~ Send {UP}
;~ Send ^+I
;~ Send ^+I
;~ Send {DOWN}
;~ SEND {UP}
;~ Send COD 
;~ Send {Down}
;~ Send C.O.D
;~ while (getkeystate("LWIN"))
;~ {
    ;~ Send {Up}
    ;~ sleep 100
    ;~ Send {Down}
    ;~ sleep 100
;~ }
;~ Send {Up}
;~ DELETELINE(1)
;~ ;Send {Down}
;~ DELETELINE(1)
MouseGetPos,Fx,Fy
;~ Fx = 135
;~ Fy = 209
getNearestPixel(Px,Py,Fx,Fy,100,0x000000,0)
if(px)
{
    MouseMove, %Px% , %Py%
}
else
{
    MsgBox No pixel
}   

RETURN

getNearestPixel( ByRef Px , Byref Py , X , Y , r , Color , Variation)
{
    SetBatchLines, -1
    count =
    Start := A_TickCount
    ;~ ;Initial search god willing that is under the middle dot
    ;~ PixelSearch,Px,Py, X , Y , X + 1 , Y + 1 , Color , Variation , Fast    
    ;~ if(Px)
    ;~ {
        ;~ return
    ;~ }

    ;~ else        ;Sadly the pixel was not found at the coords, now we must loop outwards until it is found
    ;~ {

        ;~ Loop % r
        ;~ {
            ;~ count := A_Index
            ;~ ;Search Right
            ;~ PixelSearch,Px,Py, % X+A_Index, Y , % X+A_Index + 1 , Y + 1 , Color , Variation , Fast
                ;~ if(Px)
                    ;~ break
            
            ;~ ;Search Up
            ;~ PixelSearch,Px,Py, X , % Y+A_Index , X + 1 , % Y +A_Index+ 1 , Color , Variation , Fast
                ;~ if(Px)
                    ;~ break
            
            ;~ ;Search Left
            ;~ PixelSearch,Px,Py, % X-A_Index, Y , % X-A_Index + 1 , Y + 1 , Color , Variation , Fast
                ;~ if(Px)
                    ;~ break                  
            
            ;~ ;Search Down
            ;~ PixelSearch,Px,Py, X , % Y-A_Index , X + 1 , % Y-A_Index+ 1 , Color , Variation , Fast
                ;~ if(Px)
                    ;~ break              
        ;~ }
    ;~ }
    
    PixelGetColor,pColor,X,Y
    if(pColor == 0x00000)
        Px := X, Py := Y
        
    else
    {
        Loop % r
        {
            count := A_Index
            PixelGetColor,pColor, % X+A_Index,Y
            if(pColor == 0x00000)
            {
                Px := X+A_Index, Py := Y
                break
            }
            
            PixelGetColor,pColor,X,% Y+A_Index
            if(pColor == 0x00000)
            {
                Px := X, Py := Y+A_Index
                break
            }            
            
            PixelGetColor,pColor, % X-A_Index,Y
            if(pColor == 0x00000)
            {
                Px := X-A_Index, Py := Y
                break
            }            
            
            PixelGetColor,pColor, X,% Y-A_Index
            if(pColor == 0x00000)
            {
                Px := X, Py := Y-A_Index
                break
            }
        }
    }
            end := A_TickCount
        MsgBox % count " PixelSearch calls took " (end - Start) "ms (" (end - start)/count "ms each)"
}

