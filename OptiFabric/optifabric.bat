@echo off

REM Hecho por MilleniumMods
REM Version: 0.0.1

REM Guarda la version como una variable global
set version=0.0.1
REM Cantidad total de mods, no afecta en la funcionalidad, pero es una mini mejora visual
set modstotales=15

 :inicio
cls
color a
title Instalador OptiFabric, MilleniumMods

echo Escribe (1) para instalar OptiFabric
echo Escribe (2) para actualizar el instalador

REM Descarga el archivo para verificar la version del instalador y luego la guarda como una variable
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://milleniummods.com/optifabric/version.txt', 'version.txt')"
set /p build=<version.txt

REM Verifica si la version del instalador es la misma que la version guardada en la variable, si la version no concuerda, abre un MSGBox que ofrece actualizar
if %version%==%build% (
	REM Nada
) else (
	msg "%username%" "Actualizacion del launcher disponible! Utiliza el comando '2' para actualizar el launcher."
)

REM Verifica el comando utilizado
set /p type=
if %type%==1 goto instalar
if %type%==2 goto actualizar
goto inicio

 :actualizar
 REM Si se utiliza el comando actualizar pese a que la version sea la ultima, entonces cancelara la accion
 if %version%==%build% (
	msg "%username%" "Tu instalador ya esta actualizado! Si crees que no lo esta, accede a milleniummods.com/optifabric"
) else (
REM Si hay una actualizacion disponible, la descargara
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://milleniummods.com/optifabric/descargar.php', 'optifabric.bat')"
    msg "%username%" "Actualizacion completa! Utiliza el comando '1' para instalar OptiFabric."
goto inicio
)
goto inicio

 :instalar
REM Simplemente el color de los textos en la consola
color e
REM Revisar si ya existe la carpeta "modpack" en el directorio, y si no existe, la crea
if exist modpack (
    REM Nada
) else (
    mkdir modpack
)
REM Moverse a la carpeta modpack
cd modpack

REM Guarda el directorio de la carpeta modpack como una variable global para utilizarla mas adelante
set modpackdir=%~dp0\modpack\

REM Empezando con las descargas de todos los mods
echo Descargando modpack. [0/%modstotales%]
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3537/800/phosphor-fabric-mc1.16.2-0.8.0.jar', 'phosphor-fabric-mc1.16.2-0.8.0.jar')"
echo Phosphor descargado. [1/%modstotales%]

REM Guarda el mod como una variable global para utilizarla mas adelante
set phosphor=phosphor-fabric-mc1.16.2-0.8.0.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3344/974/lithium-fabric-mc1.16.5-0.6.6.jar', 'lithium-fabric-mc1.16.5-0.6.6.jar')"
echo Lithium descargado. [2/%modstotales%]
set lithium=lithium-fabric-mc1.16.5-0.6.6.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/AANobbMI/versions/mc1.16.5-0.2.0/sodium-fabric-mc1.16.5-0.2.0+build.4.jar', 'sodium-fabric-mc1.16.5-0.2.0+build.4.jar')"
echo Sodium descargado. [3/%modstotales%]
set sodium=sodium-fabric-mc1.16.5-0.2.0+build.4.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3517/166/sodium-extra-mc1.16.5-0.3.5.jar', 'sodium-extra-mc1.16.5-0.3.5.jar')"
echo Sodium-extra descargado. [4/%modstotales%]
set sodiumextra=sodium-extra-mc1.16.5-0.3.5.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/aXf2OSFU/versions/4.0.1+1.16.2/okzoomer-4.0.1+1.16.2.jar', 'okzoomer-4.0.1+1.16.2.jar')"
echo Okzoomer descargado. [5/%modstotales%]
set okzoomer=okzoomer-4.0.1+1.16.2.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3479/748/modmenu-1.16.22.jar', 'modmenu-1.16.22.jar')"
echo Modmenu descargado. [6/%modstotales%]
set modmenu=modmenu-1.16.22.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3209/972/lazydfu-0.1.2.jar', 'lazydfu-0.1.2.jar')"
echo LazyDFU descargado. [7/%modstotales%]
set lazydfu=lazydfu-0.1.2.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/yBW8D80W/versions/1.3.4+1.16/lambdynamiclights-fabric-1.3.4+1.16.jar', 'lambdynamiclights-fabric-1.3.4+1.16.jar')"
echo Lambdynamiclights descargado. [8/%modstotales%]
set lambdynamiclights=lambdynamiclights-fabric-1.3.4+1.16.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/Orvt0mRa/versions/1.0.0+mc1.16.5/indium-1.0.0+mc1.16.5.jar', 'indium-1.0.0+mc1.16.5.jar')"
echo Indium descargado. [9/%modstotales%]
set indium=indium-1.0.0+mc1.16.5.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/AZomiSrC/versions/mc1.16.5-v0.2.0/hydrogen-fabric-mc1.16.5-0.2.jar', 'hydrogen-fabric-mc1.16.5-0.2.jar')"
echo Hydrogen descargado. [10/%modstotales%]
set hydrogen=hydrogen-fabric-mc1.16.5-0.2.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3485/637/ferritecore-2.1.0-fabric.jar', 'ferritecore-2.1.0-fabric.jar')"
echo FerriteCore descargado. [11/%modstotales%]
set ferritecore=ferritecore-2.1.0-fabric.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.modrinth.com/data/P7dR8mSH/versions/0.42.0+1.16/fabric-api-0.42.0+1.16.jar', 'fabric-api-0.42.0+1.16.jar')"
echo FabricAPI descargado. [12/%modstotales%]
set fabricapi=fabric-api-0.42.0+1.16.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3358/824/entityculling-1.3.0.jar', 'entityculling-1.3.0.jar')"
echo EntityCulling descargado. [13/%modstotales%]
set entityculling=entityculling-1.3.0.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3378/154/enhancedblockentities-0.4--1.16.x.jar', 'enhancedblockentities-0.4--1.16.x.jar')"
echo EnhancedBlockEntities descargado. [14/%modstotales%]
set enhancedblockentities=enhancedblockentities-0.4--1.16.x.jar

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://media.forgecdn.net/files/3223/126/cullleaves-2.1.0.jar', 'cullleaves-2.1.0.jar')"
echo CullLeaves descargado. [15/%modstotales%]
set cullleaves=cullleaves-2.1.0.jar

REM Instalando Fabric

echo.
echo.
echo.
echo Descargando instalador de Fabric...
REM Descarga el launcher de Fabric
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.10.2/fabric-installer-0.10.2.jar', 'fabric-installer-0.10.2.jar')"
echo Instalador descargado, ahora empezando con la instalacion...
echo.
REM Ejecuta el instalador de Fabric para instalarlo
java -jar fabric-installer-0.10.2.jar client -dir "%APPDATA%/.minecraft/" -launcher win32 -mcversion 1.16.5 -loader 0.12.12
echo Fabric instalado
echo.
REM Copia los mods de la carpeta modpack en la carpeta "mods" del .minecraft. Utiliza las variables de la carpeta modpack y los nombres de los mods.
copy "%modpackdir%\%phosphor%" "%APPDATA%/.minecraft/mods"
echo Phosphor instalado
copy "%modpackdir%\%sodium%" "%APPDATA%/.minecraft/mods"
echo Sodium instalado
copy "%modpackdir%\%okzoomer%" "%APPDATA%/.minecraft/mods"
echo Okzoomer instalado
copy "%modpackdir%\%modmenu%" "%APPDATA%/.minecraft/mods"
echo Modmenu instalado
copy "%modpackdir%\%lazydfu%" "%APPDATA%/.minecraft/mods"
echo LazyDFU instalado
copy "%modpackdir%\%lambdynamiclights%" "%APPDATA%/.minecraft/mods"
echo Lambdynamiclights instalado
copy "%modpackdir%\%indium%" "%APPDATA%/.minecraft/mods"
echo Indium instalado
copy "%modpackdir%\%hydrogen%" "%APPDATA%/.minecraft/mods"
echo Hydrogen instalado
copy "%modpackdir%\%ferritecore%" "%APPDATA%/.minecraft/mods"
echo FerriteCore instalado
copy "%modpackdir%\%fabricapi%" "%APPDATA%/.minecraft/mods"
echo FabricAPI instalado
copy "%modpackdir%\%entityculling%" "%APPDATA%/.minecraft/mods"
echo EntityCulling instalado
copy "%modpackdir%\%enhancedblockentities%" "%APPDATA%/.minecraft/mods"
echo EnhancedBlockEntities instalado
copy "%modpackdir%\%cullleaves%" "%APPDATA%/.minecraft/mods"
echo CullLeaves instalado
copy "%modpackdir%\%lithium%" "%APPDATA%/.minecraft/mods"
echo Lithium instalado
copy "%modpackdir%\%sodiumextra%" "%APPDATA%/.minecraft/mods"
echo SodiumExtra instalado
echo.
echo Todos los mods instalados en la carpeta .minecraft!
pause