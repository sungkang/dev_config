function fh
    set -l selected (history | fzf)
    begin
            commandline -f repaint
            commandline -i "$selected"
            commandline -f accept-autosuggestion
    end
end
