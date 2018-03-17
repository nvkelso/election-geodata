Using this Docker image:

1. Git clone `election-geodata` and change to the repo directory
2. Populate `docker/env.ini` from `docker/env.ini-sample`
3. Build `eg` Docker image:
    
        docker built -t eg docker
    
4. Run `build-publish.sh` script:
    
        docker run -it -v `pwd`:/vol -w /vol --env-file docker/env.ini eg
