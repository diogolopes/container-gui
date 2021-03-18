https://gist.github.com/sham1/aa451608775d36fb55ebdbbc955bcb4d

$ podman run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/dri:/dev/dri --security-opt=label=type:container_runtime_t -e DISPLAY localhost/xonotic-container xonotic-glx

There is something to be unpacked here. So let's go from left to right.

--rm tells podman to remove this container once it closes. This means that every time this command is ran, the container will be minty fresh.
-v tells podman to make a directory tree accessible inside the container instance. In this case we're making the /tmp/.X11-unix and /dev/dri accessible. The first one is to share the X11 socket with the container so we can run our app, and the second is to give our app access to the graphics card, which is needed for graphically accelerated graphics.
--security-opt=label=type:container_runtime_t tells podman to set the SELinux label of the container to be container_runtime_t. This is needed so that our app can access the insides of /tmp/.X11-unix and whatnot.
-e tells podman to set an environment variable for the process we're running. In this case we're setting the $DISPLAY-variable so that the app inside the container can connect to our current X session.
localhost/xonotic-container is our container from earlier. This name can be checked by doing podman images.
xonotic-glx is our graphical app we want to run inside our container. In this case it's Xonotic.
