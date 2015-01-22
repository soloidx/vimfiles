vimfiles
========

Aqui estan mis archivos de configuración de vim, adaptado a mis nececidades.

Instalacion
===========

* Necesitas:
  * Vim 7+ (con python y ruby incluidos)
  * Exuberant Ctags
  * Ruby y Ruby-dev
  * Rope y Ropemode
  * git

* Clonar el repositorio o descargarlo y descomprimir.
`git clone https://github.com/soloidx/vimfiles.git`

* Si es necesario hacer un backup de tu confguración previa de vim.
```
cd ~/
mv .vimrc .vimrc.old
mv .vim .vim.old
```

* Mover o linkear vimfiles a ~/.vim.
```
mv vimfiles ~/.vim
```

* Usar el archivo vimrc como ~/.vimrc.

* Inicializar los submódulos de los plugins en el repo (solo si lo
clonaste con git)
```
cd ~/.vim
git submodule init
git submodule update
```

* Instalar las librerias para command-t:
```
cd ~/.vim/bundle/command-t/ruby/command-t/
ruby extconf.rb
make
```

Atajos comunes
==============
* Moverte entre ventanas: puedes usar <control-w> y cualquiera de las teclas de
  dirección para desplazarte entre ventanas.

* z-a abre o cierra un fragmento de código con folding

* :sp (:split) divide vim en dos buffers por una línea horizontal

* :vs (:vsplit) vim en dos buffers por una línea vertical

* Tecla <leader> es una tecla que te permite agregar mas atajos en vim, sin
  afectar a los atajos actuales, la tecla leader que configuré es coma ",".

Otros Shortcuts
===============
Un atajo <leader>n significa que primero presiono <leader> y luego "n".

* <leader>v selecciona el texto pegado recientemente
* <leader>ev abre la configuracion de vim (vimrc) en un buffer vertical
* <leader>n abre / cierra NERDtree
* <leader>j busca la definicion de la variable con rope
* <leader>l abre / cierra Tagbar
* <leader>r activa / desactiva rainbow parentheses
* <leader> c <espacio> comenta / descomenta usando NERDcomenter

Plugins Instalados (TLDR)
=========================

Minibufexpl
-----------
En un explorador de buffers de vim, trae el concepto de "tabs" por cada archivo
abierto esta ubicada en una ventana en la parte superior con los nombres de las
ventanas, puedes cerrar el archivo asociado al tab ubicandote en éste y
presionando la tecla "d".

Puedes revisar la [pagina principal](http://www.vim.org/scripts/script.php?script_id=159)

Conque Term
-----------
Es un plugin que permite correr programas interactivos desde vim, por ejemplo
para correr la terminal desde vim escribes:
```
:ConqueTerm bash
```
Puedes revisar la [pagina principal](http://code.google.com/p/conque/)

Command-T (pathogen)
--------------------
Es un plugin inspirado en el "Go to file" de textmate, abre un buffer en donde
lista todos los archivos ubicados en el directorio donde esta abierto vim y
mientras escribes, se realiza una búsqueda y se reducen los resultados al
criterio de búsqueda.

**Dependencias:**
- Ruby.
- Ruby-dev.

Puedes revisar la [pagina principal](https://wincent.com/products/command-t)

NERD Commenter (pathogen)
-------------------------
Es un plugin que permite comentar un fragmento de código dependiendo del
tipo de archivo en el que estas trabajando.

Puedes revisar la [pagina principal](https://github.com/scrooloose/nerdcommenter)

NERD Tree (pathogen)
--------------------
Es un plugin que permite abrir un buffer con la estructura de directorios
dependiendo de donde este ubicado el directorio de trabajo en vim, además
permite bookmarks.

Puedes revisar la [pagina principal](https://github.com/scrooloose/nerdtree)

Rainbow parentheses (pathogen)
------------------------------
Es un plugin que permite colorear los paréntesis, corchetes y llaves
dependiendo de su profundidad.

Puedes revisar la [pagina principal](https://github.com/kien/rainbow_parentheses.vim)

Ropevim (pathogen)
------------------
Es un plugin que permite hacer refactoring de código python con vim.

**Dependencias:**
- Rope.
- Ropemode (paquete de pip)

Puedes revisar la [pagina principal](http://rope.sourceforge.net/ropevim.html)

SimpylFold (pathogen)
---------------------
Es un plugin que permite hacer folding "inteligente" cuando trabajas con
python.

Puedes revisar la [pagina principal](https://github.com/tmhedberg/SimpylFold)

Snipmate (pathogen)
-------------------
Es un plugin que permite aplicar snippets dependiendo del tipo de archivo con
el que trabajas, tiene una carpeta de snippets en el cual puedes personalizar
los tuyos.

Puedes revisar la [pagina principal](http://www.vim.org/scripts/script.php?script_id=2540)

Syntastic (pathogen)
--------------------
Es un plugin que permite mostrar errores en la sintáxis del codigo, dependiendo
de las herramientas de correccion que tengas instalado (pylint, pep8, pyflakes,
jslint, etc).

Puedes revisar la [pagina principal](https://github.com/scrooloose/syntastic)

Tagbar (pathogen)
-----------------
Es un plugin que permite mostrar en un buffer lateral un mapa con todas las
clases y métodos.

**Dependencias:**
- Exuberant ctags 5.5.

Puedes revisar la [pagina principal](https://github.com/scrooloose/syntastic)

Vim - fugitive (pathogen)
-------------------------
Es un plugin que hace un wrapper de git para poder usarlo desde vim.

**Dependencias:**
- git.

Puedes revisar la [pagina principal](https://github.com/tpope/vim-fugitive)

Vim - sparkup (pathogen)
-------------------------
Es un plugin que permite hacer [zencoding](http://code.google.com/p/zen-coding/)
en vim.

Puedes revisar la [pagina principal](https://github.com/rstacruz/sparkup)
