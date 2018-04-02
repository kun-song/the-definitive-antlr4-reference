// 定义名为 Hello 的语法
grammar Hello;

// 匹配一个关键字 hello，和一个紧随其后的标识符
r : 'hello' ID ;

// 匹配小写字母组成的标识符
ID : [a-z]+ ;

// 忽略空格、Tab、换行以及 \r（windows）
WS : [ \t\r\n]+ -> skip ;
