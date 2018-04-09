# 3 A Starter ANTLR Project

本章为 C/Java 的一个很小语法子集构建 grammar，以识别 `{}` 中的整数，其中 `{}` 可以嵌套，例如 `{1, 2, }` 和 `{1, {2, 3}}`，形如 `{1, 2, 3}` 可以作为 `int` 数组的初始化器。

为这么简单的 syntax 构建 grammar 有什么用处呢，实际上该语法可以：

* 将 `int` array 转换为 `byte` array（若数组中的整数都可以用 `byte` 存储）
* 将 Java 的 `short` 数组的初始化器转换为 `String`

例如将：

```Java
static short[] data = {1, 2, 3};
```

转换为：

```Java
static short[] data = "\u0001\u0002\u0003";
```

因为 Java 中的 `char` 是 unsigned short，因此 1 可以用 `\u0001` 表示。

为什么要多此一举呢？因为 Java 的数组初始化器是通过显式赋值实现的，`static short[] data = {1, 2, 3};` 会被转换为：

```Java
data[0] = 1;
data[1] = 2;
data[2] = 3;
```
