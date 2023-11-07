
# Istruzioni post installazione - Macchina Virtuale

## Mappatura tastiera e modifica tasto $mod di i3-wm

Per evitare conflitti con la macchina *Host* devo cambiare l'impostazione del tasto $mod utilizzato dal Window Manager `i3-wm`. E' consigliabile di farlo prima di fare il login come utente normale. Fare quindi un login come `root` (tasto `-` quando si scrive il comando `localectl` tramite `Shift+ò`):  

```
# su <nome-utente>
$ localectl --no-convert set-x11-keymap it
$ vi $USERHOME/.config/i3/config
```

