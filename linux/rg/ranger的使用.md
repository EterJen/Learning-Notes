[ranger](https://github.com/ranger/ranger)是一个可以在GNU/Linux终端模拟器中，进行预览文件的一个工具，相当于一个简易的文件管理器，
安装最新版本建议使用pip或者pip3，我这里使用的Ubuntu，软件仓库的版本较低，所以使用了pip3进行安装

```
sudo pip3 install ranger-fm
```

使用sudo安装的好处是在root下也可以使用ranger，安装完成后，可以集成fzf模糊查询，在~/.config/ranger/目录下，新增commands.py，
加入如下内容

```
from ranger.api.commands import Command

class (Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            
            command="find -L . ( -path '*/.*' -o -fstype 'dev' -o -fstype 'proc' ) -prune 
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command="find -L . ( -path '*/.*' -o -fstype 'dev' -o -fstype 'proc' ) -prune 
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
```

编辑～/.config/ranger/rc.conf，加入

```
set preview_images true
map <C-f> fzf_select
map DD shell mv %s /home/${USER}/.local/share/Trash/files/
```



安装**highlight**进行代码高亮提示。

ranger有几款[插件](https://github.com/ranger/ranger/wiki/Plugins)也很不错，可以自行安装。