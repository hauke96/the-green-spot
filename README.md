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

Call this script with `--beta` to deploy into the beta sub-folder.

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
---
draft: true
title: ""
summary: ""
date: 2019-01-28T21:44:06+01:00
tags: []
author: ""
---
```

# Run it (locally)
Just use the `run.sh` script to start hugo with the local environment or `run.sh -f` to also open the local blog-URL in Firefox.

Of course you can also use hugo manually.
Just execute `hugo server -D -v` or build it (see blow) and use your own HTTP-server.

# Build it
Just execute `hugo` (without parameters) and look into the `public`-folder.

Specify an environment with `--environment <env>` to use a different config from the `./config/` folder.

## For beta

> This is out of date since there are dedicated configuration files in `./config/`.

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
4. Adjust additional stuff if needed
5. Merge into `master` branch
6. Create a new tag
	1. Major: Do not increase unless huge change (e.g. redesign of blog)
	2. Minor: Increase for new article, post, etc.
	3. Patch: Increase for smaller adjustments, fixed typos, rewriting of passages, etc.
7. Deploy on blog

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

## Photos for posts
For normal horizontal photos:
```bash
convert -resize 1600x -quality 75 DSC00835.JPG DSC00835_1600.JPG
```

For vertical photos:
```bash
convert -resize x1600 -auto-orient -quality 75 DSC00835.JPG DSC00835_1600.JPG
```

Convert all pictures at once:
```bash
for f in ./*; do convert -resize 1600x -quality 75 $f "${f%.*}_1600.jpg"; done
```

Print all JPG names with qualities above 75%:
```bash
for f in ./*; do q=$(identify -format '%Q' $f) && if [[ $q > 75 ]]; then echo "$f  ==>  $q"; fi; done
```

Convert all JPG files with a quality of over 75%:
```bash
for f in ./*; do q=$(identify -format '%Q' $f) && if [[ $q > 75 ]]; then mogrify -quality 75 $f; fi; done
```

Adjust hue/saturation/value (here 20% more saturation):
```bash
for f in ./*; do convert -modulate 100,120,100 $f "../rheinsteig-2020_saturation/${f}"; done
```