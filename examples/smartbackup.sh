#!/bin/bash

source_dir="/user/home/my_project"
backup_path="/tmp/backups"
remote_user="admin"
remote_host="192.168.1.50"
remote_dir="/backup/storage"
timestamp="$(date +%Y-%m-%d %H:%M:S)"
backup_name="project_backup_$timestamp.tar.gz"

