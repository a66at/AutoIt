#include <ScreenCapture.au3>

$Var = 10130
$Cvar = 32

Do
	$sTitle = 'Search for contacts'

	Opt("MouseCoordMode", 0)

	$hWin = WinWait($sTitle, '', 1)
	WinActivate($hWin)
	WinSetState($hWin, '', @SW_SHOW)
	Sleep(500)
	MouseClick("", 270, 83, 1)
	Sleep(500)
	Send("^a")
	Sleep(400)
	Send("{DEL}")
	Sleep(400)
	Send("aaaa")
	Sleep(1000)
	Send("{ENTER}")
	Send("^a")
	Sleep(400)
	Send("{DEL}")
	Send("aaaa"" or users.id=" & $Var & " -- 123")
	Sleep(400)
	Send("{ENTER}")
	Sleep(5000)
	$aPos = WinGetPos("Search for contacts")
	_ScreenCapture_Capture("./img" & $Cvar & ".png",$aPos[0]+17,  $aPos[1]+133, $aPos[0]+334, $aPos[1]+173,0)
	Sleep(1000);
	 
	$Var = $Var + 1
	$Cvar = $Cvar + 1
Until $Cvar>122
