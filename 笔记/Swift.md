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

   1. Swift doesn't require you to write a semicolon(;) after each statement , although you can
   2. semicolons are required if you want to wirte multiple separate statements on a single line

6. 基本数据类型

   1. 整数
      - 无小数部分的数字
      - Int，Int8，Int16，Int32，Int，UInt
      - Int的位数与操作系统一致。有可能，尽量用Int
      - Int.min,Int.max
   2. 实数
      - 有小数部分的数字
      - Float（32位，精度6位），Double（64位，精度15位）
   3. Bool
      - Bool型文字：true，false

7. 类型转换和类型推导

   1. 类型推导

      ```
      let meaningOfLife = 42
      // meaningOfLife is inferred to be of type Int
      let pi = 3.14159
      // pi is inferred to be of type Double
      ```

   2. 类型转换

      ```
      let three=3
      let pp=0.141596l
      let pi = Double(three) + pp
      
      ```

8. String and Character

   1. String Literal : surrounded by double quotation marks ("")

      ```
      let string1="hello"
      let string2="there"
      var welcome = string1 + string2
      ```

   2. Character Literal

      ```
      let exclamationMark: Character = "!"
      welcome.append(exclamationMark)
      ```

   3. String Interpolation

      ```
      let multiplier = 3
      let message = "\(multiplier)times 2.5 is \(Double(multiplier)*2.5)"
      // message is "3 times 2.5 is 7.5"
      ```

9. String and Unicode