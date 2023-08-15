# MyTinyTodo Dockerfile
Dockerfile for a tiny Docker container running the [MyTinyTodo](https://www.mytinytodo.net/) task management web app

- MyTinyTodo version v1.7.4
- Powered by Alpine Linux 3.18, Lighttpd 1.4.71 and PHP 8.2
- <16MB RAM idle, 36MB disk space

## Installing
1. Download the `Dockerfile`, `entrypoint.sh` and `lighttpd.conf` files from this repo to a directory on your computer
2. Open a terminal and change (`cd`) to the directory containing the files
3. Build the image: `docker build -t mytinytodo .`
4. Set up a directory for housing the SQLite database. For example `/var/mytinytodo/`
5. Run the container: `docker run -d --name mytinytodo -p 8000:80 -v /var/mytinytodo/:/var/www/localhost/htdocs/mytinytodo/db/ mytinytodo` change the port `8000` and `/var/mytinytodo/` volume path as desired

After the first run, start/stop your container with `docker start mytinytodo` and `docker stop mytinytodo`

MyTinyTodo should now be accessible via HTTP from port 8000 at the host. Enter via a web browser and finish the initial setup


If you need HTTPS support, you can:
- (Recommended) Run behind a reverse proxy (I.E., Lighttpd's [mod_proxy](https://redmine.lighttpd.net/projects/lighttpd/wiki/Mod_proxy)) at the same host as the container.
 If going this way, don't forget to replace `-p 8000:80` with `-p 127.0.0.1:8000:80` at the _docker run_ command to allow only connections from localhost and prevent other hosts from bypassing the reverse proxy. This method unifies SSL certificate configuration for all your containers as they only have to be set up at the server running the reverse proxy instead of at each container
- Hack it yourself: While the container is running run a shell inside it with `docker exec -it mytinytodo /bin/sh`, get yourself a comfy editor: `apk add nano` / `apk add vi` and tweak the Lighttpd webserver settings at `/etc/lighttpd/lighttpd.conf`
