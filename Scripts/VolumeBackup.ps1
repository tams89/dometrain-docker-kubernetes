"Delete vol if it exists"
docker volume rm BackupDomeTrainVolume

"Create vol"
docker volume create BackupDomeTrainVolume

"Write file to vol"
docker run -it -v BackupDomeTrainVolume:/mydata alpine sh -c "echo 'Hello World' > /mydata/hello.txt"

"Create backup"
docker run --rm -v BackupDomeTrainVolume:/mydata -v ${pwd}:/backup alpine sh -c "cd /mydata && tar cvf /backup/backup.tar *"

"Restore backup"
docker run --rm -v RestoredVolume:/mydata -v ${pwd}:/backup alpine sh -c "cd /mydata && tar xvf /backup/backup.tar"