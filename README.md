# Orbmancer's vim-hero config
My attempt to become a true master in vim coding :muscle:

### Why ?

I'm sick of the IDEs. I use less than 10% of their potential for 100% of my CPU.
I want to be closer to my terminal, code and run all my tools in a simpler manner.

### Additionnal config

Ctags
`brew install --HEAD universal-ctags/universal-ctags/universal-ctags`

Ruby
`ctags -f ruby_tags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)`

Javascript
`ctags -f js_tags -R --languages=javascript . $(./node_modules)`


### Contributing

Feel free to suggest me awesome plugins / keymaps / commands / techniques.
I'm certainly not yet a *vim-hero*, I'm always learning !

