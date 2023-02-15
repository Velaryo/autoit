#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\INTRO\logo\LOGO_recortado_sin_fondo_ico.ico
#AutoIt3Wrapper_Res_CompanyName=PSPC
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
AutoItSetOption("MouseCoordMode", 0)
AutoItSetOption("SendKeyDelay", 10)
#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

;;;;;;;;;;;;;; TOOL TIP;;;;;;;;;;;;;;;
$x = @DesktopWidth-300
$y = @DesktopHeight-120
ToolTip("Instalando W.- E.S...", $x, $y, "F-/B-: PSPC", 1 )
;;;;;;;;;;;;;; fin tooltip

;;;;;;;;;;;;;;;;;;;;;;;;;;;; 11111111 ;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;; ABRE INSTALADOR;;;;;;;;;;;;;;;
Run(@ScriptDir & "\W.-_embro_Setup.exe", "")
Sleep(300)

; no lo uso xq parece q el pid se refresca cada vez q se cambia de ventana, lo estatico es el titulo
;~ $hWnd_INSTALL = WinWaitActive("W.- embro - InstallShield Wizard")
$titulo_INSTALL = "W.- embro - InstallShield Wizard"

$cont_1 = 1

While($cont_1 = 1)

;~ 	$boton_siguiente_1 = ControlCommand($titulo_INSTALL, "", "Button1", "IsVisible");bienvenida
 	$data_Gather = ProcessExists("DataGather.exe")
;~ 	$boton_siguiente_2 = ControlCommand($titulo_INSTALL, "", "Siguiente", "IsVisible");terminos y cond.
;~ 	$boton_siguiente_3 = ControlCommand($titulo_INSTALL, "", "Siguiente", "IsVisible");comple|personalizado
;~ 	$boton_siguiente_4 = ControlCommand($titulo_INSTALL, "", "Button2", "IsVisible") ;idioma
;~ 	$boton_siguiente_5 = ControlCommand($titulo_INSTALL, "", "Button1", "IsVisible") ;ruta
;~ 	$boton_instalar = ControlCommand($titulo_INSTALL, "", "Button1", "IsVisible") ;instalar

	$texto_2 = ControlGetText($titulo_INSTALL, "", "Static2")
	$texto_3 = ControlGetText($titulo_INSTALL, "", "Static3")
	$texto_4 = ControlGetText($titulo_INSTALL, "", "Static4")
	$texto_5 = ControlGetText($titulo_INSTALL, "", "Static5")
	$texto_6 = ControlGetText($titulo_INSTALL, "", "Static6")
	$texto_7 = ControlGetText($titulo_INSTALL, "", "Static7")


	If $texto_3 == "Bienvenido a InstallShield Wizard de W.- embro" Then
		ControlClick($titulo_INSTALL, "", "Button1")
	EndIf

	If $texto_2 == "Contrato de licencia" Then
		ControlClick($titulo_INSTALL, "", "Button3")
		ControlClick($titulo_INSTALL, "", "Button1")
	EndIf

	Select
		Case $data_Gather
			ProcessClose("DataGather.exe")
	EndSelect

	If $texto_6 == "Seleccione el tipo de instalaci�n que desea realizar." Then
		ControlClick($titulo_INSTALL, "", "Button4")
	EndIf

	If $texto_7 == "Idiomas extra" Then
		ControlClick($titulo_INSTALL, "", "Button2")
	EndIf

	If $texto_5 == "Elegir ubicaci�n de destino" Then
		ControlClick($titulo_INSTALL, "", "Button1")
	EndIf

	If $texto_4 == "Preparado para instalar el programa" Then
		ControlClick($titulo_INSTALL, "", "Button1")
	EndIf

	If WinActive("Security Error") Then
		ControlClick("Security Error", "", "Button1")
	EndIf

	If $texto_4 == "InstallShield Wizard completo" Then
		ControlClick($titulo_INSTALL, "", "Button2")
		ControlClick($titulo_INSTALL, "", "Button4")

		Sleep(1000)
		$cont_1 = 0
	EndIf

	If $texto_4 == "Mantenimiento finalizado" Then
		ControlClick($titulo_INSTALL, "", "Button2")
		ControlClick($titulo_INSTALL, "", "Button4")

		Sleep(1000)
		$cont_1 = 0
	EndIf

	Sleep(2000)
WEnd
;;;;;;;;;;;;;; fin instalador


;;;;;;;;;;;;;; ABRE UPDATE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Sleep(3000)
Run(@ScriptDir & "\W.-embro_Update.exe", "")
Sleep(300)

$titulo_UPDATE = "W.- embro - InstallShield Wizard"

$cont_2 = 1

While($cont_2 = 1)

	$data_Gather = ProcessExists("DataGather.exe")
	$texto_2 = ControlGetText($titulo_UPDATE, "", "Static2")
	$texto_3 = ControlGetText($titulo_UPDATE, "", "Static3")
	$texto_4 = ControlGetText($titulo_UPDATE, "", "Static4")
	$texto_5 = ControlGetText($titulo_UPDATE, "", "Static5")
	$texto_6 = ControlGetText($titulo_UPDATE, "", "Static6")
	$texto_7 = ControlGetText($titulo_UPDATE, "", "Static7")

	If $texto_3 == "Bienvenido a InstallShield Wizard de W.- embro" Then
		ControlClick($titulo_UPDATE, "", "Button1")
	EndIf

	Select
		Case $data_Gather
			ProcessClose("DataGather.exe")
	EndSelect

	If $texto_7 == "Idiomas extra" Then
		ControlClick($titulo_UPDATE, "", "Button2")
	EndIf

	If $texto_4 == "Preparado para instalar el programa" Then
		ControlClick($titulo_UPDATE, "", "Button1")
	EndIf

		If WinActive("Security Error") Then
		ControlClick("Security Error", "", "Button1")
	EndIf

	If $texto_4 == "InstallShield Wizard completo" Then
		ControlClick($titulo_UPDATE, "", "Button2")
		ControlClick($titulo_UPDATE, "", "Button4")

		Sleep(1000)
		$cont_2 = 0
	EndIf

	If $texto_4 == "Mantenimiento finalizado" Then
		ControlClick($titulo_UPDATE, "", "Button2")
		ControlClick($titulo_UPDATE, "", "Button4")

		Sleep(1000)
 		$cont_2 = 0
	EndIf

	If $texto_4 == "La actualizaci�n ha finalizado" Then
		ControlClick($titulo_UPDATE, "", "Button2")
		ControlClick($titulo_UPDATE, "", "Button4")

		Sleep(1000)
		$cont_2 = 0
	EndIf

	Sleep(2000)

WEnd ;;;;;;fin update
Sleep(2000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;; 2222222222 ;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;; EMULADOR;;;;;;;;;;
$origen = @ScriptDir & "\C-\emulator\hid.dll"
$destino_64 = "C:\Program Files\W.-\embro\BIN"
$destino_32 = "C:\Program Files (x86)\W.-\embro\BIN"

if (@OSArch = "X86") Then
	FileCopy($origen, $destino_32)
Else
	FileCopy($origen, $destino_64)
EndIf
;;;;;;;;;;;;; fin emulador

Sleep(2000)

;;;;;;;;;;;;;;;;;;; HWID ;;;;;;;;;;;;;;;;;;
Run(@ScriptDir & "\C-\HWID.exe", "")
WinWaitActive("HWID Reader v.1.2")

$HWID_C- = InputBox("C-", "Copiar el 'Hardware ID y pegarlo aqu�' ")
Sleep(1000)

$cont_3 = 1
While $cont_3 = 1
	if $HWID_C- = "" Then
		MsgBox(0, "", "PEGUE EL Hardware ID de la ventana 'HWID Reader'")
		$HWID_C- = InputBox("C-", "Copiar el 'Hardware ID y pegarlo aqu�' ")

		if Not $HWID_C- = "" Then
			$cont_3 = 0
			ProcessClose("HWID.exe")
		EndIf
	Else
		$cont_3 = 0
		ProcessClose("HWID.exe")
	EndIf

WEnd
Sleep(500)
;;;;;;;;;;;;;;;;;; fin hwid

;;;;;;;;;;;;;;;;;;; KEYGEN ;;;;;;;;;;;;;;;;;
$user = @ComputerName
Run(@ScriptDir & "\C-\W.-KeyGen.exe", "")
; el winwaitactive lleva ese titulo xq as� lo lleva el keygen
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Sleep(1000)
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send("2",1)
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send("{ENTER}")
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Sleep(500)
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send($user, 1)
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send("{ENTER}")
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send($HWID_C-, 1)
WinWaitActive(@ScriptDir & "\C-\W.-KeyGen.exe")
Send("{ENTER}")
;verificaci�n
MsgBox(0, "", "Verificar la informaci�n ingresada")
MsgBox(0, "", "Nombre del disp.Usuario: " & $user & @CRLF & "HWID: " & $HWID_C-)
;cierra proceso del keygen
ProcessClose("W.-KeyGen.exe")
;;;;;;;;;;;;;;;; fin keygen

;;;;;;;;;;;;;;;;;;;;; PEGAR SN EN BIN ;;;;;;;;;;;
$origen = @ScriptDir & "\C-\SN.txt"
$destino_64 = "C:\Program Files\W.-\embro\BIN"
$destino_32 = "C:\Program Files (x86)\W.-\embro\BIN"

if (@OSArch = "X86") Then
	FileCopy($origen, $destino_32)
Else
	FileCopy($origen, $destino_64)
EndIf
;;;;;;;;;;;;;;;;;;;; fin pegar sn

;;;;;;;;;;;;;;;;;;;; VERIFICAR COPIAS DE ARCHIVOS A BIN
	$verificar_hid_x64 = "C:\Program Files\W.-\embro\BIN\hid.dll"
	$verificar_sn_x64 = FileExists("C:\Program Files\W.-\embro\BIN\SN.txt")
	$verificar_hid_x32 = "C:\Program Files (x86)\W.-\embro\BIN\hid.dll"
	$verificar_sn_x32 = FileExists("C:\Program Files (x86)\W.-\embro\BIN\SN.txt")

	if $verificar_hid_x32 Or $verificar_hid_x64 Then
		$resp = "HID:   OK" & @CRLF
	Else
		$resp = "HID:   FAIL" & @CRLF
	EndIf

	if $verificar_sn_x32 or $verificar_sn_x64 Then
		$resp = $resp & "SN:   OK"
	Else
		$resp = $resp & "SN:   FAIL"
	EndIf

MsgBox(0, "RESULTADO DE LA COPIA", $resp)
;;;;;;;;;;;;;;;;;;;;; fin verificaci�n copia a bin


;;;;;;;;;;;;;;;;;;;;;;;;;;;; 33333333333333 ;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;; RUTAS ABSOLUTAS
$ruta_1 = "C:\Program Files\W.-\"
$ruta_2 = "C:\Program Files (x86)\W.-\"
$ruta_3 = "C:\Program Files\Common Files\W.-\"
$ruta_4 = "C:\Program Files (x86)\Common Files\W.-\"
$ruta_5 = "C:\ProgramData\W.-\"

;;;;;;;;;;;;;;;; LISTA LAS RUTAS DE CADA ARCHIVO
$ruta_1_archivos = Archivos($ruta_1)
$ruta_2_archivos = Archivos($ruta_2)
$ruta_3_archivos = Archivos($ruta_3)
$ruta_4_archivos = Archivos($ruta_4)
$ruta_5_archivos = Archivos($ruta_5)

;;;;;;;;;;;;;;;;; BLOQUEA ENTRADA Y SALIDA
If $ruta_1_archivos[0] > 0 Then ; indice 0 tiene el length
	For $i=1 to $ruta_1_archivos[0]

		Firewall_Bloq_Entrada("W.-->" & $ruta_1_archivos[$i], $ruta_1_archivos[$i])
		Firewall_Bloq_Salida("W.-->" & $ruta_1_archivos[$i], $ruta_1_archivos[$i])

	Next
EndIf
If $ruta_2_archivos[0] > 0 Then
	For $i=1 to $ruta_2_archivos[0]

		Firewall_Bloq_Entrada("W.-->" & $ruta_2_archivos[$i], $ruta_2_archivos[$i])
		Firewall_Bloq_Salida("W.-->" & $ruta_2_archivos[$i], $ruta_2_archivos[$i])

	Next
EndIf
If $ruta_3_archivos[0] > 0 Then
	For $i=1 to $ruta_3_archivos[0]

		Firewall_Bloq_Entrada("W.-->" & $ruta_3_archivos[$i], $ruta_3_archivos[$i])
		Firewall_Bloq_Salida("W.-->" & $ruta_3_archivos[$i], $ruta_3_archivos[$i])

	Next
EndIf
If $ruta_4_archivos[0] > 0 Then
	For $i=1 to $ruta_4_archivos[0]

		Firewall_Bloq_Entrada("W.-->" & $ruta_4_archivos[$i], $ruta_4_archivos[$i])
		Firewall_Bloq_Salida("W.-->" & $ruta_4_archivos[$i], $ruta_4_archivos[$i])

	Next
EndIf
If $ruta_5_archivos[0] > 0 Then
	For $i=1 to $ruta_5_archivos[0]

		Firewall_Bloq_Entrada("W.-->" & $ruta_5_archivos[$i], $ruta_5_archivos[$i])
		Firewall_Bloq_Salida("W.-->" & $ruta_5_archivos[$i], $ruta_5_archivos[$i])

	Next
EndIf


;;;;FIN
#Region --- CodeWizard generated code Start ---
;MsgBox features: Title=Yes, Text=Yes, Buttons=OK, Icon=Warning, Modality=System Modal
MsgBox(4144,"todo_instalador","La instalaci�n ha finalizado. " & @CRLF & "Siguientes pasos:" & @CRLF & "- Verificar que los archivos de W.- hayan sido a�adidos" & @CRLF & "       Desde ejecutar: control firewall.cpl" & @CRLF & "       Clic en conf. avanzada." & @CRLF & "- A�adir las carpetas de W.- al antivirus.")
#EndRegion --- CodeWizard generated code End ---

;;;;;;;;;;;;;; FUNCIONES

Func Archivos($ruta="") ;retorna en array el listado de todos los archivos con extension = $ext, en el indice  est� el legth
	$ext = "*.exe;*.dll;*.com;*.bat;*.cmd;*.vbs;*.vbe;*.js;*.jse;*.wsf;*.wsh;*.msc;*.scr;*.msi;*.cpl;*.ocx;*.dll;*.dvr;*.sys;*.py"
    ; A sorted list of all files and folders in the AutoIt installation
    Local $ruta_res = _FileListToArrayRec($ruta, $ext, $FLTAR_FILES, $FLTAR_RECUR, "", $FLTAR_FULLPATH)
;~     _ArrayDisplay($aArray, "titulo") ;imprime array en un listview
;~ 	$conteo = UBound($aArray)-1 ;array.legth
;~ 	$aArray[0] ; array.legth

	Return $ruta_res
EndFunc

Func Firewall_Bloq_Salida($nombre, $path)
    RunWait(@ComSpec & " /c " & "netsh advfirewall firewall delete rule name = " & Chr(34) & $nombre & Chr(34) & " program = " & Chr(34) & $path & Chr(34) & " dir = out", "", @SW_HIDE)
    Run(@ComSpec & " /c " & "netsh advfirewall firewall add rule name = " & Chr(34) & $nombre & Chr(34) & " dir = out action = block program = " & Chr(34) & $path & Chr(34) & " enable = yes", "", @SW_HIDE) ; don't forget " " before "/c"
    Sleep(100)
EndFunc

Func Firewall_Bloq_Entrada($nombre, $path)
    ;msgbox(0,$sName,"netsh advfirewall firewall add rule name = " & $sName & " dir = in action = block program = " & Chr(34)& $sPath & Chr(34)& " enable = yes")
    RunWait(@ComSpec & " /c " & "netsh advfirewall firewall delete rule name = " & Chr(34) & $nombre & Chr(34) & " program = " & Chr(34) & $path & Chr(34) & " dir = in", "", @SW_HIDE)
    Run(@ComSpec & " /c " & "netsh advfirewall firewall add rule name = " & Chr(34) & $nombre & Chr(34) & " dir = in action = block program = " & Chr(34) & $path & Chr(34) & " enable = yes", "", @SW_HIDE) ; don't forget " " before "/c"
    Sleep(100)
EndFunc