import subprocess
import sys

# Função responsável por instalar os pacotes listados no arquivo requirements.txt
def install_packages():
        with open('requirements.txt', 'r') as file:
                packages = [line.strip() for line in file if line.strip()]

                for package in packages:
                        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

if __name__ == '__main__':
    install_packages()