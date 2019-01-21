# X86 Assembly Language

### 在开始学习汇编之前，我们先来重新认识一下 `数` 这个概念。

在现实生活中我们有很多中表示数的方法。在原始社会的时候使用木棍、绳结、小石头等来表示数。到来古代我们的祖先使用筹算，算筹的摆法也成为了一个数的表示方法。在国外，古罗马的数字相当进步，罗马数字的符号一共只有7个：I（代表1）、V（代表5）、X（代表10）、L（代表50）、C代表100）、D（代表500）、M（代表1,000）把这些符号重新排列组合起来就能表示你想要的数值。

而现在世界通用的数值1、2、3、4、5、6、7、8、9、0，我们称为阿拉伯数字。实际上它们是古代印度人最早使用的。后来阿拉伯人把古希腊的数学融进了自己的数学中去，然后又把这简便易写的记数法传遍了欧洲，才逐渐演变成今天我们常用的阿拉伯数字。

 归根结底`数`是为了解决我们生活中的问题。

### 在突飞猛进的21世纪我们的计算机中是如何表示数的呢？

随着计算机技术的飞速发展，踊跃出来的深度计算、神经网络、机器学习、人工智能显得我们计算机非常出神入化，实际上计算机并不是如我们所看到的那样，它傻的宛如一个智障，因为它只认识`0`和`1`两个数值，而`0`和`1`就是我们在计算机中所表示的数了，也就是我们计算机用语所说的二进制数(`Binary number`)。

#### 二进制数(Binary System):
所谓二进制就是逢二进一，在计算机中使用的是二进制系统，二进制系统使用2位数来表示，既`0` 和 `1` 因此基数为2。
二进制数中的每个数字叫做位(`Bit`)，4个Bits称为半字节(`Bibble`)，8个Bits表示一个字节(`Byte`)，两个Bytes表示一个字(`Word`)，两个Word表示双字节(`Double Word`)。

![二进制](/Images/binary.png)

![二进制转十进制](/Images/binary2decimal.png)

> * 在计算机中我们把在一个数值后面添加`b`为二进制数(Binary number)
    例如:100b表示十进制数4
