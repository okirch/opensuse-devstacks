# SUSE DevStacks

This is an experiment in providing developer images for openSUSE and SLES.
The goal is to create language specific images for developers to base their
development on, including python, ruby, java etc.

These images are available in different flavors, based on one or
several of openSUSE Tumbleweed, openSUSE Leap (such as Leap 15.2),
and SLE 15-SP2. Of course, the availability of a specific container and 
version depends on the availability of that version on the respective
platform. For example, tumbleweed has java 14, 15 and 16, whereas
SLE 15 SP2 only has java 11.

Currently, these images are built via github actions, and get published
in two places:

  - ghcr.io/okirch
  - github.com/okir

This is the table of images currently available:


<table>
 <tr>
  <th></th>
  <th>leap-15.2</th>
  <th>sle-15.2</th>
  <th>tumbleweed</th>
 </tr>
<tr>
 <td>go-1.15</td>
 <!-- leap-15.2 -->
    	     <td><a href="https://hub.docker.com/repository/docker/okir/leap-15.2-go-1.15">leap-15.2-go-1.15</a></td>
 <!-- sle-15.2 -->
    	 	        <td><a href="https://hub.docker.com/repository/docker/okir/sle-15.2-go-1.15">sle-15.2-go-1.15</a></td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-go-1.15">tumbleweed-go-1.15</a></td>
</tr>
<tr>
 <td>go-1.16</td>
 <!-- leap-15.2 -->
    	     <td><a href="https://hub.docker.com/repository/docker/okir/leap-15.2-go-1.16">leap-15.2-go-1.16</a></td>
 <!-- sle-15.2 -->
    	 	        <td><a href="https://hub.docker.com/repository/docker/okir/sle-15.2-go-1.16">sle-15.2-go-1.16</a></td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-go-1.16">tumbleweed-go-1.16</a></td>
</tr>
<tr>
 <td>java-11</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td><a href="https://hub.docker.com/repository/docker/okir/sle-15.2-java-11">sle-15.2-java-11</a></td>
 <!-- tumbleweed -->
     <td>n/a</td>
</tr>
<tr>
 <td>java-14</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td>n/a</td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-java-14">tumbleweed-java-14</a></td>
</tr>
<tr>
 <td>java-15</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td>n/a</td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-java-15">tumbleweed-java-15</a></td>
</tr>
<tr>
 <td>java-16</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td>n/a</td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-java-16">tumbleweed-java-16</a></td>
</tr>
<tr>
 <td>python-3.6</td>
 <!-- leap-15.2 -->
    	     <td><a href="https://hub.docker.com/repository/docker/okir/leap-15.2-python-3.6">leap-15.2-python-3.6</a></td>
 <!-- sle-15.2 -->
    	 	        <td><a href="https://hub.docker.com/repository/docker/okir/sle-15.2-python-3.6">sle-15.2-python-3.6</a></td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-python-3.6">tumbleweed-python-3.6</a></td>
</tr>
<tr>
 <td>python-3.8</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td>n/a</td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-python-3.8">tumbleweed-python-3.8</a></td>
</tr>
<tr>
 <td>rust</td>
 <!-- leap-15.2 -->
     <td>n/a</td>
 <!-- sle-15.2 -->
     <td>n/a</td>
 <!-- tumbleweed -->
     <td><a href="https://hub.docker.com/repository/docker/okir/tumbleweed-rust">tumbleweed-rust</a></td>
</tr>
</table>

