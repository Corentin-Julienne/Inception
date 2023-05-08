# **Inception**

## **🗣️ About**
---

The project "Inception" of the 42 School is based on Docker. You will need to set up a LEMP stack (For Linux, Nginx, MariaDB, PHP with Wordpress). Each service will be located inside a Docker container.

More information can be found on the subject PDF.

## **⚙️ Explanations about Docker**
--- 

Docker is basically about containers. A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. The containers are not a Docker invention, but Docker is used to simplify the process and run several containers on a smooth way.

We will detail the following points : 

1️⃣ The difference between Docker and a Virtual Machine (VM) <br>
2️⃣ What is a Dockerfile
3️⃣ What are Docker Networks and how does they work
4️⃣ Bind Mounts and Volumes
5️⃣ Docker and Dockerfile best practices

#### *1. Difference between Docker and a Virtual Machine (VM)*

Containers share the machine’s OS system kernel and therefore do not require an OS per application. However, VMs need to have their dedicated OS, so having having several VMs in a single computer might produce some performance issues. In other words, containers are a lightweight solution. 

The advantages of Containers over VMs are :

- lightweight (we speak about Mbs instead of GBs for VMs)
- fast to boot (no need to "charge" the OS features several times, because kernel is shared)

The advantages of Vms over Containers are :

- Containers, because of shared kernel, can't work for different OS environment (indeed you can, but only if you run Containers on top of a VM)

VMs and Containers also share some key features :

- isolation (you just kill the VM or Container in case of problem, for instance, without affecting the whole system)


#### *2. What is a Dockerfile ?*


A Dockerfile is a text file that has a series of instructions on how to build your image. It supports a simple set of commands that you need to use in your Dockerfile. In a nutshell, a Dockerfile is like a Makefile for Docker Image.

You can find a very good overview of the main Dockerfile at this GitHub repository : https://github.com/vbachele/Inception. You might also want to check the official Docker documentation.


#### *3. Docker Networks : how are they working ?*

As Docker uses a philosophy of "one service, one container", it means that containers need to be able to exchange inforamtion and data to make the hole application functional. Therefore, Docker uses a CNM (Controller Network Model) to provide networking for controllers. There are 6 network drivers types provided by Docker with its CNM that you can use, described below :

- bridge : the default option. Dockers make a default network, attributing an IP address to every container/service. Used mostly when your app runs in standalone containers thats need to communicate.
- host : removes the network isolation between Docker host and containers. Not to use for Inception project.
- none : no network at all. Containers are conpletely isolated from one another. Usefulness ?
- overlay : creates an internal private network that spans access all the node participating in the swarm cluster. Docker Swarn is not explained in that tutorial.
- macvlan : gives a container a MAC address, making it appears as a physical device.


#### *4. Bind Mounts and Volumes*


You have to understand several concepts to understand volumes. Volumes are used by Docker to store persistant, stateful data. Container should contain itself stateless data only. 

Among the concepts you need to understand the difference betweem a bind mount and a volume :

- When you use a bind mount, a file or directory on the host machine is mounted into a container. It has quite some performance limitation compared to volumes.
- The difference between bind mounts and volumes : volumes are situated outside of the containers (and are therefore permanents, and not limitated to the life cycle of the container).


#### *5. Docker best practices*

For a more comprehensive article about this topic, see : https://cloud.google.com/architecture/best-practices-for-building-containers.

The goal of this subpart is helping you designing smaller and resilient images, to improve Docker performance. Security is a topic of importance too...

You should absolutely :

- Run a single service per container
- Properly handle PID, signal handling, and zonmbie processors (see chapter about it in the NGINX setup part below)
- Optimize the image for Docker build. Docker uses a cache system, and build an image layer by layer. In practical terms, that means that if you modify a Dockerfile, Docker will execute only the steps that were modified and the steps after. That means you should : 1) place the Docker command that are more likely to change at the end AND 2) you should group some commands whenever possible (do not use 500 RUN commands...)

There are also some other mediumly important good practices such as :

- remove unnecessary tools
- build the smallest image possible (including using a lighter image using the FROM command)

Those are important for performance issues, but also for security (less room for software vulnerabilities)

## **💿 Compilation and Execution**
---

Use the Makefile to trigger dockerfiles. Write ```make``` to launch all the containers.

## **🗑️ Deletion**
---

Write ```make prune``` to suppress all containers and associated data. 

## ✅ Validation

The project has been validated with a mark of 100/100.
