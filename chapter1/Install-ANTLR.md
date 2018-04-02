# 1.1 安装 ANTLR

安装 ANTLR 本身仅需要下载其 jar 包（[地址](http://www.antlr.org/download.html)），该 jar 包包含：

* 运行 ANTLR 的工具
* 编译、执行 ANTLR 生成的识别程序的所有依赖

官方网站提供了在 Mac Linux Windows 等系统中的设置步骤，例如在 Mac 中：

```Java
OS X
$ cd /usr/local/lib
$ sudo curl -O https://www.antlr.org/download/antlr-4.7.1-complete.jar
$ export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
$ alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
$ alias grun='java org.antlr.v4.gui.TestRig'
```

以后就可以直接使用 `antlr4` 和 `grun` 了。
