pprint() {
    printf ' %.0s' $(seq 1 ${#1}) && echo
    echo $1
    printf '=%.0s' $(seq 1 ${#1}) && echo
}

disk_space() {
    echo $(du -shc $HOME | awk {'print $1'} | head -n 1)
}

pprint "Disk space at start"
disk_space

pprint "Cleaning up files"
files_to_remove=(".lesshst
                  .rediscli_history
                  .bash_history
                  .bash_logout
                  .bash_profile
                  .bashrc
                  .node_repl_history
                  .psql_history
                  .wget-hsts
                  .ansible_galaxy
                  .python_history")
for file in $files_to_remove
do
    rm -vf "$HOME/$file"
done

pprint "Cleaning up directories"
directories_to_remove=(".stremio-server
                        .glide
                        .cache
                        .ansible
                        .ansible-infra
                        .ipython
                        .npm")
for dir in $directories_to_remove
do
    echo "Deleted $dir"
    rm -rf "$HOME/$dir"
done

pprint "Cleaning docker images, volumes and containers"
docker system prune -a -f

pprint "Removing old zcompdump files"
ls $HOME/.zcompdump-endor-* | sort | head -n -1 | xargs rm -vf


pprint "Disk space at end"
disk_space
