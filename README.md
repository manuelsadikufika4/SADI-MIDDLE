<div align="center">

  <!-- Logo em ASCII Art -->
  <pre>
   _____ _____ ____ ___   __  __ ___ ____  ____  _     _____ 
  / ____|  __ \  _ \__ \ |  \/  |_ _|  _ \|  _ \| |   | ____|
 | (___ | |  | | | | | ) || |\/| || || | | | | | | |   |  _|  
  \___ \| |__| | |_| |/ / | |  | || || |_| | |_| | |___| |___ 
  |____/|_____/|____/|___/|_|  |_|___|____/|____/|_____|_____|
  </pre>

  <h3><b>SADI - MIDDLE</b></h3>
  <p><b>Framework Modular de Reconhecimento, Enumeração e Análise Web</b></p>

  <!-- Badges Técnicas -->
  <p>
    <img src="https://img.shields.io/badge/Author-Manuel%20Sadi%20Kufika-blue?style=flat-square" alt="Author">
    <img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License">
    <img src="https://img.shields.io/badge/Platform-Linux%2FmacOS-orange?style=flat-square" alt="Platform">
    <img src="https://img.shields.io/badge/Language-Bash-lightgrey?style=flat-square" alt="Bash">
    <img src="https://img.shields.io/badge/Version-1.0-informational?style=flat-square" alt="Version">
  </p>

</div>

<br>

---

## Sobre o Projeto

O **SADI - MIDDLE** é uma ferramenta interativa desenvolvida em Bash criada para automatizar processos essenciais de auditoria de segurança, tais como a fase de reconhecimento inicial (footprinting), varreduras de rede furtivas, enumeração de serviços web, simulação de bypass de WAF, testes de injeção e utilitários de pós-exploração.

---

## Funcionalidades Principais

| Módulo | Descrição Técnica |
| :--- | :--- |
| **Footprinting & DNS** | Recolha de endereços IP, registos do alvo e consultas DNS avançadas (`dig`, `nslookup`). |
| **Rede & Hosts Ativos** | Verificação de hosts ativos (Ping Sweep) e escaneamento furtivo (`SYN Scan` com Nmap e deteção de SO). |
| **Enumeração & Web** | Análise de cabeçalhos HTTP, deteção de Information Disclosure e diretórios. |
| **Testes Web Avançados**| Simulação de WAF Bypass (Headers de evasão), testes conceituais de SQLi (Union/Error Based), manipulação de cookies e XSS refletido. |
| **Utilitários & Pós-Exploração**| Consulta e verificação de hashes MD5, criação rápida de servidores HTTP em Python e listeners Netcat. |

---

## Instalação e Utilização

Segue os passos abaixo para clonar e executar a ferramenta no teu ambiente de testes:

```bash
# 1. Clonar o repositório
git clone [https://github.com/TEU_UTILIZADOR/SADI-MIDDLE.git](https://github.com/TEU_UTILIZADOR/SADI-MIDDLE.git)

# 2. Entrar no diretório do projeto
cd SADI-MIDDLE

# 3. Atribuir permissões de execução ao script
chmod +x sadi-middle.sh

# 4. Executar a ferramenta
./sadi-middle.sh

## Aviso Legal (Disclaimer)

Esta ferramenta foi desenvolvida estritamente para fins educacionais, auditorias de segurança autorizadas (penetration testing) e utilização em ambientes de laboratório controlados.

O autor (Manuel Sadi Kufika) não assume qualquer responsabilidade por quaisquer danos diretos ou indiretos causados pelo uso indevido, exploração não autorizada de sistemas ou incumprimento das leis vigentes. Utilize apenas em alvos para os quais possua consentimento explícito e autorização legal.
