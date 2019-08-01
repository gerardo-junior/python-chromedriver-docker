# Environment of pyhton selenium scrapper

```
    [+] AUTOR:        Gerardo Junior
    [+] SITE:         https://gerardo-junior.com
    [+] EMAIL:        me@gerardo-junior.com
    [+] GITHUB:       https://github.com/gerardo-junior/python-chromedriver-docker.git
    [+] TELEGRAM:     @MrGerardoJunior
```

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/python-chromedriver)

Docker image to run [chromedriver](https://chromedriver.chromium.org/) pyhton scrapper

> The project must be in the **/src** container folder 
## Tags available

- [stable](https://github.com/gerardo-junior/python-chromedriver-docker/blob/master/Dockerfile), [latest](https://github.com/gerardo-junior/python-chromedriver-docker/blob/develop/Dockerfile)   
    - [library/python](https://hub.docker.com/_/python) 3.6

## Come on, do your tests

```bash
docker pull gerardojunior/python-chromedriver:stable
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

> You can try building with different versions of software with docker args, for example: PYTHON_ENV=3.6

```bash
docker build https://github.com/gerardo-junior/python-chromedriver-docker.git --tag gerardojunior/python-chromedriver
```

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/src gerardojunior/python-chromedriver:stable [command]

# or docker-compose
docker-compose run node [command]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  node:
    image: gerardojunior/python-chromedriver:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /src
    #command: dev

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/python-chromedriver sh
# or with docker-compose
docker-compose run node sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

