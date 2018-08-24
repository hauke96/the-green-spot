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

# Git versioning & workflow

## Versioning
The scheme is `[major].[minor]`.

Increase the `major`, when:
* A new article is done
* A new page is done

Increase the `minor`, when:
* Changes to an article
* Changes to a page
* Changes to the style
* Changes to the layout

## Branches
There's the `master` and `dev` branch. The master contains (at least since the 23.08.2018) only released/releasable commits. The `dev` branch contains the indev-state and may not be usable.

Create features on a branch `feature/name` where you develop the feature `name`.

## Development workflow
For larger features (which takes longer then a day or two):

1. Create a feature branch `feature/foo`
2. Implement whatever your feature should be
3. Merge into `dev` when done

## Release workflow
1. Create branch for the next version, e.g. `release/v1.2` when `v1.1` is the latest version
2. Make last changes neccessary for deployment
3. Merge into `dev`
4. Merge into `master` (with `git merge --no-ff release/v1.2`)
5. Create a tag `v1.2` (on the `master` branch)
6. Deploy this tag
7. Delete the `release/v1.2` branch

## Fix bugs/mistakes
1. Checkout the latest version from the master (e.g. `v1.2`)
2. Create a new branch `fix/v1.2`
3. Fix the mistake
4. Make last changes neccessary for deployment
5. Merge into `dev`
6. Merge into `master` (with `git merge --no-ff fix/v1.2`)
7. Create a tag `v1.3` (on the `master` branch; `git tag -a v1.3 -m "Some message"`)
8. Deploy this tag
9. Delete the `fix/v1.2` branch

## Forbidden workflows
These things are **not allowed**:

* Merge from feature-branch into master
* Merge from dev-branch directly into master
* Merge from master into any other branch
* Tag any commit which is not on the master
* Release something which is not on the master
* ...
