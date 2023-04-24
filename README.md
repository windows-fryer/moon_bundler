# MoonBundler
This repository contains a project that compiles MoonScript into Lua and bundles it into a single Lua file using Tape. It simplifies the process of integrating MoonScript code into your Lua projects by creating a single, standalone Lua file.

## Prerequisites
Before you can use this tool, you'll need to have the following software installed:
- [Node.js](https://nodejs.org/en/download/) (version 12 or newer)
- [MoonScript](https://moonscript.org/#installation) (version 0.5.0 or newer)
- [Tape-Lua](https://github.com/ggcrunchy/tape-lua) (version 3.3.0 or newer)
- [Python](https://www.python.org/downloads/) (version 3.0 or newer)

## Installing
These are my prefered ways of installing.

*1: Install luarocks to setup MoonScript*
```
scoop install luarocks
scoop install cmake
scoop install mingw
```

*2: Install moonscript*
```
luarocks install moonscript
luarocks install moonpick
```

*3: Install node.js & tape*
```
scoop install nodejs
npm install -g tape-lua
```

*4: Install python*
```
scoop install python
```

*5: Clone repository*
```
git clone https://github.com/windows-fryer/moon_bundler.git
cd moon_bundler
```

## Usage
Open this file inside of Visual Stuio Code and run the build task. You'll have your lua code inside of `build` and bundle inside of `bundle`.
