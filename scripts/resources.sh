#!/bin/bash
OPT=$(echo -e "htop\nbashtop\nbpytop\ngotop\nGPU_1\nGPU_2" | dmenu  -fn 'NotoMonoRegular:bold:pixelsize=16' -p "Choose action: ")
case $OPT in
	htop )  kitty -e htop ;;
	bashtop ) kitty -e bashtop ;;
	bpytop )  kitty -e bpytop ;; 
	gotop )  kitty -e gotop ;; 
	GPU_1)     kitty -e nvtop ;; 
	GPU_2 )     kitty -e nvitop ;; 
	*) ;;
esac

