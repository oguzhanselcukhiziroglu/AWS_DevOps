# Hands-on Linux-02 : Linux Environment Variables  #Linux Ortam Değişkenleri

Purpose of the this hands-on training is to teach the students how to use environment variables.
# Bu uygulamalı eğitimin amacı, öğrencilere ortam değişkenlerini nasıl kullanacaklarını öğretmektir.
## Learning Outcomes

At the end of the this hands-on training, students will be able to;
# Bu uygulamalı eğitimin sonunda öğrenciler;
- explain environment variables.
# ortam değişkenlerini açıklayabilirler.
- understand Quoting with Variables.
# değişkenlerle Alıntı Yapmayı anlayacaklar.
## Outline

- Part 1 - Common Environment Variables & Accessing Variable
# Ortak Ortam Değişkenleri ve Değişkene Erişme
- Part 2 - Path Variable
# Path Değişkeni
- Part 3 - Quoting with Variables
# Değişkenlerle Alıntı Yapma
- Part 4 - Sudo Command
# Sudo Komutu
## Part 1 - Common Environment/Shell Variables & Accessing Variable  # Ortak Ortam/Kabuk Değişkenleri ve Değişkene Erişme
​ 
- Difference between "env" and "printenv" commands.    # - "env" ve "printenv" komutları arasındaki fark.
​
```bash
env              # printenv ile aynı
printenv         # env ile aynı
printenv HOME    # echo $HOME ile aynı işlev - Dolar sign'a gerek yok
echo $HOME       # printenv HOME ile aynı işlev  - Tanımlı değişkenin değerini çekip aldık
env HOME         # printenv HOME gibi olmuyor. Farkı bu            ​# env | grep HOME 
```

- Understanding the shell variable. # Shell variable sadece shellde geçerli
​# Hali hazırda kullandığımız shell'e göre hazırlanmış variable'lar. Yeni bir terminal açınca gidiyor.
```bash
CLARUS=way             # YONETIM=academy     echo $YONETIM de değerini göster. Linux'ta yoktu. Shell variable
env
set                    # çok yer kaplıyor, shell variables ve shell functionsı da gösteriyor. Burda YONETIM i göster
set | grep CLARUS      # set | grep YONETIM
echo $CLARUS           # Geçici olduğunu göster. VScode ile ve bash ile    # bash komutu shell'i yeniliyor
```
​
- Understanding the environment variable. Use export command.
​# environment variable tanımlamayı göreceğiz şimdi 
```bash
export WAY=clarus      # ACADEMY=yonetim
env                    # env'de görünüyor. Göster   echo $ACADEMY   printenv ACADEMY
```
​
- Difference between shell and environment variables. Create a user, name it "user1", switch to user1, check the environment and shell variables.
​# Shell ve ortam değişkenleri arasındaki fark. Bir kullanıcı oluşturun, "user1" olarak adlandırın, user1'e geçin, environment ve shell değişkenlerini kontrol edin.
```bash
export WAY=clarus     # ACADEMY=yonetim
sudo su               # root user'a geçtik
useradd user1         # kullanıcı ekliyoruz
passwd user1          # give user1 any password.
exit                  # root userdan çık
su user1              # user1'e geç
env | grep WAY        # Bunu görebiliriz. Çünkü env variable global.   set | grep ACADEMY
set | grep CLARUS     # shell variable local görünmedi                 set | grep YONETIM
```
​
- Change the environment variable value.
​
```bash
export WAY=linux      # export ACADEMY=linux
env
export WAY=script     # export ACADEMY=script
env
```
​
- Remove the environment variable with unset command.
​
```bash
export WAY=clarusway  # export ACADEMY=yonetim
env | grep WAY        # env | grep ACADEMY
unset WAY             # unset ACADEMY
env | grep WAY        # env | grep ACADEMY       exit'le user1 den çık
```
​
## Part 2 - Path Variable
​
- PATH variable.
​
```bash
printenv PATH         # whereis pwd    usr/bin/pwd yi göster   usr/bin/ls  PATH variableda görğndüğü için kısası yetiyor
cd /bin               # bin dizinine git
ls ca*                # see the cat command.    cd ile home dizinine git
```
​
- Add a path to PATH variable for running a script.
​# Bir komut dosyasını çalıştırmak için PATH değişkenine bir yol ekleyin.
```bash
cd
mkdir test && cd test
nano test.sh  # vim kullan
# copy and paste the code-echo "hello world"- in test.sh
chmod +x test.sh
./test.sh
cd   # change directory to ec2-user's home directory
./test.sh    # it doesnt work. 
./test/test.sh
printenv PATH  # tanımlı olan PATH leri görüyoruz şu an
cd test
pwd  # sonra ls ile test.sh ın burda olduğunu göster
export PATH=$PATH:/home/ec2-user/test
printenv PATH
cd
test.sh  # eskiden ./test.sh diyorduk
cd /
test.sh  # eskiden ./test.sh diyorduk   cd ile home a dön   test klasöründeki her sh çalışır artık
```
​
- Using the environment variable in the script.
​# Komut dosyasında ortam değişkenini kullanma. Environment variable'ı script içinde nasıl kullanabiliriz. Ona bakacağız.
```bash
cd test
export CLARUS=env.var   # export YONETIM=academy.var
WAY=shell.var           # ACADEMY=shell.var
cd test
nano test1.sh           # vim test1.sh
# copy and paste the code-echo "normally we should see env. variable $CLARUS but probably we can't see the shell variable $WAY "
chmod +x test1.sh       # echo "normally we should see env. variable $YONETIM but probably we can't see the shell variable $ACADEMY "
./test1.sh              # Tanımlı olmadan önce çalıştır. Sonra 120 ve 121 inci satırdaki komutları çalıştırıp tekrar dene
```
​
## Part 3 - Quoting with Variables.  # cd ile home dizinine gidip başla bu kısma
​
- Double Quotes.
​
```bash
MYVAR=my value     # boşluk varken değişkene değer atamıyor.
echo $MYVAR        # içi boş - değer yok
MYVAR="my value"   # tırnak içinde olduğu için boşluk sorun değil değeri aldı
echo $MYVAR
MYNAME=james
MYVAR="my name is $MYNAME"
echo $MYVAR
MYNAME="james"
MYVAR="hello $MYNAME"
echo $MYVAR
MYVAR="hello \$MYNAME"  # ters slash, dolar sign'ı etkisiz hale getirdi.
echo $MYVAR
```
​
- Single Quotes.
​
```bash
echo '$SHELL'    # önce echo $SHELL'i göster, çift tırnak doları görür. Onu da göster  -->  echo "$SHELL"
echo 'My\$SHELL' # tek tırnak herşeyi string olarak görür
```
​
## Part 4 - Sudo Command.
​
- Sudo Command.
​
```bash
yum update       # root yetkisi lazım
sudo yum update  # şimdi çalışır
cd /             # roota gidelim. En tepeye anlamında. ec2-user'ız hala
mkdir testfile
sudo su          # root kullanıcısına geçtim 
sudo -s          # sudo -s
sudo su -        # 
```