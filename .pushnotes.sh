#!/bin/bash

if [[ $1 == push ]]; then
	echo pushing changes;
	echo "there are changes"
	git -C /home/maciej/Dokumenty/kisling/ add .	
	git -C /home/maciej/Dokumenty/kisling/ commit -m 'automatic commit'	
	git -C /home/maciej/Dokumenty/kisling/ push
	echo "no changes"
else if [[ $1 == pull ]]; then 
	echo pulling changes;
	if [[ -n $(git -C /home/maciej/Dokumenty/kisling/ status -s) ]]; then
		echo "there are changes"
		git -C /home/maciej/Dokumenty/kisling/ add .	
		git -C /home/maciej/Dokumenty/kisling/ commit -m 'automatic pull commit'
		fi
	git -C /home/maciej/Dokumenty/kisling/ pull
	fi
fi
