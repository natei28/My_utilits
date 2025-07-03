# Обновляем пакеты
#
apt update

# Устанавливаем ca-certificates и curl
#
sudo apt install ca-certificates curl

# Создаём каталог для ключей APT
# В каталоге /etc/apt/keyrings будут храниться ключи репозиториев. 
# Ключи требуются для проверки подлинности загружаемых пакетов.
#
sudo install -m 0755 -d /etc/apt/keyrings

# Скачиваем GPG-ключ из официального репозитория Docker
# сохраняет его в /etc/apt/keyrings/docker.asc:
#
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Назначаем права доступа на ключ
#
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Добавляем репозиторий Docker в источники APT
#
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновляем пакеты 
#
sudo apt update

# Устанавливаем последнюю версию Docker 
# и его компоненты
#
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Добавляем пользователя в группу docker
sudo usermod -aG docker $USER

#  Выводим версию docker
#
sudo docker version
docker --version


