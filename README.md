# some-scripts

Colección de scripts personales para **BSPWM** y entornos minimalistas en Linux.

---

## Battery_state

Script que lee el estado de la batería y, cuando se cumplen ciertas condiciones (porcentaje bajo, cargando, etc.), envía notificaciones usando **dunstify**.

---

## checking_loop

Ejecuta scripts de forma periódica en un bucle.
Pensado para tareas como ejecutar `battery_state.sh` cada cierto intervalo de tiempo.

---

## dmenu_shutdown

Muestra un menú mediante **dmenu** que permite:

* Apagar el sistema
* Reiniciar

Todo desde una interfaz simple e intuitiva.

---

## start-scripts

Archivo encargado de ejecutar varios scripts desde un solo punto.
Está pensado para ser llamado directamente desde el `bspwmrc`, facilitando la inicialización de scripts al iniciar la sesión.
