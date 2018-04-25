# Sonatype Nexus 3 Repository Manager OSS Docker Image
A Sonatype Nexus3 OSS image which makes it easy to do volume mounting

This image is based off the official Jenkins Docker image with the addition of allowing the jenkins user to be 
added to a specific group. You can control exactly what this group is by specifying the Group ID by means of an 
environment variable (LOCAL_USER_GID). In addition, the User ID can also be specified by means of an environment 
variable (LOCAL_USER_ID).

The intention is that the group has the correct permissions to access the mounted volume. 
This image is intended to be used with AWS EBS and AWS EFS.

The base [Nexus](https://hub.docker.com/r/sonatype/nexus3) image used is 3.10.0.
