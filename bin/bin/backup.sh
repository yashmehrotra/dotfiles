pprint() {
    printf ' %.0s' $(seq 1 ${#1}) && echo
    echo $1
    printf '=%.0s' $(seq 1 ${#1}) && echo
}

BACKUP_DIR="$HOME/Backup"
pprint "Removing and creating a fresh backup directory"
rm -rf "$BACKUP_DIR"
mkdir "$BACKUP_DIR"

pprint "Backing up directories"
directories_to_backup=("Work
                        Projects
                        texts
                        .2fa
                        .aws
                        .docker
                        .kube
                        .ssh
                        .zshrc
                        .zsh_history
                        tokens.txt")

for dir in $directories_to_backup
do
    echo "Backing up $dir"
    cp -rf "$HOME/$dir" "$BACKUP_DIR"
done

TAR_NAME="$HOME/backup-$(date +'%Y-%m-%d.%H:%M').tar"
pprint "Creating a backup tar $TAR_NAME"
tar -cf "$TAR_NAME" "$BACKUP_DIR"
rm -rf "$BACKUP_DIR"
pprint "Success"
