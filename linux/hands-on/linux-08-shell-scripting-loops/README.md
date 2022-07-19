# Hands-on Linux-08 : Shell Scripting/Loops

Purpose of the this hands-on training is to teach the students how to use loops in shell.
# Bu uygulamalı eğitimin amacı, öğrencilere shell'de döngülerin nasıl kullanılacağını öğretmektir.
## Learning Outcomes

At the end of the this hands-on training, students will be able to;
# Bu uygulamalı eğitimin sonunda öğrenciler;
- explain loops in shell.
# Shell'deki döngüleri açıklayabilecektir.
- use while loops in shell scripting
# Shell komut dosyası oluşturmada while döngülerini kullanabilecektir.
- use until loops in shell scripting
# Shell komut dosyası oluşturmadaki döngüleri kadar kullanabilecektir.
- use for loops in shell scripting
# Shell komut dosyası oluşturmada for döngülerini kullanabilecektir.
- use continue and break statements in shell scripting
# Shell komut dosyası oluşturmada Continue ve break ifadelerini kullanabilecektir.
- use select loops in shell scripting
# Shell komut komut dosyası oluşturmada select döngülerini kullanabilecektir.
## Outline

- Part 1 - While loops

- Part 2 - Until loops

- Part 3 - For loops

- Part 4 - Continue and Break Statements

- Part 5 - Select loops

## Part 1 - While loops

- When writing programs in shell, in some cases it is not enough to execute our block of code only once. The loops are used to repeat (iterate) the execution of a block of code.
# Programları Shell'de yazarken, bazı durumlarda kod bloğumuzu yalnızca bir kez çalıştırmak yeterli değildir. Döngüler, bir kod bloğunun yürütülmesini tekrarlamak (yinelemek) için kullanılır.
- while loops have a boolean logic, similar to if statements. As long as the result of the condition returns True, the code block under while loop runs. When the condition returns to False, the loop execution is terminated and the program control moves further to the next operation.
# while döngüleri, if ifadelerine benzer bir boolean mantığına sahiptir. Koşulun sonucu True döndürdüğü sürece, while döngüsü altındaki kod bloğu çalışır. Koşul False'a döndüğünde, döngü yürütmesi sonlandırılır ve program kontrolü bir sonraki işleme geçer.
- Create a folder and name it `loops`.

```bash
mkdir loops && cd loops
```

- Let's display numbers from 1 to ten with `while loop`. Create a `script` file named `while-loop.sh`. 
# 1'den 10'a kadar olan sayıları `while döngüsü` ile gösterelim. 'while-loop.sh' adında bir 'script' dosyası oluşturun.
```bash
#!/bin/bash

number=1

while [[ $number -le 10  ]]   # -le : less than or equal
do
  echo $number
  ((number++))
done
echo "Now, number is $number"
```

- Make the script executable and execute it.

```bash
chmod +x while-loop.sh
./while-loop.sh
```

## Part 2 - Until loops  # OLANA KADAR

- The until loop is identical to the while loop, except that it will execute the commands within it until the test becomes true.
# Until döngüsü, test doğru olana kadar içindeki komutları yürütmesi dışında, while döngüsüyle aynıdır.
- Create a `script` file named `until-loop.sh`. 

```bash
#!/bin/bash

number=1

until [[ $number -ge 10  ]]   # -ge : greater than or equal
do
  echo $number
  ((number++))
done
echo "Now, number is $number"
```

- Note that, this time we write `-ge` instead of `-le`. So in first sitiuation, condition is false. It will execute the code until the condition is true. 
# Dikkat edin, bu sefer '-le' yerine '-ge' yazıyoruz. Yani ilk durumda, koşul yanlıştır. Koşul doğru olana kadar kodu yürütür.
- Make the script executable and execute it.

```bash
chmod +x until-loop.sh
./until-loop.sh
```

## Part 3 - For loops

- Sometimes we want to iterate a block of code for each of the items in a given list. For this we use `for loop`. 
# Bazen belirli bir listedeki öğelerin her biri için bir kod bloğunu yinelemek isteriz. Bunun için "for döngüsü" kullanıyoruz.
- Here is a simple example. Create a `script` file named `for-loop.sh`. 

```bash
#!/bin/bash

echo "Numbers:"

for number in 0 1 2 3 4 5 6 7 8 9
do
   echo $number
done

echo "Names:"

for name in Joe David Matt John Timothy
do
   echo $name
done

echo "Files in current folder:"

for file in `pwd`/*
do
   echo $file
done
```

- Make the script executable and execute it.

```bash
chmod +x for-loop.sh
./for-loop.sh
```

### Using arrays with the for loop    ### Dizileri for döngüsüyle kullanma

- Create a `script` file named `for-array.sh`. 

```bash
#!/bin/bash

devops_tools=("docker" "kubernetes" "ansible" "terraform" "jenkins")

for tool in ${devops_tools[@]}
do
   echo $tool
done
```

- Make the script executable and execute it.

```bash
chmod +x for-array.sh
./for-array.sh
```

## Part 4 - Continue and Break Statements
 
 - A loop will continue forever unless the necessary condition is not met. A loop that runs endlessly without terminating can run for an infinite number of times. For this reason, these loops are named infinite loops.
# Gerekli koşul sağlanmadıkça bir döngü sonsuza kadar devam eder. Sonlandırmadan sonsuzca çalışan bir döngü sonsuz sayıda çalışabilir. Bu nedenle bu döngülere sonsuz döngüler adı verilir.
- Create a `script` file named `infinite-loop.sh`. 

```bash
#!/bin/bash

number=1

until [[ $number -lt 1  ]]     # less than
do
  echo $number
  ((number++))
done
echo "Now, number is $number"
```

- Make the script executable and execute it.

```bash
chmod +x infinite-loop.sh
./infinite-loop.sh
```

- Push the `ctrl + C` and terminate the process.

### Break Statement

- As we see above the infinite loop run forever. The break statement is used to terminate the execution of the entire loop.
# Yukarıda gördüğümüz gibi sonsuz döngü sonsuza kadar çalışır. Break ifadesi, tüm döngünün yürütülmesini sonlandırmak için kullanılır.
- Let's modify the `infinite-loop.sh`.

```bash
#!/bin/bash

number=1

until [[ $number -lt 1  ]]
do
  echo $number
  ((number++))
  if [[ $number -eq 100 ]]
  then
    break
  fi
done
```

- Execute the script.

```bash
./infinite-loop.sh
```

### Continue Statement

- The Continue statement is similar to the Break command, except it causes the current iteration of the loop to exit, instead of the whole loop.
# Continue deyimi Break komutuna benzer, ancak tüm döngü yerine döngünün geçerli yinelemesinin çıkmasına neden olur.
- Let's modify the `infinite-loop.sh`. This time we do not display 10 and its multiples (10, 20 ..)
# `infinite-loop.sh` dosyasını değiştirelim. Bu sefer 10 ve katlarını (10, 20 ..) göstermiyoruz.
```bash
#!/bin/bash

number=1

until [[ $number -lt 1  ]]   # less than
do
  ((number++))
  
  tens=$(($number % 10))
  
  if [[ $tens -eq 0 ]]
  then
    continue
  fi

  echo $number
    
  if [[ $number -gt 100 ]]   # greater than
  then
    break
  fi
done
```

- Execute the script.

```bash
./infinite-loop.sh
```

## Part 5 - Select loops

- The Select Loop generates a numbered menu from which users can select options. It's helpful when you need to ask the user to select one or more items from a list of options.
# Select Döngüsü, kullanıcıların seçenekleri seçebileceği numaralandırılmış bir menü oluşturur. Kullanıcıdan bir seçenekler listesinden bir veya daha fazla öğe seçmesini istemeniz gerektiğinde yararlıdır.
- Create a `script` file named `select-loop.sh`. 

```bash
#!/bin/bash

read -p "Input first number: " first_number
read -p "Input second number: " second_number

PS3="Select the operation: "

select operation in addition subtraction multiplication division exit
do
  case $operation in
    addition) 
      echo "result= $(( $first_number + $second_number))"
    ;;
    subtraction)
       echo "result= $(( $first_number - $second_number))"
    ;;
    multiplication)
       echo "result= $(( $first_number * $second_number))" 
       ;;
    division)
       echo "result= $(( $first_number / $second_number))"
    ;;
    exit)
       break
    ;;   
    *)
       echo "Wrong choice..." 
    ;;
  esac
done
```

- Note that we can change the `system variable PS3` to modify the prompt that is displayed.
# Görüntülenen istemi değiştirmek için 'sistem değişkeni PS3'ü değiştirebileceğimizi unutmayın.
- Make the script executable and execute it.

```bash
chmod +x select-loop.sh
./select-loop.sh
```