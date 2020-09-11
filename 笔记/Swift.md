## iOS开发
### 2_Swift

1. Swift语言基础
	
	- Swift兼容Objective-C。一定程度上，被视为没有C的objective-C
	
2. Swift的三大特性
	- 安全：提供多种安全措施，如值在使用前初始化，自动内存管理
	- 强大：高度优化的LLVM编译器生成，如低级的类似C语言的函数等
	- 现代：采纳了许多现代语言的特性，如闭包，泛型，元组，函数式编程
	
3. 常量和变量
	Declaring Constants and Variables（let 和 var）
	
	```
	let maximun = 100
	var x = 0.0
	var welcomeMessage: String //Type Annotations
	```
	Tips:
	
	1. don't begin with a number
	2. can't contain whitespace characters,mathematical symbols,arrows, private-use Unicode scalar values, or line- and box-drawing characters

4. Standard I/O

   1. print()

      ```
      print("Hello world!")
      ```

   2. readline()

      ```
      let input = readline()?.split(separator:" ")
      if let inp = input {
      	for item in inp{
      		print(item)
      }
      }
      ```

5. ;

   1. 