# SUSE DevStacks

This is an experiment in providing developer images for openSUSE and SLES.
The goal is to create language specific images for developers to base their
development on, including python, ruby, java etc.

These images are available in two flavors, one based on openSUSE
Leap (such as Leap 15.2), and the other based on the corresponding
version of SLES (in the given example, this would be SLES15-SP2). In
terms of actual content, however, these images contain the same
libraries, utilities, interpreters, etc.

Currently, these images are built via github actions, and get published
under ghcr.io/okirch.

So, in order to try the python image for SLES15-SP2, you would pull from

  ghcr.io/okirch/sle15-sp2-python-3.6-runtime:latest
