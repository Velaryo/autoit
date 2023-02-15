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
ToolTip("Instalando W. E.S e4.2...", $x, $y, "F-/B-: PSPC", 1 )
;;;;;;;;;;;;;; fin tooltip

;;;;;;;;;;;;;; ABRE INSTALADOR;;;;;;;;;;;;;;;
Run(@ScriptDir & "\W._Setup.exe", "")
Sleep(300)

; no lo uso xq parece q el pid se refresca cada vez q se cambia de ventana, lo estatico es el titulo
;~ $hWnd_INSTALL = WinWaitActive("W.- InstallShield Wizard")
$titulo_INSTALL = "W.- InstallShield Wizard"

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


	If $texto_3 == "Bienvenido a InstallShield Wizard de W.-" Then
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

	If $texto_6 == "Seleccione el tipo de instalación que desea realizar." Then
		ControlClick($titulo_INSTALL, "", "Button4")
	EndIf

	If $texto_7 == "Idiomas extra" Then
		ControlClick($titulo_INSTALL, "", "Button2")
	EndIf

	If $texto_5 == "Elegir ubicación de destino" Then
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
Run(@ScriptDir & "\W.-Update.exe", "")
Sleep(300)

$titulo_UPDATE = "W.- - InstallShield Wizard"

$cont_2 = 1

While($cont_2 = 1)

	$data_Gather = ProcessExists("DataGather.exe")
	$texto_2 = ControlGetText($titulo_UPDATE, "", "Static2")
	$texto_3 = ControlGetText($titulo_UPDATE, "", "Static3")
	$texto_4 = ControlGetText($titulo_UPDATE, "", "Static4")
	$texto_5 = ControlGetText($titulo_UPDATE, "", "Static5")
	$texto_6 = ControlGetText($titulo_UPDATE, "", "Static6")
	$texto_7 = ControlGetText($titulo_UPDATE, "", "Static7")

	If $texto_3 == "Bienvenido a InstallShield Wizard de W.-" Then
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

	If $texto_4 == "La actualización ha finalizado" Then
		ControlClick($titulo_UPDATE, "", "Button2")
		ControlClick($titulo_UPDATE, "", "Button4")

		Sleep(1000)
		$cont_2 = 0
	EndIf

	Sleep(2000)

WEnd