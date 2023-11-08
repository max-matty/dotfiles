
# Installazione Arch

L'automazione prevede la scelta tra l'installazione su Hard Disk fisico (`HD`) oppure su Macchina Virtuale (`VM`).  
La scelta comporta il salvataggio della variabile `~/.screenlayout/var_inst` che viene verificata all'avvio della macchina impostando la configurazione schermo a 800x600 che può poi essere adattata allo schermo sia del portatile Asus che del display Samsun tramite la combinazione di tasti `$mod+a`.

E' cosigliabile fare partire la macchina dal viewer Spice.  
E' già configurata in `i3-wm` la combinazione tasti `$mod+Mod1+[0-9]` per far funzionare la quale è sufficiente impostare la porta *spice* sulla Macchina Virtuale all'interno del componente *Display Spice*: 5901 per la combinazione `$mod+Mod1+1` fino a 5010 per la combinazione `$mod+Mod1+0`.

