# The green spot

A blog about tour reports, equipment and experiences about trekking and hiking.

# Installation

## Requirements
Make sure you have the following applications installed:
* `git`
* `hugo`
* a good editor to write/edit HTML, CSS and Markdown documents (like `Atom` or `vim`)

To build and deploy this, there's a script (`deploy.sh`).
It's tailored exactly to the server of [the-green-spot](https://the-green-spot.de), so you might want to change it.

Nevertheless, you need some things in addition to the ones above in order to use the script:
* an interpreter (something like `gnome-terminal`)
* `ssh`
* `sshpass`

## Get this website
1. Clone this repo: `git clone https://github.com/hauke96/the-green-spot.git`
2. Install the _hamburg_-theme
    * Create theme directory: `mkdir themes/hamburg`
    * Download the theme: `git clone https://github.com/hauke96/hugo-theme-hamburg.git`

# Create content
This site is based on `hugo` so you can use its normal commands.

## Create a post
Posts are in `./content/posts/`. Therefore adding a new post looks like this:

```bash
$ hugo new posts/your-title.en.md
/home/name/whatever/the-green-spot/content/posts/your-title.en.md created
```

The post is pretty empty but the header has been generated:
```bash
$ cat content/posts/your-title.en.md
+++
draft = true
title = ""
summary = ""
date = 2019-01-28T21:44:06+01:00
tags = []
author = ""
+++
```

# Run it (locally)
Use `hugo` with `hugo server -D -v` or build it (see blow) and use your own server.

# Build it
Just execute `hugo` (without parameters) and look into the `public`-folder.

## For beta
There is a [beta site](https://the-green-spot.de/beta). Because the URL is different, it must be build like this:

1. Change the URL in the `config.toml`
2. Build using `./build.sh`
3. Upload

# Git versioning & workflow

## Versioning
The scheme is `[major].[minor].[patch]`.

Increase the `major`, when:
* A new article is done
* A new page is done

Increase the `minor`, when:
* Changes to an article
* Changes to a page
* Changes to the style
* Changes to the layout

Increase the `patch`, when:
* Just a fix is added

## Branches
There's the `master` and `dev` branch. The master contains (at least since the 23.08.2018) only released/releasable commits. The `dev` branch contains the indev-state and may not be usable.

Create features, articles or pages on a branch `<type>/name` where `type` is e.g. `post` and where you develop/write the feature `name`.

## Development/writing workflow
For larger features or posts (which takes longer then a day or two):

1. Create a feature/article/post called `foo`: Create a branch `<type>/foo` (where `<type>` is one of `feature`, `post` or `page`)
2. Write and commit
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

# Compression of images
I used the following configurations:

## Background image

```bash
convert -strip -interlace Plane -sampling-factor 4:2:0 -quality 65% -resize x650 -gaussian-blur 1x1 bg.jpg bg-out.jpg
```

## Favicon

```bash
convert -interlace Plane -resize x32 favicon.jpg favicon.ico
```
