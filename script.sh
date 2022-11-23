#! /usr/bin/bash
# create an empty html and css files 
touch index.html
touch style.css

if [ -d images ]
then 
    echo "directory exists"
else 
    mkdir images
fi 


mycontainerOpenTag="<div id='container'>"
mycontainerCloseTag="</div>"

mytitle="<h1>Hello world</h1>"

mysection="<div>My Galery Of Pictures</div>"
myimagesOpenTag="<div class='images'>"
myimagesCloseTag="</div>"

linkToStyle="<link rel='stylesheet' href='style.css'>"
divStyle="
div {
    color : red;
    font-weight :bold;
    margin :30px 0 ;
}
"
titleStyle="
h1 {
    font-style: italic;
    color : rgb(13, 65, 128);
}
"
containerStyle="
#container {
    font-family: Times, serif;
    display:flex;
    flex-direction:column;
    align-items:center;
    margin : 10px 50px;
    padding : 40px 0;
    width : 90vw;
}
"
imagesStyle="
.images {
    display :flex;
    flex-direction : column;
    border : solid black 2px;
    width: -webkit-fit-content;
    height: -webkit-fit-content;
    width: -moz-fit-content;
    height: -moz-fit-content;
}
.pic {
    margin : 40px;
    height : 350px;
    width :400px;
}
"


echo $mycontainerOpenTag > index.html
echo $linkToStyle $mytitle $mysection  >> index.html
echo $myimagesOpenTag >> index.html
sh ./test.sh 
echo $myimagesCloseTag >> index.html
echo $divStyle $titleStyle $containerStyle $imagesStyle >> style.css
echo $mycontainerCloseTag >> index.html
start ./index.html






