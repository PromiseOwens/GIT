:: PARTE1
::      Apaga el ECHO
@ECHO OFF
::      Crea la Etiqueta Inicio
:Inicio
::      Define la siguientes variables: Contador, Turno, C1, C2, C3, C4, C5, C6, C7, C8, C9
::      Contador se inicia a 0, Turno se inicia como O y las C como un espacio en blanco.

SET Turno=O
SET Contador=0
SET C1= 
SET C2= 
SET C3= 
SET C4= 
SET C5= 
SET C6= 
SET C7= 
SET C8= 
SET C9= 

::FIN PARTE1

:Menu
COLOR 01
CLS
ECHO.
ECHO.
ECHO          PARTIDA            TABLERO
ECHO       *************      *************
ECHO       * %C1% * %C2% * %C3% *      * 1 * 2 * 3 *
ECHO       *************      *************
ECHO       * %C4% * %C5% * %C6% *      * 4 * 5 * 6 *
ECHO       *************      *************
ECHO       * %C7% * %C8% * %C9% *      * 7 * 8 * 9 *
ECHO       *************      *************
ECHO.
ECHO       Tiene el turno el jugador %Turno%
ECHO       Contador: %Contador%
ECHO.

:: PARTE2
::     Usa el comando CHOICE para pedir las opciones posibles que van del 1 al 9
CHOICE /C 123456789 /M " Seleccione un casilla "
::     Crea una variable llamada Seleccionada que almacene el valor seleccionado
SET Seleccionada=%ERRORLEVEL% 
::     Establece las 9 condiciones, para que cuando se seleccione el 1 el programa se dirija a la etiqueta OPCION1, y as� sucesivamente hasta el 9.
::IF %ERRORLEVEL%==1 GOTO OPCION1
::IF %ERRORLEVEL%==2 GOTO OPCION2
::IF %ERRORLEVEL%==3 GOTO OPCION3
::IF %ERRORLEVEL%==4 GOTO OPCION4
::IF %ERRORLEVEL%==5 GOTO OPCION5
::IF %ERRORLEVEL%==6 GOTO OPCION6
::IF %ERRORLEVEL%==7 GOTO OPCION7
::IF %ERRORLEVEL%==8 GOTO OPCION8
::IF %ERRORLEVEL%==9 GOTO OPCION9
GOTO OPCION%ERRORLEVEL%
:: Redirecciona a Menu
GOTO Menu
:: FIN PARTE2


::PARTE3
::     Crea la etiqueta OPCION1
:OPCION1
::     Si la celda sea igual a espacio:
::          Cambia el valor de la celda, asignandole el valor que tiene la variable Turno
::          Incrementa el valor de contador en 1
::          Redirecciona a VerificarGanador
::     Si la celda no es igual a espacio:
::          Redirecciona a CeldaOcupada
IF "%C1%"==" " (
    SET C1=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador
) ELSE (
    GOTO CeldaOcupada
) 

::FIN PARTE3

:: PARTE4
::      Ahora que tenemos la :OPCION1 creada, crea las opciones del 2 al 9, adaptandolas a cada n�mero.
:OPCION2
IF "%C2%"==" " (
    SET C2=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION3
IF "%C3%"==" " (
    SET C3=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION4
IF "%C4%"==" "  (
    SET C4=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION5
IF "%C5%"==" " (
    SET C5=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION6
IF "%C6%"==" " (
    SET C6=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION7
IF "%C7%"==" " (
    SET C7=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION8
IF "%C8%"==" " (
    SET C8=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu

:OPCION9
IF "%C9%"==" " (
    SET C9=%Turno%
    SET /A Contador=%Contador%+1
    GOTO VerificarGanador 
) ELSE (
    GOTO CeldaOcupada
) 
GOTO Menu
:: FIN PARTE4


:: PARTE5
::      Crea la etiqueta CambiarTurno
:CambiarTurno
::      Si la variable Turno es igual a O, la variable Turno tomar� el valor de X
::      En caso contrario, la variable Turno tomar� el valor de O
IF "%Turno%"=="O" (  
    SET Turno=X
) ELSE (
    SET Turno=O
)

::      Redirecciona a Menu
GOTO Menu
:: FIN PARTE5


:: PARTE6
::      Crea la etiqueta CeldaOcupada
:CeldaOcupada
::      Limpia la terminal/pantalla
CLS
::      Cambia el color a fondo negro y texto en rojo
Color 0C
::      Muestra en pantalla un mensaje diciendo que celda en cuesti�n est� seleccionada. Usa la variable Seleccionada para optener el n�mero de la celda.
ECHO la %Seleccionada% esta ocupada
::      Realiza una pausa para que el usuario pueda leer el mensaje.
PAUSE
::      Redirecciona a Menu
GOTO Menu
:: FIN PARTE6


:: PARTE7
::      Crea la etiqueta VerificarGanador
:VerificarGanador
:: Horizontales
::      Si una de las celdas (C1), no est� vacia...
::           Si la primera es igual a la segunda (C1 y C2)...
::               Si la primera es igual a la tercera (C1 y C3)...
::                   Si todo lo anterior se cumple, ve a la etiqueta Ganador
::IF NOT "%C1%"==" " (
    ::IF "%C1%"=="%C2%" (
        ::IF "%C1%"=="%C3%" (
            ::GOTO Ganador
        ::)
    ::)
::)
IF "%C1%%C2%%C3%"=="%Turno%%Turno%%Turno%" GOTO Ganador
:: FIN PARTE7


:: PARTE8
::     Una vez terminada la PARTE7, ahora crea las otras horizontales.
::     (C4, C5, C6)
::IF NOT "%C4%"==" " (
    ::IF "%C4%"=="%C5%" (
        ::IF "%C4%"=="%C6%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C4%%C5%%C6%"=="%Turno%%Turno%%Turno%" GOTO Ganador
::     (C7, C8, C9)
::IF NOT "%C7%"==" " (
    ::IF "%C7%"=="%C8%" (
        ::IF "%C7%"=="%C9%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C7%%C8%%C9%"=="%Turno%%Turno%%Turno%" GOTO Ganador
:: FIN PARTE8


:: Verticales
:: PARTE9
::      Una vez terminada la PARTE7, ahora crea las Verticales.
::      (C1, C4, C7)
::IF NOT "%C1%"==" " (
    ::IF "%C1%"=="%C4%" (
        ::IF "%C1%"=="%C7%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C1%%C4%%C7%"=="%Turno%%Turno%%Turno%" GOTO Ganador
::      (C2, C5, C8)
::IF NOT "%C2%"==" " (
    ::IF "%C2%"=="%C5%" (
        ::IF "%C2%"=="%C8%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C2%%C5%%C8%"=="%Turno%%Turno%%Turno%" GOTO Ganador
::      (C3, C6, C9)
::IF NOT "%C3%"==" " (
    ::IF "%C3%"=="%C6%" (
        ::IF "%C3%"=="%C9%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C3%%C6%%C9%"=="%Turno%%Turno%%Turno%" GOTO Ganador
:: FIN PARTE9


:: Diagonales
:: PARTE10
::      Una vez terminada la PARTE7, ahora crea las diagonales.
::      (C1, C5, C9)
::IF NOT "%C1%"==" " (
    ::IF "%C1%"=="%C5%" (
        ::IF "%C1%"=="%C9%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C1%%C5%%C9%"=="%Turno%%Turno%%Turno%" GOTO Ganador
::      (C3, C5, C7)
::IF NOT "%C3%"==" " (
    ::IF "%C3%"=="%C5%" (
        ::IF "%C3%"=="%C7%" (
            ::GOTO Ganador 
        ::)
    ::)
::)
IF "%C3%%C5%%C7%"=="%Turno%%Turno%%Turno%" GOTO Ganador
:: FIN PARTE10


:: Verifica si hay empate
:: PARTE11
::      Si Contador a llegado a 9, redirecciona a la etiqueta Empate.
IF "%Contador%"=="9" (
    GOTO Empate
    )
::      Finalmente, redirecciona a CambiarTurno. (C�mo no hay ni ganador, ni empate, cambiamos el turno).
GOTO CambiarTurno
:: FIN PARTE11


:: PARTE12
::      Crea la etiqueta Ganador
:Ganador
::      Limpia la terminal/pantalla
CLS
::      Cambia el color a negro y verde
Color 0A
::      Pon dos l�neas en blanco
ECHO.
ECHO.
::      Muestra un mensaje diciendo que turno es el ganador.
ECHO %Turno% congratulation you are the winner
::      Pon dos l�neas en blanco
ECHO.
ECHO.
PAUSE
::      Redirecciona a Inicio
GOTO Inicio
:: FIN PARTE12


:: PARTE13
::      Crea la etiqueta Empate
:Empate
::      Limpia la terminal/pantalla
CLS
::      Cambia el color a negro y azul
Color 09
::      Pon dos l�neas en blanco
ECHO.
ECHO.
::      Muestra un mensaje diciendo que se ha producido un empate.
ECHO Draw
::      Pon dos l�neas en blanco
ECHO.
ECHO.
PAUSE
::      Redirecciona a Inicio
GOTO Inicio
:: FIN PARTE13