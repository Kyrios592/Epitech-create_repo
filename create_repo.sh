#!/bin/sh
## create_repo.sh for create_repo.sh in /home/kyrios/GitHub/Epitech-create_repo
## 
## Made by FERDINAND Kévin
## Login   <kevin.ferdinand@epitech.eu>
## 
## Started on  Mon Nov 30 17:29:35 2015 
## Last update Mon Nov 30 17:41:08 2015 
##

vert='\e[32m'
neutre='\e[m'

login='login_x'

echo -e -n "${vert}Nom du repo : ${neutre}"
read nomrepo
blih -u $login repository create $nomrepo
if [ "$1" = "1" ]
then
	return 1;
fi
blih -u $login repository setacl $nomrepo ramassage-tek r
if [ "$?" = "1" ]
then
	return 1;
fi

echo ""
echo -e -n "${vert}Ajouter des droits [y/N] ? ${neutre}"
read condition
while [ "$condition" = "y" ]
do
	echo -e -n "${vert}Utilisateur : ${neutre}"
	read utilisateur
	echo -e -n "${vert}Droit(s) : ${neutre}"
	read droits
	blih -u $login repository setacl $nomrepo $utilisateur $droits
	if [ "$?" = "1" ]
	then
		return 1;
	fi
	echo ""
	echo -e -n "${vert}Ajouter des droits [y/N] ? ${neutre}"
	read condition
done

echo ""
git clone git@git.epitech.eu:/$login/$nomrepo
if [ "$?" = "1" ]
then
	return 1;
fi

cd $nomrepo

echo ""
echo -e -n "${vert}Projet infographie [y/N] ?${neutre}"
read info
if [ "$info" = "N" ]
then
	echo ""
	echo -e -n "${vert}Mise en place Lib & Makefile ${neutre}"
	cp ~/bin/src/.gitignore .
	cp -r ~/bin/src/lib .
	cp ~/bin/src/Makefile .
	mkdir src
fi
if [ "$info" = "y" ]
then
	echo ""
	echo -e -n "${vert}Mise en place Makefile et fonction infographie ${neutre}"
	cp ~/bin/src/.gitignore .
	mkdir src
	cp -r ~/bin/src_info/src ./src/
	cp ~/bin/src_info/Makefile .
	mkdir include
	cp ~/bin/src_info/info.h ./include/
fi

echo ""
echo -e -n "${vert}Bon travail !${neutre}"
echo ""
