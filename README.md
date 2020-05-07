This repo contains configs for many programs I use (or used). Below
are some commands to install or uninstall my configs:

#### Clone

Put configs in `$HOME/.configs`:

```
$ git clone https://gitlab.com/mjwhitta/configs.git $HOME/.configs
$ cd $HOME/.configs
```

#### Install

This will make backups of existing configs:

```
$ ./installer link
```

#### Force install

This will NOT make backups of existing configs:

```
$ ./installer -f link
```

#### Unintall

This will restore any backups that exist:

```
$ ./installer unlink
```

#### Configure

To configure, simply copy `files.default` to `files` and comment or
delete the entries you don't want.
