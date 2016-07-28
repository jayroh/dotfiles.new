##########
# Colors #
###########

# Generate colors for all 256 colors
typeset -AHg fg bg

for color in {000..255}; do
  fg[$color]="%{[38;5;${color}m%}"
  bg[$color]="%{[48;5;${color}m%}"
done

ZSH_SPECTRUM_TEXT="What a neat color this is"
# Show all 256 colors with color number
spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$fg[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

# Show all 256 colors, but set the background color, not the foreground
spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$bg[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

prompt_color() {
  [[ -n "$1" ]] && print "%{$fg[$2]%}$1%{$reset_color%}"
}

prompt_green()  { print "$(prompt_color "$1" 158)" }
prompt_magenta(){ print "$(prompt_color "$1" 218)" }
prompt_purple() { print "$(prompt_color "$1" 146)" }
prompt_red()    { print "$(prompt_color "$1" 197)" }
prompt_cyan()   { print "$(prompt_color "$1" 159)" }
prompt_blue()   { print "$(prompt_color "$1" 031)" }
prompt_yellow() { print "$(prompt_color "$1" 222)" }
prompt_spaced() { [[ -n "$1" ]] && print " $@" }

###########################################
#
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
