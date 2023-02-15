#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\INTRO\logo\LOGO_recortado_sin_fondo_ico.ico
#AutoIt3Wrapper_Res_CompanyName=PSPC
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
AutoItSetOption("MouseCoordMode", 0)
AutoItSetOption("SendKeyDelay", 10)

;;;;;;;;;;;;;; TOOL TIP;;;;;;;;;;;;;;;
$x = @DesktopWidth-300
$y = @DesktopHeight-120
ToolTip("Instalando w.- E.S e4.2...", $x, $y, "F-/B-: PSPC", 1 )
;;;;;;;;;;;;;; fin tooltip

;;;;;;;;;;;;;; EMULADOR;;;;;;;;;;
$origen = @ScriptDir & "\crk\emulator\hid.dll"
$destino_64 = "C:\Program Files\w.-\embro\BIN"
$destino_32 = "C:\Program Files (x86)\w.-\embro\BIN"

if (@OSArch = "X86") Then
	FileCopy($origen, $destino_32)
Else
	FileCopy($origen, $destino_64)
EndIf
;;;;;;;;;;;;; fin emulador

Sleep(2000)

;;;;;;;;;;;;;;;;;;; HWID ;;;;;;;;;;;;;;;;;;
Run(@ScriptDir & "\crk\HWID.exe", "")
WinWaitActive("HWID Reader v.1.2")

$HWID_crk = InputBox("crk", "Copiar el 'Hardware ID y pegarlo aquí' ")
Sleep(1000)

$cont_3 = 1
While $cont_3 = 1
	if $HWID_crk = "" Then
		MsgBox(0, "", "PEGUE EL Hardware ID de la ventana 'HWID Reader'")
		$HWID_crk = InputBox("crk", "Copiar el 'Hardware ID y pegarlo aquí' ")

		if Not $HWID_crk = "" Then
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
Run(@ScriptDir & "\crk\w.-KeyGen.exe", "")
; el winwaitactive lleva ese titulo xq así lo lleva el keygen
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Sleep(1000)
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send("2",1)
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send("{ENTER}")
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Sleep(500)
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send($user, 1)
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send("{ENTER}")
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send($HWID_crk, 1)
WinWaitActive(@ScriptDir & "\crk\w.-KeyGen.exe")
Send("{ENTER}")
;verificación
MsgBox(0, "", "Verificar la información ingresada")
MsgBox(0, "", "Nombre del disp.Usuario: " & $user & @CRLF & "HWID: " & $HWID_crk)
;cierra proceso del keygen
ProcessClose("w.-KeyGen.exe")
;;;;;;;;;;;;;;;; fin keygen

;;;;;;;;;;;;;;;;;;;;; PEGAR SN EN BIN ;;;;;;;;;;;
$origen = @ScriptDir & "\crk\SN.txt"
$destino_64 = "C:\Program Files\w.-\embro\BIN"
$destino_32 = "C:\Program Files (x86)\w.-\embro\BIN"

if (@OSArch = "X86") Then
	FileCopy($origen, $destino_32)
Else
	FileCopy($origen, $destino_64)
EndIf
;;;;;;;;;;;;;;;;;;;; fin pegar sn

;;;;;;;;;;;;;;;;;;;; VERIFICAR COPIAS DE ARCHIVOS A BIN
	$verificar_hid_x64 = "C:\Program Files\w.-\embro\BIN\hid.dll"
	$verificar_sn_x64 = FileExists("C:\Program Files\w.-\embro\BIN\SN.txt")
	$verificar_hid_x32 = "C:\Program Files (x86)\w.-\embro\BIN\hid.dll"
	$verificar_sn_x32 = FileExists("C:\Program Files (x86)\w.-\embro\BIN\SN.txt")

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
;;;;;;;;;;;;;;;;;;;;; fin verificación copia a bin

;~ MsgBox(0, "", $user)

