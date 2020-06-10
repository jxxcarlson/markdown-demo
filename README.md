# Markdown+Math Demo

This folder demonstrates some of the features of 
the library `jxxcarlson/elm-markdown`.  We will
refer to the flavor of Markdown defined by this
library as *Math Markdown* or simply *MMarkdown*.

There are two apps

- editor
- reader

The first is a simple editor, with the source text
on the left and the rendered text on the right.
The source text is rendered as you type.  You can
copy text from the source text window as well as 
paste text into it.

The second app is a "reader" for markdown files.
The files it reads are provided by a web server.
The url for the server is set in `./reader/src/Config.elm`.
The current setting is.

````
    serverUrl = "http://localhost:4000"
````


## Running the server

There is a small demo server located in `./public/server`.   The files served are in `./public/server/data`.
The server is written in [Deno](https://deno.land/), which is 
a successor to Node written by Ryan Dahl, the creator of Node.
To install Deno, run the relevant one of the following two
commands.  For Mac and Linux, use

```
$ curl -fsSL https://deno.land/x/install/install.sh | sh
```

For Windows (Powershell), use

```
iwr https://deno.land/x/install/install.ps1 -useb | iex
```

It is worthwhile to also install the Deno script 
runner [Velociraptor](https://dev.to/umbo/velociraptor-an-npm-style-script-runner-for-deno-26a)
which you do this way:

```
deno install -qA -n vr https://deno.land/x/velociraptor/cli.ts
```

Velociraptor runs using the command `vr` in the terminal.                                                                                                                                                                                        Go to `./reader/public/server`
and say `vr`.  This will list the commands available; they are defined
in `scripts.yaml`.  To run the server, say `vr server`.


## Running the Reader

To run the reader, go to `./reader` and say `vr` to list the commands available.
Run `vr make` or simply `elm make --optimize --output=public/Main.js`.  
Then open `public/index.html` with a browser.

## Running the Editor

Go to `./editor`.  Run the command `vr make`.  Then open `public/index.html`.

