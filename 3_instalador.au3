#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\INTRO\logo\LOGO_recortado_sin_fondo_ico.ico
#AutoIt3Wrapper_Res_CompanyName=PSPC
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

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


;~ $path = "C:\Program Files\W.-\embro\BIN\DataGather.exe"
;~ $nombre = "W.-_DataGather"

;~ Firewall_Bloq_Salida($nombre, $path)