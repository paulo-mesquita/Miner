#!/bin/bash
clear
mkdir /root/miner/
cd /root/miner/
echo "---------------------------------"
echo "     Script Miner Cryptomoeda"
echo "     TCC Faculdade Anhanguera"
echo "        By Paulo Mesquita"
echo "---------------------------------"
echo " "
echo "Crie sua conta na Minergate pelo"
echo "link: https://minergate.com/"
echo "Depois de criar sua conta basta"
echo "Usar seu E-mail utilizado no"
echo "canastro para minerar..."
echo " "
echo "O script vai executar a mineração"
echo "Tudo simples e pratico"
echo "É necessário instalar a mineração"
echo "Somente uma vez, e toda vez que"
echo "O servidor for reiniciado use a"
echo "opção de iniciar mineração"
echo "---------------------------------"
echo " "
echo "Digite 1 para instalar o minergate"
echo "Digite 2 para iniciar a mineração"
echo "---------------------------------"
read -p "Responda: " -e -i 2 resposta
if [[ "$resposta" = '1' ]]; then

	# apt-get update
	# apt-get install docker.io
	# docker pull virtualcoin/cpuminer
	# docker run --rm -it virtualcoin/cpuminer monero virtualcoin.videos@gmail.com
        apt-get update
        apt-get install libcurl4-openssl-dev git 
        apt-get install build-essential 
        apt-get install autotools-dev autoconf 
        apt-get install libcurl3 libcurl4-gnutls-dev
        #https://github.com/wolf9466/cpuminer-multi
        #https://github.com/haborynn/backupss
        #git clone https://github.com/paulo-mesquita/cpuminer-multi
        #git clone https://github.com/LucasJones/cpuminer-multi
        cd cpuminer-multi
	chmod +x ./autogen.sh
        ./autogen.sh
        CFLAGS="-march=native" ./configure
        make
        make install	
elif [[ "$resposta" = '2' ]]; then
        clear
        cd /root/miner/cpuminer-multi/
        echo "Digite seu E-mail de cadastro do Minergate"
        echo " "
        echo -e '\033[05;35mGostou do meu trabalho ?\033[00;37m'
        echo -e '\033[05;35mAjude para que esse meu projeto continue...\033[00;37m'
        echo -e '\033[05;35mDoe BTC para:\033[00;37m \033[05;33m1E75P2NwugGkUK8CMNjaoxBtYzJKppukmp\033[00;37m'
        echo " "
        read -p "Responda: " -e -i exemplo@dominio.com email
        clear
        echo "Deseja minerar o que ?"
        echo " "
        echo "Digite 1 para Monero."
        echo "Digite 2 para Bytecoin."
        echo " "
        read -p "Responda: " -e -i 1 miner
        if [[ "$miner" = '1' ]]; then
		clear
		echo "Para minerar em segundo plano digite 1"
        	echo " "
        	echo "Para minerar e visualizar o processo digite 2"
        	echo " "
		read -p "Responda: " -e -i 2 tipominer
		if [[ "$tipominer" = '1' ]]; then
                	clear
			echo "Pronto agora você esta minerando Monero 24hs por dia, se reiniciar o servidor lembre-se de ativar novamente!"
			echo "---------------------------------------------------------------------------------------------------------------"
			echo "---------------------------------------------------------------------------------------------------------------"
                	nohup minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u $email -p x &
		fi
		if [[ "$tipominer" = '2' ]]; then
                	clear
			echo "Pronto agora você esta minerando Monero 24hs por dia, se reiniciar o servidor lembre-se de ativar novamente!"
			echo "---------------------------------------------------------------------------------------------------------------"
			echo "---------------------------------------------------------------------------------------------------------------"
                	minerd -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45560 -u $email -p x
		fi
        elif [[ "$miner" = '2' ]]; then
		clear
		echo "Para minerar em segundo plano digite 1"
        	echo " "
        	echo "Para minerar e visualizar o processo digite 2"
        	echo " "
		read -p "Responda: " -e -i 2 tipominer
		if [[ "$tipominer" = '1' ]]; then
                	clear
			echo "Pronto agora você esta minerando Bytecoin 24hs por dia, se reiniciar o servidor lembre-se de ativar novamente!"
			echo "---------------------------------------------------------------------------------------------------------------"
			echo "---------------------------------------------------------------------------------------------------------------"
                	nohup minerd -a cryptonight -o stratum+tcp://bcn.pool.minergate.com:45550 -u $email -p x &
		fi
		if [[ "$tipominer" = '2' ]]; then
                	clear
			echo "Pronto agora você esta minerando Bytecoin 24hs por dia, se reiniciar o servidor lembre-se de ativar novamente!"
			echo "---------------------------------------------------------------------------------------------------------------"
			echo "---------------------------------------------------------------------------------------------------------------"
                	minerd -a cryptonight -o stratum+tcp://bcn.pool.minergate.com:45550 -u $email -p x
		fi		
        else
                clear
                "Opção invalida!"
                exit
        fi
        bitcoin 
else
        clear
        echo "Opção Invalida"
        exit
fi
        
        
