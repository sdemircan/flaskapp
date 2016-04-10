# flaskapp

flaskapp, Vagrant ile yönetilen bir sanal sunucu içerisinde Flask uygulamaları geliştirmek için kullanılabilecek bir uygulamadır. 

## Gereksinimler

- Virtualbox [1]
- Vagrant [2]

## Kullanım

flaskapp deposunu klonlayın ve ardından vagrant ile sanal sunucunuzu başlatın. 

```sh
git clone https://github.com/sdemircan/flaskapp
cd flaskapp
vagrant up
```

Vagrant Saltstack ile Flask uygulamasının çalışması için gerekli olan bağımlıkları bir virtualenv içine kuracak ve uygulamayı Gunicorn ile sunacaktır. Web tarayıcınızdan http://127.0.0.1:8000 adresine giderek uygulamaya erişebilirsiniz.

## Salt Statelerinde Değişiklik Yapılması

Salt statelerinde değişiklik yaptıktan sonra aşağıdaki komut ile yapılan değişikliklerin sanal sunucunuz üzerinde geçerli olmasını sağlayabilirsiniz:

```sh
vagrant provision
```

## İhtiyaç Duyulan Python Modüllerinin Eklenmesi

Eğer virtualenv içerine yeni Python modülleri eklemek isterseniz **saltstack/roots/salt/flaskapp/conf/requirements.txt** dosyası içerine ihtiyaç duyduğunuz modülüm ismi ve sürüm numarasını yazabilirsiniz. Ardından modülleri yüklemek için aşağıdaik komutun çalıştırılması gerekmektedir:

```sh
vagrant provision
```

\[1\] - https://www.virtualbox.org/wiki/Downloads

\[2\] - https://www.vagrantup.com/docs/installation
