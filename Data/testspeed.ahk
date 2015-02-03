SetBatchLines, 500ms
Start := A_TickCount
count = 25
Loop, % count
{
   PixelGetColor, var, 1, 1,alt
   mousemove,100+A_Index, 100+A_Index
}
end := A_TickCount
MsgBox % count " PixelGetColor calls took " (end - Start) "ms (" (end - start)/count "ms each)" A_BatchLines
exitapp