#! /usr/bin/bash
# open the file and display it's content


# fonction qui vérifie la bonne extension des images 
function in_array ()
{
    allowed_extensions=("jpeg" "png" "jpg")
    for extension in ${allowed_extensions[@]}
    do
       if [[ $extension == $1  ]]
       then
           exists=1
           break
        else 
           exists=0
        fi
    done
    return $exists
}



if [ -d images ]
then 
    if [ "( ls -A images )" ]
    then
        echo "le dossier images existe et n'est pas vide"
        cd images/
        for file in `ls . `
        do
           # vérifier l'extension du fichier 
           extension_file=${file#*.}
           name_file=${file%%.*}
           in_array "$extension_file"
           if [ $? -eq 1 ]
           then 
               # tout est bon, on crée une balise qui affiche cette image
               source=$name_file.$extension_file
               uniqueImage="<img class='pic' alt='$name_file' src='images/$source'>"
               cd ..
               echo $uniqueImage >> index.html
               cd images/
               echo le fichier ${file%%.*} a l\'extension $extension_file a bien été inséré
            else 
               echo le fichier ${file%%.*} n\'est pas dans les extensions permises, y a un problème
            fi
        done

    else 
        echo "le dossier existe mais il est vide"
    fi 
else 
    echo "le repertoire images n'est pas trouvé "
fi 

