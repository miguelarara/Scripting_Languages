# Program: thescriptassigment6.sh
# Task: assigment1
# Author: Miguel Arara
# Date: 01-04-2020


backup=/Documents/${!#}
for (( file=1; file<$#; file++ )) #$* argument in iterator for cp the line argument documents
do
 ((num_files++)) #with this we know how much files there.
 if test -f "$backup";then
    cp $file $backup
    echo "$num_files files copied into directory backup"
  else
    sudo mkdir $backup
    echo "Created directory backup. "
    cp $file $backup
    echo "$num_files files copied into directory backup"
  fi
done

