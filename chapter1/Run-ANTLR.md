# 1.2 运行 ANTLR 并测试识别程序

下面是识别类似 hello world 和 hello xxx 词组的语法定义：

```Java
// 定义名为 Hello 的语法
grammar Hello;

// 匹配一个关键字 hello，和一个紧随其后的标识符
r : 'hello' ID ;

// 匹配小写字母组成的标识符
ID : [a-z]+ ;

// 忽略空格、Tab、换行以及 \r（windows）
WS : [ \t\r\n]+ -> skip ;
```

将该语法保存在 `install/Hello.g4` 文件中，并运行 `antlr4 Hello.g4` 为其生成词法分析器和语法分析器：

```Java
-rw-r--r--  1 satansk  staff   308B  4  1 23:12 Hello.interp
-rw-r--r--  1 satansk  staff    27B  4  1 23:12 Hello.tokens
-rw-r--r--  1 satansk  staff   1.3K  4  1 23:12 HelloBaseListener.java
-rw-r--r--  1 satansk  staff   1.0K  4  1 23:12 HelloLexer.interp
-rw-r--r--  1 satansk  staff   3.2K  4  1 23:12 HelloLexer.java
-rw-r--r--  1 satansk  staff    27B  4  1 23:12 HelloLexer.tokens
-rw-r--r--  1 satansk  staff   536B  4  1 23:12 HelloListener.java
-rw-r--r--  1 satansk  staff   3.5K  4  1 23:12 HelloParser.java
```

上面生成的词法分析器和语法分析器已经是 **可运行** 的了，但还缺少一个 `main` 函数还触发识别动作。

ANTLR 提供名为 TestRig 的调试工具，TestRig 通过 **反射机制** 调用生成的分析器，1.1 节已经为其定义别名 `grun`。

TestRig 接受一个 **语法名** 与一个 **起始规则名** 作为参数，另外跟一些指定 **输出内容** 的参数：

```Java
± % grun Hello r -tokens

hello xxx

eof
[@0,0:4='hello',<'hello'>,1:0]
[@1,6:8='xxx',<ID>,1:6]
[@2,11:13='eof',<ID>,3:0]
[@3,15:14='<EOF>',<EOF>,4:0]
```

* 使用 Hello 语法 + r 规则启动 TestRig
* hello xxx 是要被识别的语句
* 结束符需要手动输入，UNIX 为 Ctrl + D，Windows 为 Ctrl + Z

因为使用了 `-tokens` 参数，所以 TestRig 会打印全部 **词法符号** 的列表：

```Java
[@0,0:4='hello',<'hello'>,1:0]
[@1,6:8='xxx',<ID>,1:6]
[@2,11:13='eof',<ID>,3:0]
[@3,15:14='<EOF>',<EOF>,4:0]
```

还可以指定其他打印风格，例如 LISP 风格、可视化风格等，下面是常用的选项：

* `-tokens`
  + 打印词法符号流
* `-tree`
  + 以 LISP 风格打印 **语法分析树**
* `-gui`
  + 以可视化方式打印 **语法分析树**
* `-ps file.ps`
  + 以 PostScript 格式生成可视化的 **语法分析树**，并将其存储在 `file.ps` 文件中
* `-trace`
  + 打印规则名字，以及进入、离开该规则时的词法符号
* `-diagnostics`
  + 输出调试信息
* `-SLL`
  + 更快，但稍弱的解析策略
