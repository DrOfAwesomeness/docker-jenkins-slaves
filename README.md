# Docker Jenkins slave images
This repository contains Dockerfiles to build jenkins slave images. These images are basically just SSH servers that allow you to configure passwords using enviornment variables (I suggest using randomly-generated passwords that are 24 characters or longer, you won't need to remember them), provide a JRE for the Jenkins slave jar, and provide the tools nessicary to build your project (what those are depends on the image.)