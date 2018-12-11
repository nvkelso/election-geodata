Using this Docker image:

1. Git clone `election-geodata` and change to the repo directory
2. Populate `docker/env.ini` from `docker/env.ini-sample`
3. Build `eg` Docker image:
    
        docker build -t eg docker
    
4. Run `build-publish.sh` script:
    
        docker run -it --rm --env-file docker/env.ini -v `pwd`:/vol -w /vol eg
