# simple_vimrc_config
# 简单的VIM配置

环境: Mac&Debian  
作为一个用来写c的vim新手,花了点时间收集配置了常用的几种vim插件,下面的过程可以让其他人也快速配置好  
功能:增加代码自动补全,代码配色,文件多开时的切换条/底部状态栏,撤销树,快速跳转搜索,括号自动补充

![](/sample.jpg)
![](/color_sample.jpg)

```
插件列表
Plugin 'gmarik/vundle'                                                                
Plugin 'Valloric/YouCompleteMe'                                                               
Plugin 'spf13/vim-colors'                                                           
Plugin 'gcmt/wildfire.vim'                                                            
Plugin 'vim-airline/vim-airline'                                                            
Plugin 'vim-airline/vim-airline-themes'                                                             
Plugin 'powerline/fonts'                                                             
Plugin 'mbbill/undotree'                                                              
Plugin 'easymotion/vim-easymotion'                                                            
Plugin 'jiangmiao/auto-pairs'  
```

在为VIM安装插件之前,需要先检查一下当前的vim是否支持python  
<h1>Step1:检查vim是否支持python</h1>
```
vim —version |grep python  
```
需要看到下面这两种  
+python  
-python3  
两个都是加好也行,总之+python必须有  
  
如果是-python的话,那么就需要重新编译vim:  
raspbian上先安装apt-get install ncurses-dev  
```
git clone https://github.com/vim/vim.git vim-master  
tar -xf vim-master5  
cd vim-master/src  
sudo ./configure --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-arm-linux-gnueabihf
sudo make install  
```
这样之后再检查vim,如果看到+python就继续  
  
  
如果之前的步骤正常那么就可以开始安装Vundle,这是一个包管理工具,第一步执行下面指令
<h1>Step2:安装vundle</h1> 
```
sudo git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
然后在~目录下就会出现.vim文件夹(这个目录其实可以是任何地方,下面的过程都是以放在~/下)  
~/.vim/colors #为代码配色的文件,安装代码配色插件后移动文件到这里,这样在vimrc里就可以引用  
~/.vim/bundle #为所安装的插件  
~/.vimrc #第一次要新建,为vim的配置文件,可以把所需要的插件或者需要执行的vim指令写到里面,这样就会每次使用都会自动执行  
  
<h1>Step3:新建一个空白文件~/.vimrc,把配置好的vimrc内容拷贝进去</h1> 
然后将我准备好的.vimrc文件放在~/.vimrc下,具体的配置请看文件内的内容  

这是几种vim的指令:  
&emsp;&emsp;新插件:BundleUpdate  
&emsp;&emsp;清除不再使用的插件:BundleClean  
&emsp;&emsp;列出所有插件:BundleList  
&emsp;&emsp;查找插件:BundleSearch  
  
放好了配置好的.vimrc文件后,进入vim,输入:BundleInstall,就会开始自动安装vimrc里指定的插件,然后其他插件就搞定了,除了自动补全YouCompleteMe这个插件仍然需要自己编译,其他的插件都已经安装完毕了,具体请看vimrc文件内容  
  
<h1>Step4:编译YouCompleteMe</h1> 
然后为了编译YouCompleteMe:  
请先安装CMake(`Linux: sudo apt-get install cmake`/`MacOS: sudo brew install cmake`)  
然后进入~/.vim/bundle/YouCompleteMe  
有两种编译两种常用选择
```
./install.py --all #支持所有功能  
./install.py --clang-completer #只支持C/C++补全  
```
对我来说,支持C/C++就足够了,-h查看还有更多的选择,不过想要更多的功能,那就得安装更多的依赖库等东西才行  
  
我在Mac上面编译时一次成功,不过我在rasp(Debian)上第一次编译遇到报错  
`pyconfig.h: No such file or directory`
解决办法是安装依赖库  
`sudo apt-get install python-dev libxml2-dev libxslt-dev`  
  
rasp(Debian):在第二次编译总是卡在处仍然报错  
解决办法是指定YCM_CORES=1在编译前,所以我的编译指令为  
YCM_CORES=1 ./install.py --clang-completer  
  
rasp(Debian):第三次编译仍然失败  
libclang.so.3.8: error adding symbols: File in wrong format  
最后`sudo apt-get install vim-youcompleteme && vam install youcompleteme`  
成功  
    
<h1>Step5:给.ycm_extra_conf.py文件内添加头文件目录</h1> 
成功后sudo修改~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py  
找到设置flags的地方
```
flags = [  
'-Wall'. . .  
```
在尾部加上自己操作系统的头文件所处位置  
比如
```
'-isystem',  
'/usr/include',  
'-isystem',  
'/usr/local/include',  
]  
```
在Macos上的话建立符号链接/usr/include指向Xcode的SDK的include目录下  
  
<h1>完成!</h1> 
哈!到此为止,再打开vim,应该就可以用了,任何错误请帮助指出! 谢谢!  
  
- - - - - - - - - - - - 
  
<h1>额外:使用snf13的配置</h1> 
然后有一个自动配置vim的脚本叫spf13,我一开始尝试过这个,但是后来发现功能太多我用不到,而且让vim的插件管理变得更复杂了  
  
想要配置vim很简单使用一个自动配置所需要的插件的脚本spf13,输入下面的sh命令  
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh  
而如果想要卸载,就是sudo rm -rf ~/.spf13-vim-3,然后rm -rf ~/.vim*  
  
那么开始安装spf13就是运行这个脚本sudo sh spf13-vim.sh,然后等运行结束,vim就可以用了,不过功能太多,而且那个配色在我的终端里并不实用  
  
在spf13里安装youcompleteme  
  
新建一个文件~/.vimrc.before.local,在里面加上一行,这一行是用来选择性安装spf13提供的插件包的,具体看~/.vimrc.bundles  
let g:spf13_bundle_groups=['general','youcompleteme']   
当然和上面一样,youcompleteme的安装需要vim支持python,不支持的话,就到最上面重新编译安装vim  
YouCompleteMe unavailable: requires Vim compiled with Python (2.6+ or 3.3+) support  
其他编译等步骤和上面都一样了,而且需要修改.vimrc文件在里面加上youcompleteme的使用配置,这个请参考我的vimrc配置