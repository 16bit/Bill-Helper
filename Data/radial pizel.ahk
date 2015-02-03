SetBatchLines, -1 ; HIGHLY RECOMMENDED

MouseGetPos, StartX, StartY

#q::
Loop, 70
{
  ; Params: color , input x , input y , range , output x , output y [, PixelGetColor options]
  ; ATTETION: works with BGR values unless "RGB" is specified
  ;~ If !PixelRadialMatch( 0xFFFFFF , StartX , StartY , A_Index-1 , OutX , OutY )
    If !PixelRadialMatch( Px , Py , StartX , StartY ,A_Index-1 , 0xFFFFFF )
    Break
  ; Returned values: 0 = success , 1 = PixelGetColor failed , 2 = color not found
  OutX := OutY := ""
}

MsgBox Coords: %OutX% , %OutY%
mousemove,%OutX%,%OutY%

Return
	;~ pixelsearch,outx,outy,x1,y1,x2,y2,color,var,fast
;----------------------------------------------------------------------------------------
PixelRadialMatch(ByRef Px,ByRef Py,X1,Y1,radius,Color,p_opts="")
;~ PixelRadialMatch(Color,X1,Y1,radius,ByRef Px,ByRef Py,p_opts="")
{
  radius := l_Xoff := l_Yoff := (-1) * ( l_lim := Abs(radius) )
  Loop, % (l_lim*2)+1
  {
    If ( Abs(l_Yoff) = l_lim )
      Loop, % (l_lim*2)+1
      {
        PixelGetColor, l_output, % X1 + l_Xoff, % Y1 + l_Yoff, p_opts
        If ( l_output = Color ) OR ErrorLevel
          Return ErrorLevel, Px := X1 + l_Xoff , Py := Y1 + l_Yoff
        l_Xoff++
      }
    Else
      Loop, 2
      {
        PixelGetColor, l_output, % X1 + l_Xoff, % Y1 + l_Yoff, p_opts
        If ( l_output = Color ) OR ErrorLevel
          Return ErrorLevel, Px := X1 + l_Xoff , Py := Y1 + l_Yoff
        l_Xoff *= -1
      }
    l_Xoff := radius , l_Yoff++
  }
  Return 2
}