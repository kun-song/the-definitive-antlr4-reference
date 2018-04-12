# 4 A Quick Tour

本章通过 4 个主题快速介绍（不明白也别急，细节在后面章节会继续介绍） ANTLR 的不同特性：

1. 以简单的算术表达式语言为例，介绍：
  * 分析其语法
  * parser 的启动过程
  * 使用 `import` 拆分语法
  * parser 如何处理异常输入
2. 使用 visitor 模式构建计算器
3. 使用 listener 模式构建翻译器
4. 在 grammar 中嵌入 action
  * action 是指 **任意代码片段**
  * 一般用 vistor 或 listener 机制就足够了，但为了 **极端灵活性**，ANTLR 允许将任意代码  **注入** 自动生成的 parser 中，注入的代码将在 parsing 过程中执行
  * action 结合 semantic predicate，可以在运行时让部分语法消失，从而可处理 **多版本** 的语言
