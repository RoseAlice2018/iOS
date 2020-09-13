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

   1. Unicode

   2. Counting Characters: .count

      ```
      var word = "cafe"
      print("the number of characters in \(word) is \(word.count)")
      
      ```

10. String Index

    1. You can access any character(of type Character) in a String using [] notation. But the indexes inside the [] are not Int, they are a type called String.Index.

       ```
       let s:String = "hello"
       let firstIndex:String.Index = s.startIndex
       
       let firstChar:Character = s[firstIndex]
       
       let fifthChar:Character = s[s.index(firstIndex,offsetBy:4)]
       
       let substring = s[firstIndex...secondIndex]
       ```

11. Tuples(元组)

    1. Tuples group multiple values into a single compound value. The values within a tuple can be of any type.

       ```
       let http404Error = (404."Not Found")
       // http404Error is of type (Int,String), and equals (404,"Not Found")
       ```

    2. decompose a tuple's contents into separate constants or variables

       ```
       let (statusCode, statusMessage) = http404Error
       print("The status code is \(statusCode)")
       //prints "The status code is 404"
       
       let (justTheStatusCode,_) = http404Error
       
       ```

    3. name the individual elements in a tuple when the tuple is defined
    
       ```
       let http200Status = (statusCode:200, description: "OK")
       print("The status code is \(http200Status.statusCode)")
       //Prints "The status code is 200"
       ```
    
    4. Tuples are particularly useful as the return values of functions.
    
12. Control Flow

    1. 顺序执行
    2. 循环
       1. for in
       2. while
       3. while repeat
    3. 条件
       1. if
       2. switch
    4. 控制转移
       1. break
       2. continue
       3. fall through
       4. return
       5. throw
    5. Early Exit
       1. guard

13. for in 

    1. 用来更简单的遍历数组（array），字典（dictionary），区间（range），字符串（string）和其他序列类型

       ```
       for index in 1...5{
       	print("\(index)times 5 is \(index*5)")
       }
       ```

    2. 不需要区间序列内每项的值，用下划线（_)替代变量名

       ```
       let base = 3 , power = 10
       var answer = 1
       for_ in 1...power{
       	answer *= base
       }
       ```

14. Range Operator

    1.  ..< (exclusive of the upper bound) : 半闭合

    2. ... (inclusive of both bounds): 闭合

    3. CountableRange is enumeratable with for in.

       ```
       for i in 0..<20 {}
       ```

    4. Floating point numbers don't stride by Int, they stride by a floating point value . There's a global function that will create a CountableRange from floating point values!

       ```
       for i in stride(from:0.5,through:15.25,by:0.3){}
       ```

15. while 

    ```
    while condition{
    	statements
    }
    ```

16. repeat-while

    ```
    repeat{
    	statements
    }while condition
    ```

17. if 

    ```
    var temperatureInFahrenheit = 30
    if temperatureInFahrenheit <= 32{
    	//
    }
    if t <= 32{
    
    }else if t >= 86 {
    	
    }else{
    
    }
    ```

18. switch

    1. swift的switch语句比C语言中更加强大安全。

    2. 在C语言中，如果某个case不小心漏写了break，这个case就会贯穿至下一个case，swift无需写break，不会发生这种贯穿的情况。

    3. case还可以匹配很多不同的模式，包括间隔匹配（interval match），元组（tuple）和转换到特定类型。switch语句的case中匹配的值可以绑定成临时常量或变量，在case体内使用，也可以用where来描述更复杂的匹配条件

    4. switch语句必须是完备的。这就是说，每一个可能的值都必须至少有一个case分支与之对应。在某些不可能涵盖所有值的情况下，你可以使用默认（default）分支来涵盖其它所有没有对应的值，这个默认分支必须在switch语句的最后面。

    5. 区间匹配

       ```
       let approximateCount = 62
       switch approximateCount{
       	case 0:
       		naturalCount="no"
       	case 1..<5:
       		naturalCount="a few"
       	case 5..<12
       		naturalCount="several"
       	case 12..<100
       		naturalCount="dozens of"
       	case 100..<1000:
       		naturalCount="hundreads of"
       	default:
       		naturalCount = "many"
       }
       
       
       let somePoint = (1,1)
       switch somePoint{
       
       }
       ```

    6. Tuple
    
       ```
       let somePoint=(1,1)
       switch somePoint{
       	case (0,0):
       		print("(0,0)is at the origin")
       	case (_,0):
       		...
       	case (0,_):
       		...
       	case (-2...2,-2...2):
       		...
       	default:
       		...
       }
       ```
    
    7. value bingdings
    
       ```
       let anotherPoint = (2,0)
       switch anotherpoint{
       	case (let x,0):
       		...
       	case (0,let y):
       		...
       	case let(x,y):
       		...
       	default:
       		...
       }
       ```
    
    8. where
    
       ```
       let yetAnotherPoint = (1,-1)
       switch yetAnotherPoint{
       	case let(x,y) where x==y:
       		...
       	case let(x,y) where x==-y:
       		...
       	case let(x,y):
       		...
       }
       ```
    
    9. compound cases
    
       ```
       let someCharacter: Character = "e"
       switch someCharacter{
       	case "a","e","i","o","u":
       		...
       	case "b","c","d","f":
       		...
       	default:
       		...
       }
       
       
       let stillAnotherPoint = (9,0)
       switch stillAnotherPoint{
       case (let distance,0),(0,let distance):
       	print
       default:
       	...
       	}
       ```
    
19. fallthrough