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

