REM Hecho por: MilleniumMods
REM Hecho para: PepinoLandia
REM Versión: Beta 0.4.5
@echo off
 :0
cls
color e
Title PepinoLandia - Launcher Beta 0.4.5
echo Escribe (1) para instalar OptiFabric 1.16.5 automaticamente (.minecraft)
echo Escribe (2) para instalar OptiFabric 1.16.5 automaticamente (.tlauncher - [Exclusivo para TLauncher]) - EXPERIMENTAL, PUEDE NO FUNCIONAR
echo Escribe (3) para instalar OptiFabric 1.16.5 manualmente, util para cuando la instancia de Minecraft no esta en el ".minecraft"
echo.
echo Escribe (4) para instalar OptiFabric 1.18.1 automaticamente (.minecraft)
echo Escribe (5) para instalar OptiFabric 1.18.1 automaticamente (.tlauncher - [Exclusivo para TLauncher]) - EXPERIMENTAL, PUEDE NO FUNCIONAR
echo Escribe (6) para instalar OptiFabric 1.18.1 manualmente, util para cuando la instancia de Minecraft no esta en el ".minecraft"
echo.
echo Escribe (pl2) para instalar el modpack de PepinoLandia automaticamente.
echo Escribe (lucky) para instalar el modpack de PepinoLucky automaticamente (.minecraft).
echo Escribe (ltl) para instalar el modpack de PepinoLucky automaticamente (.tlauncher - [Exclusivo para TLauncher]). - EXPERIMENTAL, PUEDE NO FUNCIONAR.
echo.
echo Escribe (actualizar) para actualizar PepinoLauncher.
echo Escribe (c) para ver las notas de la version.
echo Escribe (limpiar) para eliminar la carpeta mods de tu .minecraft o de tu .tlauncher - Sirve para reinstalar los mods desde cero.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/INSTRUCCIONES.TXT', 'INSTRUCCIONES.TXT')"
if exist INSTRUCCIONES.TXT (
	start "" "INSTRUCCIONES.TXT"
)
set /p type=
if %type%==1 goto 1
if %type%==2 goto 2
if %type%==3 goto 3
if %type%==1 goto 4
if %type%==2 goto 5
if %type%==3 goto 6
if %type%==actualizar goto actualizar
if %type%==pl2 goto pl2
if %type%==c goto cambios
if %type%==lucky goto lucky
if %type%==ltl goto ltl
if %type%==limpiar goto limpiar
goto inicio

 :inicio
cls
color e
Title PepinoLandia - Launcher Beta 0.4.5
echo Escribe (1) para instalar OptiFabric 1.16.5 automaticamente (.minecraft)
echo Escribe (2) para instalar OptiFabric 1.16.5 automaticamente (.tlauncher - [Exclusivo para TLauncher]) - EXPERIMENTAL, PUEDE NO FUNCIONAR
echo Escribe (3) para instalar OptiFabric 1.16.5 manualmente, util para cuando la instancia de Minecraft no esta en el ".minecraft"
echo.
echo Escribe (4) para instalar OptiFabric 1.18.1 automaticamente (.minecraft)
echo Escribe (5) para instalar OptiFabric 1.18.1 automaticamente (.tlauncher - [Exclusivo para TLauncher]) - EXPERIMENTAL, PUEDE NO FUNCIONAR
echo Escribe (6) para instalar OptiFabric 1.18.1 manualmente, util para cuando la instancia de Minecraft no esta en el ".minecraft"
echo.
echo Escribe (pl2) para instalar el modpack de PepinoLandia automaticamente.
echo Escribe (lucky) para instalar el modpack de PepinoLucky automaticamente (.minecraft).
echo Escribe (ltl) para instalar el modpack de PepinoLucky automaticamente (.tlauncher - [Exclusivo para TLauncher]). - EXPERIMENTAL, PUEDE NO FUNCIONAR.
echo.
echo Escribe (actualizar) para actualizar PepinoLauncher.
echo Escribe (c) para ver las notas de la version.
echo Escribe (limpiar) para eliminar la carpeta mods de tu .minecraft o de tu .tlauncher - Sirve para reinstalar los mods desde cero.
set /p type=
if %type%==1 goto 1
if %type%==2 goto 2
if %type%==3 goto 3
if %type%==1 goto 4
if %type%==2 goto 5
if %type%==3 goto 6
if %type%==actualizar goto actualizar
if %type%==pl2 goto pl2
if %type%==c goto cambios
if %type%==lucky goto lucky
if %type%==ltl goto ltl
if %type%==limpiar goto limpiar
goto inicio

 :limpiar
 	cls
 	color 4
    echo Escribe (1) para limpiar la carpeta mods de tu .minecraft
	echo Escribe (2) para limpiar la carpeta mods de tu .tlauncher
	echo.
	echo Escribe "back" para volver al menu anterior.
	set /p type=
	if %type%==1 goto limpiar1
	if %type%==2 goto limpiar2
	if %type%==back goto inicio
	goto limpiar

 :limpiar1
	cls 
	color 4
	echo Eliminando carpeta mods de tu .minecraft...
	del "%APPDATA%\.minecraft\mods" /q
	echo Carpeta mods eliminada.
	mkdir "%APPDATA%\.minecraft\mods"
	echo Carpeta mods recreada (vacia).
	echo.
	echo ADVERTENCIA: Si aparece un error como "La carpeta ya existe", solamente hay que ignorar eso.
	echo.
	echo Escribe "back" para volver al menu anterior.
	set /p type=
	if %type%==back goto limpiar
	goto limpiar 

 :limpiar2
	cls 
	color 4
	echo Eliminando carpeta mods de tu .minecraft...
	del "%APPDATA%\.tlauncher\mods" /q
	echo Carpeta mods eliminada.
	mkdir "%APPDATA%\.tlauncher\mods"
	echo Carpeta mods recreada (vacia).
	echo.
	echo ADVERTENCIA: Si aparece un error como "La carpeta ya existe", solamente hay que ignorar eso.
	echo.
	echo Escribe "back" para volver al menu anterior.
	set /p type=
	if %type%==back goto limpiar
	goto limpiar
	
 :lucky
cls
color d
Title PepinoLandia - Launcher Beta 0.4.5 - Instalar PepinoLucky
if exist PepinoLucky.zip (
	echo Modpack ya esta descargado, moviendo a la carpeta mods...
	copy "%~dp0\PepinoLucky.zip" "%APPDATA%/.minecraft/"
	echo Modpack ZIP movido correctamente.
	powershell Expand-Archive PepinoLucky.zip -DestinationPath %APPDATA%/.minecraft/ -Force
	echo Mods extraidos dentro de la carpeta mods.
	del "%APPDATA%\.minecraft\PepinoLucky.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto inicio
	goto inicio
)
	echo Descargando modpack de PepinoLucky (2.5Mb)
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/PepinoLucky.zip', 'PepinoLucky.zip')"
	echo Modpack descargado, moviendo a la carpeta mods...
	copy "%~dp0\PepinoLucky.zip" "%APPDATA%/.minecraft/"
	powershell Expand-Archive PepinoLucky.zip -DestinationPath %APPDATA%/.minecraft/ -Force
	echo Mods instalados!
	del "%APPDATA%\.minecraft\PepinoLucky.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto inicio
	goto inicio

 :ltl
cls
color d
Title PepinoLandia - Launcher Beta 0.4.5 - Instalar PepinoLucky
if exist PepinoLucky.zip (
	echo Modpack ya esta descargado, moviendo a la carpeta mods...
	copy "%~dp0\PepinoLucky.zip" "%APPDATA%/.tlauncher/"
	echo Modpack ZIP movido correctamente.
	powershell Expand-Archive PepinoLucky.zip -DestinationPath %APPDATA%/.tlauncher/ -Force
	echo Mods extraidos dentro de la carpeta mods.
	del "%APPDATA%\.tlauncher\PepinoLucky.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio
)
	echo Descargando modpack de PepinoLucky (2.5Mb).
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/PepinoLucky.zip', 'PepinoLucky.zip')"
	echo Modpack descargado, moviendo a la carpeta mods...
	copy "%~dp0\PepinoLucky.zip" "%APPDATA%/.tlauncher/"
	powershell Expand-Archive PepinoLucky.zip -DestinationPath %APPDATA%/.tlauncher/ -Force
	echo Mods instalados!
	del "%APPDATA%\.tlauncher\PepinoLucky.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio

 :pl2
cls
color b
Title Seleccionar Modpack - PepinoLandia2
echo Escribe (1) para instalar automaticamente el modpack de PepinoLandia2 (.minecraft).
echo Escribe (2) para instalar automaticamente el modpack de PepinoLandia2 (.tlauncher).
echo Escribe (3) para descargar el modpack de PepinoLandia2 (Sin instalar).
echo.
echo Escribe "back" para volver al menu anterior.
set /p type=
if %type%==1 goto pl2_1
if %type%==2 goto pl2_2
if %type%==3 goto pl2_3
if %type%==back goto inicio
goto pl2

 :cambios
cls
color e
Title Changelog - PepinoLauncher
echo Cambios de la version:
echo.
echo - Actualizar las instalaciones de Fabric para el ultimo parche de seguridad sobre el Log4J2
echo - Agregar la opcion de instalar OptiFabric 1.18.1
echo.
echo Escribe "back" para volver al menu anterior.
set /p type=
if %type%==back goto inicio
goto inicio

 :pl2_1
cls
color e
Title Instalando Modpack - PepinoLandia2 - .minecraft
if exist Modpack-PL2.zip (
	echo Modpack ya esta descargado, moviendo a la carpeta mods...
	copy "%~dp0\Modpack-PL2.zip" "%APPDATA%/.minecraft/"
	echo Modpack ZIP movido correctamente.
	powershell Expand-Archive Modpack-PL2.zip -DestinationPath %APPDATA%/.minecraft/ -Force
	echo Mods extraidos dentro de la carpeta mods.
	del "%APPDATA%\.minecraft\Modpack-PL2.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio
)
	echo Descargando modpack de PepinoLandia2, esto puede tomar unos minutos (112Mb). Se avisara cuando termine la descarga...
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/Modpack-PL2.zip', 'Modpack-PL2.zip')"
	echo Modpack descargado, moviendo a la carpeta mods...
	copy "%~dp0\Modpack-PL2.zip" "%APPDATA%/.minecraft/"
	powershell Expand-Archive Modpack-PL2.zip -DestinationPath %APPDATA%/.minecraft/ -Force
	echo Mods instalados!
	del "%APPDATA%\.minecraft\Modpack-PL2.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio

 :pl2_2
cls
color e
Title Instalando Modpack - PepinoLandia2 - .tlauncher
if exist Modpack-PL2.zip (
	echo Modpack ya esta descargado, moviendo a la carpeta mods...
	copy "%~dp0\Modpack-PL2.zip" "%APPDATA%/.tlauncher/"
	powershell Expand-Archive Modpack-PL2.zip -DestinationPath %APPDATA%/.tlauncher/ -Force
	echo Mods instalados!
	del "%APPDATA%\.tlauncher\Modpack-PL2.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio
)
	echo Descargando modpack de PepinoLandia2, esto puede tomar unos minutos (112Mb). Se avisara cuando termine la descarga...
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/Modpack-PL2.zip', 'Modpack-PL2.zip')"
	echo Modpack descargado, moviendo a la carpeta mods...
	copy "%~dp0\Modpack-PL2.zip" "%APPDATA%/.tlauncher"
	del "%~dp0\Modpack-PL2.zip" /q
	powershell Expand-Archive Modpack-PL2.zip -DestinationPath %APPDATA%/.tlauncher/ -Force
	echo Mods instalados!
	del "%APPDATA%\.tlauncher\Modpack-PL2.zip" /q
	echo ZIP eliminado de la carpeta mods.
	echo Todo instalado!
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto inicio

 :pl2_3
cls
color e
Title Descargando Modpack - PepinoLandia2
if exist Modpack-PL2.zip (
	echo Modpack ya esta descargado, cancelando la descarga.
	echo.
	echo Escribe "back" para volver al menu anterior.
	echo Escribe lo que sea para finalizar.
	set /p type=
	if %type%==back goto pl2
	goto pl2
)
echo Descargando modpack de PepinoLandia2, esto puede tomar unos minutos (112Mb). Se avisara cuando termine la descarga...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/Modpack-PL2.zip', 'Modpack-PL2.zip')"
echo Modpack descargado!
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto pl2
goto inicio

 :actualizar
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/descargar.php', 'instalar.bat')"
echo Actualizado!
goto 0

REM OPTIFABRIC

 :1
cls
color b
echo Descargando instalador de Fabric...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora empezando con la instalacion...
echo.
java -jar fabric-installer-0.10.2.jar client -dir "%APPDATA%/.minecraft/" -launcher win32 -mcversion 1.16.5 -loader 0.12.12
echo Fabric instalado
echo.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric.zip', 'OptiFabric.zip')"
copy "%~dp0\OptiFabric.zip" "%APPDATA%/.minecraft/mods"
powershell Expand-Archive OptiFabric.zip -DestinationPath %APPDATA%/.minecraft/mods -Force
echo Mods instalados!
del "%APPDATA%\.minecraft\mods\OptiFabric.zip" /q
echo ZIP eliminado de la carpeta mods.
color a
echo Todo instalado!
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio

 :4
cls
color b
echo Descargando instalador de Fabric...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora empezando con la instalacion...
echo.
java -jar fabric-installer-0.10.2.jar client -dir "%APPDATA%/.minecraft/" -launcher win32 -mcversion 1.18.1 -loader 0.12.12
echo Fabric instalado
echo.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric-1.18.1.zip', 'OptiFabric-1.18.1.zip')"
copy "%~dp0\OptiFabric-1.18.1.zip" "%APPDATA%/.minecraft/mods"
powershell Expand-Archive OptiFabric-1.18.1.zip -DestinationPath %APPDATA%/.minecraft/mods -Force
echo Mods instalados!
del "%APPDATA%\.minecraft\mods\OptiFabric-1.18.1.zip" /q
echo ZIP eliminado de la carpeta mods.
color a
echo Todo instalado!
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio


 :2
cls
color b
echo Descargando instalador de Fabric...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora empezando con la instalacion...
echo NOTA: Es posible que debido a como funciona TLauncher, no se cree el perfil de Fabric. En este caso deben instalar Fabric por su cuenta desde TLauncher, los mods de este modpack ya estaran instalados.
echo.
java -jar fabric-installer-0.10.2.jar client -dir "%APPDATA%/.tlauncher" -launcher win32 -mcversion 1.16.5 -loader 0.12.12
echo Fabric instalado
echo.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric.zip', 'OptiFabric.zip')"
copy "%~dp0\OptiFabric.zip" "%APPDATA%/.tlauncher/mods"
powershell Expand-Archive OptiFabric.zip -DestinationPath %APPDATA%/.tlauncher/mods -Force
echo Mods instalados!
del "%APPDATA%\.tlauncher\mods\OptiFabric.zip" /q
echo ZIP eliminado de la carpeta mods.
color a
echo Todo instalado!
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio

 :5
cls
color b
echo Descargando instalador de Fabric...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora empezando con la instalacion...
echo NOTA: Es posible que debido a como funciona TLauncher, no se cree el perfil de Fabric. En este caso deben instalar Fabric por su cuenta desde TLauncher, los mods de este modpack ya estaran instalados.
echo.
java -jar fabric-installer-0.10.2.jar client -dir "%APPDATA%/.tlauncher" -launcher win32 -mcversion 1.18.1 -loader 0.12.12
echo Fabric instalado
echo.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric-1.18.1.zip', 'OptiFabric-1.18.1.zip')"
copy "%~dp0\OptiFabric-1.18.1.zip" "%APPDATA%/.tlauncher/mods"
powershell Expand-Archive OptiFabric-1.18.1.zip -DestinationPath %APPDATA%/.tlauncher/mods -Force
echo Mods instalados!
del "%APPDATA%\.tlauncher\mods\OptiFabric-1.18.1.zip" /q
echo ZIP eliminado de la carpeta mods.
color a
echo Todo instalado!
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio

 :3
cls
color b
echo Descargando modpack OptiFabric
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric.zip', 'OptiFabric.zip')"
echo Modpack descargado (Archivo "OptiFabric.zip").
echo Seleccionar Minecraft 1.16.5 y Loader 0.12.12 en la ventana del cliente (Por defecto)
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora ejecutandolo para que puedas instalar Fabric.
java -jar fabric-installer-0.10.2.jar
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio

 :6
cls
color b
echo Descargando modpack OptiFabric
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://pepinolandia.ml/descargas/OptiFabric-1.18.1.zip', 'OptiFabric-1.18.1.zip')"
echo Modpack descargado (Archivo "OptiFabric-1.18.1.zip").
echo Seleccionar Minecraft 1.18.1 y Loader 0.12.12 en la ventana del cliente (Por defecto)
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora ejecutandolo para que puedas instalar Fabric.
java -jar fabric-installer-0.10.2.jar
echo.
echo Si ya has instalado Fabric, entonces mueve el archivo OptiFabric-1.18.1.zip a la carpeta de mods.
echo.
echo Escribe "back" para volver al menu anterior.
echo Escribe lo que sea para finalizar.
set /p type=
if %type%==back goto inicio
goto inicio