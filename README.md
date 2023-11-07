
# Istruzioni post installazione - Macchina Virtuale

## Mappatura tastiera per ambiente 'X' e modifica tasto $mod di i3-wm

L'installazione non recepisce la mappatura `it` della tastiera in ambiente `X` (funziona invece in ambiente console).  
Inoltre dobbiamo variare il tasto funzione del Window Manager `i3-wm` (da $mod4 a $mod1) per evitare conflitti con il medesimo tasto funzione utilizzato nella macchina *host*.  
Pertanto al primo accesso dobbiamo entrare come `root` e fare le modifiche:  

```
# localectl --no-convert set-x11-keymap it
# vi <user-home>/.config/i3/config
# exit
```

