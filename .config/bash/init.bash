# Set shell options
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s dotglob

# Include all files in the `profile` subdirectory.
# There are vars, aliases and functions defined.
for f in $(find $HOME/.config/bash/profile/ -type f | sort); do . $f; done
