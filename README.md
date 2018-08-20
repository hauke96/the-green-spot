# The green spot

A blog about tour reports, equipment and experiences about trekking and hiking.

# Installation

## Requirements
Make sure you have the following applications installed:
* git
* hugo
* a good editor to write/edit HTML, CSS and Markdown documents

To build and deploy the whole thing, there's a script (`deploy.sh`).
It's tailored exactly to the server of [the-green-spot](https://the-green-spot.de), so you might want to change it.

Nevertheless, you need some things in addition to the ones above:
* an interpreter for this script (something like `gnome-terminal`)
* ssh
* sshpass

## Get this website
1. Clone this repo<br>
  * Download this repo: `git clone https://github.com/hauke96/the-green-spot.git`
2. Install the _hamburg_-theme
  * Create theme directory: `mkdir themes/hamburg`
  * Download the theme: `git clone https://github.com/hauke96/hugo-theme-hamburg.git`

# Run it (locally)
Use hugo with `hugo server -D -v` or build it (see blow) and use your own server.

# Build it
Just execute `hugo` and look into the `public`-folder.
