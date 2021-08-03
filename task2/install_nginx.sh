#! /bin/bash
sudo apt-get update
sudo apt-get install -y nginx software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3
{
        echo 'f = open("index.html","w")'
        echo 'message = """<html>'
        echo '<body><p>Name : Flugel</p>'
        echo '<p> Owner: InfraTeam</P>'  
        echo '</body>'
        echo '</html>"""'
        echo 'f.write(message)'
        echo 'f.close() '
} >> html.py
python3 html.py
sudo cp index.html /var/www/html/index.html
sudo systemctl enable nginx
sudo systemctl restart nginx
