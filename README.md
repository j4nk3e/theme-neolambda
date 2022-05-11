# NeoLambda

> The unofficial fork of the [omf][lnk1] [lambda][lnk2] theme

[lnk1]: <https://github.com/oh-my-fish/oh-my-fish>
[lnk2]: <https://github.com/hasanozgan/theme-lambda>

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)

<a id="featurecast"></a>

## Featurecast 🎥

[![asciicast](https://asciinema.org/a/211469.svg)](https://asciinema.org/a/211469)

## Gif

<details>
<summary>An animated GIF deoming some of the features provided by this theme</summary>
<img src="https://i.imgur.com/qgKd2HV.gif" width="640">
</details>
<br>
<br>

> To avoid [double printing](https://raw.githubusercontent.com/ipatch/theme-lambda/master/lib/virtualenv-double-prompt.png) of the virtualenv name in prompt add the below to `config.fish`

```shell
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
```

<a id="install"></a>

## Install

<a id="install-omf"></a>

### [Oh-My-Fish](https://github.com/oh-my-fish/oh-my-fish)

```shell
echo "install omf first"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf install neolambda
```

## Testing new features

the quickest way i found to test a PR or feature is to pull in a docker container, for my use case `archlinux` and then install `which`, and `git` using pacman followed by omf and this theme `neolambda`.

## TODOs

- [ ] look into creating project based icons, ie. replace `λ` with a green box if inside a node project, ie. if the shell/theme detects a `package.json` file. 
- [ ] use command+right-arrow to toggle the display of the `fish_right_prompt.fish`
    - or possible control+\
- [ ] experiment with creating an animated svg to replace / complement the animaged gif
  `cat myrecrod.cast | svg-term --out myrecord.svg --window`
