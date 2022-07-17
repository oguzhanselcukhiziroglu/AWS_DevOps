# Hands-on Linux-06 : Shell Scripting Basics

Purpose of the this hands-on training is to teach the students how to script in shell.

## Learning Outcomes

At the end of the this hands-on training, students will be able to;

- explain shell scripting basics.

- explain shell variables.

- do simple arithmetic.

## Outline

- Part 1 - Shell Scripting Basics

- Part 2 - Shell Variables

- Part 3 - Simple Arithmetic

## Part 1 - Shell Scripting Basics

- Create a folder and name it shell-scripting.

```bash
mkdir shell-scripting && cd shell-scripting
```

- Create a `script` file named `basic.sh`. Note all the scripts would have the .sh extension.

```bash
#!/bin/bash
echo "Hello World"
```

- Before we add anything else to our script, we need to alert the system that a shell script is being started.
This is done specifying `#!/bin/bash` on the first line, meaning that the script should always be run with bash, rather than another shell. `#!` is called a `shebang` because the `#` symbol is called a hash, and the `!` symbol is called a bang. Komut dosyamıza başka bir şey eklemeden önce, sistemi bir shell komut dosyasının başlatıldığı konusunda uyarmamız gerekiyor. Bu, ilk satırda `#!/bin/bash` belirtilerek yapılır, yani betiğin başka bir shell yerine her zaman bash ile çalıştırılması gerekir. `#!`, `shebang` olarak adlandırılır, çünkü `#` sembolüne hash, `!` sembolüne ise (bang) patlama denir.

- After to save the above content, we need to make the script executable.          - Yukarıdaki içeriği kaydettikten sonra betiği çalıştırılabilir hale getirmemiz gerekiyor.

```bash
chmod +x basic.sh
```

- Then we can execute the `basic.sh`. To execute basic.sh, it is required to add `./` beginning of the `basic.sh`. `./` means we're calling something in the current working directory. We have to specify the path for executables if they're outside our $PATH variable. Ardından `basic.sh` dosyasını çalıştırabiliriz. basic.sh'yi yürütmek için, `basic.sh` dosyasının başına `./` eklenmesi gerekir. `./` geçerli çalışma dizininde bir şey çağırdığımız anlamına gelir. $PATH değişkenimizin dışındalarsa, yürütülebilir dosyaların yolunu belirtmeliyiz.

```bash
./basic.sh
```

- We can add the other shell commands to our script.          - Diğer shell komutlarını betiğimize (scriptimize) ekleyebiliriz.

```bash
#!/bin/bash
echo "hello"
date
pwd
ls
```

- And execute again.

```bash
./basic.sh
```

### Shell Comments

- Bash ignores everything written on the line after the hash mark `(#)`. The only exception to this rule is the first line of the script that starts with the `#!` characters. Bash, `(#)` hash işaretinden sonraki satırda yazılan her şeyi yok sayar. Bu kuralın tek istisnası, komut dosyasının `#!` karakterleriyle başlayan ilk satırıdır.

- Comments can be added at the beginning on the line or inline with other code. Let's update `basic.sh`. Yorumlar satırın başına veya diğer kodlarla satır içi olarak eklenebilir. `basic.sh` dosyasını güncelleyelim.

```bash
#!/bin/bash
echo "hello"
# date
pwd # This is an inline comment
# ls
```

- Unlike most of the programming languages, Bash doesn’t support multiline comments. But, we can use `here document` for this. In Linux, here document (also commonly referred to as `heredoc`) refers to a special block of code that contains multi-line strings that will be redirected to a command. If the `HereDoc block` is not redirected to a command, it can serve as a multiline comments placeholder. Çoğu programlama dilinin aksine Bash, çok satırlı yorumları desteklemez. Ancak bunun için `here document`ı kullanabiliriz. Linux'ta, here document (genellikle `heredoc` olarak da anılır), bir komuta yönlendirilecek çok satırlı dizeleri içeren özel bir kod bloğuna atıfta bulunur. HereDoc bloğu bir komuta yönlendirilmezse, çok satırlı bir yorum yer tutucusu olarak hizmet edebilir.

### HEREDOC syntax

- A heredoc consists of the **<<** `(redirection operator)`, followed by a delimiter token. After the delimiter token, lines of string can be defined to form the content. Finally, the delimiter token is placed at the end to serve as the termination. The delimiter token can be any value as long as it is unique enough that it won’t appear within the content. Heredoc **<<** `(yeniden yönlendirme operatörü)` ve ardından bir sınırlayıcı belirtecinden oluşur. Sınırlayıcı belirtecinden sonra, içeriği oluşturmak için dize satırları tanımlanabilir. Son olarak, sınırlayıcı belirteci, sonlandırma olarak hizmet etmek üzere sona yerleştirilir. Sınırlayıcı belirteci, içerikte görünmeyecek kadar benzersiz olduğu sürece herhangi bir değer olabilir.

- Let's see how to use HereDoc.

```bash
cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF
```

- Update the `basic.sh`.

```bash
#!/bin/bash
echo "hello"
# date
pwd # This is an inline comment
# ls

cat << EOF
Welcome to the Linux Lessons.
This lesson is about the shell scripting
EOF

<< multiline-comment     cat demezsen içerik görünmüyor farkı anlat
pwd
ls
Everything inside the
HereDoc body is
a multiline comment
multiline-comment
```

- Execute the basic.sh.

```bash
./basic.sh
```

## Part 2 - Shell Variables

- A variable is pointer to the actual data. The shell enables us to create, assign, and delete variables.
# Değişken, gerçek verilere işaretçidir. Shell, değişkenler oluşturmamızı, atamamızı ve silmemizi sağlar.
- The name of a variable can contain only letters (a to z or A to Z), numbers ( 0 to 9) or the underscore character (_) and beginning with a letter or underscore character.
# Bir değişkenin adı sadece harflerden (a'dan z'ye veya A'dan Z'ye), rakamlardan (0'dan 9) veya alt çizgi karakterinden (_) ve başlangıç bir harf veya alt çizgi karakterinden oluşabilir.
- The following examples are valid variable names.
# Aşağıdaki örnekler geçerli değişken adlarıdır.

```bash
KEY=value
_VAR=5
clarus_way=test     yonetim_academy=test
```

> Note that there is no space on either side of the equals ( = ) sign. 
# Eşittir ( = ) işaretinin her iki tarafında da boşluk olmadığına dikkat edin.
- The following examples are invalid.
# Aşağıdaki örnekler geçersizdir.
```bash
3_KEY=value        # Geçersizleri dene. Uyarıyı göster
-VAR=5
clarus-way=test
KEY_1?=value1
```

- The reason we cannot use other characters such as `?`, `*`, or `-` is that these characters have a special meaning for the shell.
# `?`, `*` veya `-` gibi diğer karakterleri kullanamamamızın nedeni, bu karakterlerin shell için özel bir anlamı olmasıdır.
- Create a new file and name it `variable.sh`.
# Yeni bir dosya oluşturun ve onu "variable.sh" olarak adlandırın.
```bash
#!/bin/bash
NAME=Joe
echo $NAME     # Neden dolar işareti kulanıyoruz konusunu anlat
```

- Make the script executable and then execute it.

```bash
chmod +x variable.sh && ./variable.sh
```

### Command Substitution

- Command substitution empowers us to take the output of a command or program (which would usually be written on the screen) and save it as the value of a variable. To do this we put it inside brackets, followed by a $ symbol.
# - Komut değiştirme, bir komutun veya programın (genellikle ekranda yazılacak olan) çıktısını almamızı ve onu bir değişkenin değeri olarak kaydetmemizi sağlar. Bunu yapmak için onu parantez içine koyarız ve ardından bir $ sembolü gelir.
```bash
content=$(ls)
echo $content      # ls in yerine echo $content'i kullanabiliyoruz artık
```

- or we can use `(backtick)
# backtick ALTGR + (noktalı virgül)
```bash
content=`ls`  
echo $content
```

- let's see that in a script. Create a file and name it `command-substitution.sh`.
# Bunu bir senaryoda görelim. Bir dosya oluşturun ve onu "command-substitution.sh" olarak adlandırın.
```bash
#!/bin/bash
working_directory=$(pwd)
echo "Welcome, your working directory is $working_directory."
```

- Make the script executable and execute it. 

```bash
chmod +x command-substitution.sh
./command-substitution.sh
```

- We can also get same result without using variables. Update the `command-substitution.sh` file as below.
# Değişken kullanmadan da aynı sonucu alabiliriz. `command-substitution.sh` dosyasını aşağıdaki gibi güncelleyin.
```bash
#!/bin/bash
echo "Welcome, your working directory is $(pwd)."
echo "Today is `date`"
echo "You are `whoami`"
```

- And execute it. 

```bash
./command-substitution.sh
```

### Console input

- The Bash `read` command is a powerful built-in utility used take user input. 
# Bash `read` komutu, kullanıcı girdisi almak için kullanılan güçlü bir yerleşik yardımcı programdır.
- Update the `variable.sh` file.

```bash
#!/bin/bash
echo "Enter your name: "
read NAME
echo "Welcome $NAME"
```

- When writing interactive bash scripts, we can use the read command to get the user input. To specify a prompt string, use the -p option. The prompt is printed before the read is executed and doesn’t include a newline.
# Etkileşimli bash scriptleri yazarken, kullanıcı girdisini almak için read komutunu kullanabiliriz. Bir bilgi istemi dizesi belirtmek için -p seçeneğini kullanın. Bilgi istemi, okuma yürütülmeden önce yazdırılır ve yeni bir satır içermez.
```bash
read -p "Enter your name: " NAME    # Üsttekinden farkı aynı satırda bilgiyi bizden alması. Daha kısa
echo "Welcome $NAME"
```

- When entering sensitive information we do not want to display input coming. For this we can use `read -s`
# Hassas bilgileri girerken, gelen girişi görüntülemek istemiyoruz. Bunun için `read -s` kullanabiliriz.
```bash
read -p "Enter your name: " NAME
echo "Welcome $NAME"

read -s -p "Enter your password: " PASSWORD
echo -e "\nYour password is $PASSWORD"       # Ne yaptığımızı görelim diye bu satırı yazdırdık
```

### Command Line Arguments                ###Komut Satırı Bağımsız Değişkenleri

- Command-line arguments are given after the name of the program in command-line shell of Operating Systems. The command-line arguments $1, $2, $3, ...$9 are positional parameters, with $0 pointing to the actual command, program, shell script, or function and $1, $2, $3, ...$9 as the arguments to the command.
# Komut satırı bağımsız değişkenleri, İşletim Sistemlerinin komut satırı shell'inde programın adından sonra verilir. $1, $2, $3, ...$9 komut satırı argümanları konumsal parametrelerdir; $0 gerçek komutu, programı, shell scriptini veya işlevi gösterir ve $1, $2, $3, ...$9 emretmek.
- Create a new file and name it `argument.sh`.

```bash
#!/bin/bash
echo "File Name is $0"
echo "First Parameter is $1"
echo "Second Parameter is $2"
echo "Third Parameter is $3"
echo "All the Parameters are $@"
echo "Total Number of Parameters : $#"
echo "$RANDOM is a random number"
echo "The current line number is $LINENO"    # Komutu girdiğin satırdan itibaren say
```

- Make the script executable. 

```bash
chmod +x argument.sh
```

- Execute it with following command.

```bash
./argument.sh Joe Matt Timothy James Guile
```

### Arrays      # Diziler

- In our programs, we usually need to group several values to render as a single value. In shell, arrays can hold multiple values at the same time.
# Programlarımızda, genellikle tek bir değer olarak işlemek için birkaç değeri gruplandırmamız gerekir. Shell'de diziler aynı anda birden çok değeri tutabilir.
#### Defining arrays

- Following is the simplest method of creating an array variable. 
# Bir dizi (array) değişkeni yaratmanın en basit yöntemi aşağıdadır.
```bash
DISTROS[0]="ubuntu"
DISTROS[1]="fedora"
DISTROS[2]="debian"
DISTROS[3]="centos"
DISTROS[4]="alpine"
```

- We can also use following method.

```bash
devops_tools=("docker" "kubernetes" "ansible" "terraform" "jenkins")
```

#### Working with arrays

- We can access a value in an array by using the following method.
# Aşağıdaki yöntemi kullanarak bir dizideki bir değere erişebiliriz.
```bash
echo ${DISTROS[0]}
echo ${DISTROS[1]}
```

- We can access all elements by putting `@` instead of number.

```bash
echo ${DISTROS[@]}
```

- With the following method, we can learn number of elements.

```bash
echo ${#DISTROS[@]}   # tek fark hash işareti
```

## Part 3 - Simple Arithmetic

- There are many ways to evaluate arithmetic expression in Bash scripting
# Bash komut dosyasında aritmetik ifadeyi değerlendirmenin birçok yolu vardır.
### expr

- `expr` command print the value of expression to standard output. Let's see this.
# `expr` komutu, ifadenin değerini standart çıktıya yazdırır. Bunu görelim.
```bash
expr 3 + 5   # expr olmadan da göster
expr 6 - 2
expr 7 \* 3
expr 9 / 3
expr 7 % 2   # mod alıyor
```

- Using `expr` command, we must have spaces between the items of the expression and must not put quotes around the expression. If we do that, the expression will not be evaluated but printed instead. See the difference.
# - `expr` komutunu kullanarak ifadenin öğeleri arasında boşluk bırakmalı ve ifadenin etrafına tırnak işareti koymamalıyız. Bunu yaparsak, ifade değerlendirilmeyecek, bunun yerine yazdırılacaktır. Farkı gör.
```bash
expr "3 + 5"   # Bu durumda echo komutu gibi işlev görüyor
expr 3-2
```

- Let's create a simple calculator. Create a file and name it `calculator.sh`.     # touch calculator.sh
# Basit bir hesap makinesi oluşturalım. Bir dosya oluşturun ve onu `calculator.sh` olarak adlandırın.
- Make the script executable. 

```bash
chmod +x calculator.sh
```

```bash
#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

echo "SUM="`expr $first_number + $second_number`
echo "SUB="`expr $first_number - $second_number`
echo "MUL="`expr $first_number \* $second_number`
echo "DIV="`expr $first_number / $second_number`
```
# ./calculator.sh
> How can we do with Command Line Arguments?
 # Komut Satırı Argümanları ile nasıl yapabiliriz?
### let

- `let` is a builtin function of Bash that helps us to do simple arithmetic. It is similar to `expr` except instead of printing the answer it saves the result to a variable. Unlike expr we need to enclose the expression in quotes. 
# - `let`, basit aritmetik yapmamıza yardımcı olan Bash'in yerleşik bir işlevidir. Cevabı yazdırmak yerine sonucu bir değişkene kaydetmesi dışında 'expr' ile benzerdir. expr'den farklı olarak, ifadeyi tırnak içine almamız gerekir.
```bash
let "sum = 3 + 5"
echo $sum
```

- Note that if we don't put quotes around the expression then it must be written with no spaces.
# İfadenin (expression'ın) etrafına tırnak işareti koymazsak boşluksuz yazılması gerektiğini unutmayın.
```bash
let sub=8-4
echo $sub
```

- We can also increase or decrease the variable by 1 with `let` function. Let's see this.
# - Ayrıca `let` fonksiyonu ile değişkeni 1 arttırıp azaltabiliriz. Bunu görelim.
```bash
x=5
let x++
echo $x

y=3
let y--
echo $y
```

- Create a file and name it `let-calculator.sh`.

```bash
#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

let "sum = $first_number + $second_number"
let "sub = $first_number - $second_number"
let "mul = $first_number * $second_number"
let "div = $first_number / $second_number"
echo "SUM=$sum"
echo "SUB=$sub"
echo "MUL=$mul"
echo "DIV=$div"

let first_number++
let second_number--
echo "The increment of first number is $first_number"
echo "The decrement of second number is $second_number"
```

- Make the script executable and execute it. 

```bash
chmod +x let-calculator.sh
./let-calculator.sh
```

#### Difference between `num++` and `++num`, or `num--` and `--num`

- Create a file and name it number.sh.

```bash
number=10
let new_number=number++   # This firstly assigns the number then increases.
echo "Number = $number"
echo "New number = $new_number"

number=10
let new_number=--number   # This firstly decreases the number then assigns.
echo "Number = $number"
echo "New number = $new_number"
```

- Make the script executable and execute it. 

```bash
chmod +x number.sh
./number.sh
```

### Double Parentheses

- We can also evaluate arithmetic expression with double parentheses. We have learned that we could take the output of a command and save it as the value of a variable. We can use this method to do basic arithmetic.
# Aritmetik ifadeyi çift parantez içinde de değerlendirebiliriz. Bir komutun çıktısını alıp bir değişkenin değeri olarak kaydedebileceğimizi öğrendik. Bu yöntemi temel aritmetik yapmak için kullanabiliriz.
```bash
sum=$((3 + 5))
echo $sum
```

- As we can see below, it works just the same if we take spacing out.
# Aşağıda görebileceğimiz gibi, boşluk bırakırsak aynı şekilde çalışır.
```bash
sum=$((3+5))
echo $sum
```

- Create a file and name it `parantheses-calculator.sh`.

```bash
#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

sum=$(($first_number + $second_number)) 
sub=$(($first_number - $second_number)) 
mul=$(($first_number * $second_number)) 
div=$(($first_number / $second_number)) 


echo "SUM=$sum"
echo "SUB=$sub"
echo "MUL=$mul"
echo "DIV=$div"

(( first_number++ ))
(( second_number-- ))

echo "The increment of first number is $first_number"
echo "The decrement of second number is $second_number"
```

- Make the script executable and execute it. 

```bash
chmod +x parantheses-calculator.sh
./parantheses-calculator.sh
```