# Herramientas de Microsoft Edge

![Windows Image](path/to/your/image.png)

## Descripción
Este repositorio contiene un conjunto de comandos para desactivar, desinstalar y reinstalar Microsoft Edge en Windows 10 y Windows 11. Es importante destacar que desinstalar Microsoft Edge puede causar problemas en el sistema y no es una práctica recomendada por Microsoft. Se recomienda encarecidamente hacer una copia de seguridad de los datos importantes antes de continuar.

## Cómo utilizar
1. Haz clic en el botón "Code" en la parte superior derecha del repositorio.
2. Selecciona "Download ZIP" para descargar el repositorio en tu computadora.
3. Descomprime el archivo ZIP descargado en una ubicación de tu elección.
4. Haz clic derecho en el archivo "desactivar_edge_win10.bat" si estás en Windows 10, o "desactivar_edge_win11.bat" si estás en Windows 11.
5. Selecciona "Ejecutar como administrador" para ejecutar el archivo.
6. Sigue las instrucciones en pantalla para desactivar Microsoft Edge.

### Desinstalar Microsoft Edge
1. Abre PowerShell como administrador.
2. Ejecuta el comando   ```Get-AppxPackage -allusers *Microsoft.MicrosoftEdge* | Remove-AppxPackage` para desinstalar Microsoft Edge.  ```

### Reinstalar Microsoft Edge
1. Abre PowerShell como administrador.
2. Ejecuta el comando   ```Get-AppxPackage -allusers *Microsoft.MicrosoftEdge* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}  ``` para reinstalar Microsoft Edge.

### Encontrar el nombre del paquete de Microsoft Edge
1. Abre PowerShell como administrador.
2. Ejecuta el comando   ```DISM /Online /Get-ProvisionedAppxPackages | Select-String Packagename` para encontrar el nombre del paquete de Microsoft Edge.  ```

## Licencia
Este proyecto está bajo la licencia [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/). Puedes compartir, adaptar y utilizar estos archivos siempre que des el crédito correspondiente al autor original.

### Nota importante
La desinstalación de Microsoft Edge podría causar problemas en el sistema operativo. Se recomienda encarecidamente hacer una copia de seguridad de los datos importantes antes de continuar. El autor no se hace responsable de ningún daño o problema causado por el uso de estos comandos.

## Dando Estrella

Si encuentras útiles estos scripts o te han ayudado de alguna manera, ¡por favor considera darle una estrella a este repositorio! Tu apoyo es muy apreciado y nos ayuda a seguir compartiendo recursos útiles con la comunidad.


