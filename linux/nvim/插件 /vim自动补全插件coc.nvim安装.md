1. [首页](https://www.jianshu.com/)[下载APP](https://www.jianshu.com/apps?utm_medium=desktop&utm_source=navbar-apps)

    # vim自动补全插件coc.nvim安装

    [![img](https://upload.jianshu.io/users/upload_avatars/2237200/264589f6-1adc-4536-8b5d-c13450a5f853.png?imageMogr2/auto-orient/strip|imageView2/1/w/80/h/80)太古汤](https://www.jianshu.com/u/dff8cdcd4320)

    # vim自动补全插件coc.nvim安装

    [![img](https://upload.jianshu.io/users/upload_avatars/2237200/264589f6-1adc-4536-8b5d-c13450a5f853.png?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96)](https://www.jianshu.com/u/dff8cdcd4320)

    [太古汤](https://www.jianshu.com/u/dff8cdcd4320)

    0.1872019.04.29 23:26:18字数 312阅读 14,055

    coc.nvim是一个vim以及neovim的自动补全插件。

    相对于YCM插件，插件体积更小，安装更方便一些。
     就个人体验，coc.nvim的补全效果体验更好一些。

    具体安装的官方wiki：
     [https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fneoclide%2Fcoc.nvim%2Fwiki%2FInstall-coc.nvim)

    vim版本要求
     neovim >= 0.3.1
     vim >= 8.1

    # 1.依赖安装

    安装nodejs和yarn

    ```cpp
    curl -sL install-node.now.sh | sh
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
    ```

    # 2.安装coc.nvim插件

    在使用vim-plug管理vim插件的话
     在vimrc中添加

    ```bash
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    ```

    然后运行

    ```css
    :PlugInstall
    ```

    # 3.安装后检查

    打开vim
     执行

    ```css
    :checkhealth
    ```

    如果有异常会列出异常情况，并给出解决方案，按照上面的命令执行，基本就可以解决安装过程中的异常。

    # 4.语言支持

    要让coc.nvim支持某个语言，需要在配置文件中写上关于文件的配置。
     打开vim，执行

    ```css
    :CocConfig
    ```

    打开配置文件，配置文件格式为json。

    在下面的wiki中，找到不同语音的配置，复制到自己的配置中。并安装对应的language-server即可。（不同的server安装方式不同。具体见里面的wiki）
     [https://github.com/neoclide/coc.nvim/wiki/Language-servers](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fneoclide%2Fcoc.nvim%2Fwiki%2FLanguage-servers)

    "小礼物走一走，来简书关注我"

    还没有人赞赏，支持一下

    [![  ](https://upload.jianshu.io/users/upload_avatars/2237200/264589f6-1adc-4536-8b5d-c13450a5f853.png?imageMogr2/auto-orient/strip|imageView2/1/w/100/h/100)](https://www.jianshu.com/u/dff8cdcd4320)

    [太古汤](https://www.jianshu.com/u/dff8cdcd4320)强迫症患者

    总资产1 (约0.08元)共写了2332字获得9个赞共6个粉丝

    <iframe id="iframeu6201831_0" name="iframeu6201831_0" src="https://pos.baidu.com/zcnm?conwid=728&amp;conhei=90&amp;rdid=6201831&amp;dc=3&amp;exps=110261,110252,110011,110741&amp;psi=bcda27b2d1c53ef1f98ca7d26a79d00e&amp;di=u6201831&amp;dri=0&amp;dis=0&amp;dai=1&amp;ps=1975x329&amp;enu=encoding&amp;ant=0&amp;aa=1&amp;dcb=___adblockplus_&amp;dtm=HTML_POST&amp;dvi=0.0&amp;dci=-1&amp;dpt=none&amp;tsr=0&amp;tpr=1616680609548&amp;ti=vim%E8%87%AA%E5%8A%A8%E8%A1%A5%E5%85%A8%E6%8F%92%E4%BB%B6coc.nvim%E5%AE%89%E8%A3%85%20-%20%E7%AE%80%E4%B9%A6&amp;ari=2&amp;ver=0323&amp;dbv=0&amp;drs=3&amp;pcs=1658x941&amp;pss=1658x2871&amp;cfv=0&amp;cpl=0&amp;chi=1&amp;cce=true&amp;cec=UTF-8&amp;tlm=1616680609&amp;prot=2&amp;rw=941&amp;ltu=https%3A%2F%2Fwww.jianshu.com%2Fp%2F55cf1fa7a467&amp;ecd=1&amp;uc=1920x1044&amp;pis=-1x-1&amp;sr=1920x1080&amp;tcn=1616680610&amp;qn=9ffe4bf519af7cfd&amp;tt=1616680609530.23.23.25" scrolling="no" vspace="0" hspace="0" marginwidth="0" marginheight="0" style="border:0;margin:0;width:728px;height:90px" allowtransparency="true" width="728" height="90" frameborder="0" align="center,center"></iframe>

    