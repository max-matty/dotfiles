
# Installazione Arch

## Preparare la Macchina Virtuale con `virt-manager`

**Caratteristiche della VM**

> RAM 2048MB
> Core 2
> HD 20GM

Flaggare la configurazione dell'hardwar prima dell'installazione.  

**Cartella condivisa**

Nel componente *Memory*, flaggare *enable shared memory*.  
Poi aggiungere hardware tipo *Filesystem* e compilare come segue:  
> Driver: `virtiofs`  
> Source path: `/home/max/shared`  
> Target path: `/shared`  

Avviare l'installazione.

## Primo avvio in caso di Macchina Virtuale

L'automazione prevede la scelta tra l'installazione su Hard Disk fisico (`HD`) oppure su Macchina Virtuale (`VM`).  
La scelta comporta il salvataggio della variabile `~/.screenlayout/var_inst` che viene verificata all'avvio della macchina impostando la configurazione schermo a 800x600 che può poi essere adattata allo schermo sia del portatile Asus che del display Samsun tramite la combinazione di tasti `$mod+a`.

## Inizializzazione Neovim e Tmux

Al primo avvio è necessario inizializzare i *plugins* di Neovim e Tmux:  

- all'avvio Neovim aggiorna in automatico i plugins.
- per Tmux è invece necessario avviando una sessione (`$mod-Return`) e digitare `PREFIX+I`.

Con `PREFIX` che è la combinazione tasti `Ctrl+Space`.

## Utilizzo di Spice Viewer

E' cosigliabile fare partire la macchina dal viewer Spice per una migliore gestione del cambio Workspace in `i3-wm` nella macchina *Host*. E' già configurata in `i3-wm` (lato *Host*) la combinazione tasti `$mod+Mod1+[0-9]` per avviare 10 VM. Per collegare la singola VM è sufficiente impostare da `virt-manager` la porta *Spice* all'interno del componente *Display Spice*, esempio: 5901 per la combinazione `$mod+Mod1+1` fino a 5010 per la combinazione `$mod+Mod1+0`.

