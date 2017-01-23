# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create!(author: 'Лем Станислав',
                title: 'Непобедимый',
                description: %{Совершенство технического гения — крейсер «Непобедимый» — совершает посадку 
                              на планету Регис III. Год назад здесь исчез похожий звездолёт, не вышедший 
                              на связь после посадки. Экспедиция корабля стремится выяснить, что произошло. 
                              А Регис III пустынен, ничем не примечателен… и до странного тих. Жизнь на этой 
                              планете так и не выбралась на сушу из океана, и планета не спешит выдавать свои 
                              тайны. Однако люди настойчивы. И узнают истину, которая повергает их в шок.},
                image_url: 'cover-nepobed.jpg',
                price: 3.99)

Product.create!(author: 'Шекли Роберт',
                title: 'Обмен разумов',
                description: %{Главный герой, любитель путешествовать, организует себе путешествие на Марс, 
                              через обмен тел с марсианином. Но его компаньон по обмену телами оказывается 
                              авантюристом и оставляет героя вообще без тела.},
                image_url: 'cover-obmen.jpg',
                price: 1.99)

Product.create!(author: 'Фаулз Джон',
                title: 'Волхв',
                description: %{«Волхв» долго служил Фаулзу своего рода визитной карточкой. В этом романе на 
                              затерянном греческом острове загадочный «маг» ставит жестокие психологические 
                              опыты на людях, подвергая их пытке страстью и небытием. Реалистическая традиция 
                              сочетается в книге с элементами мистики и детектива. Эротические сцены романа — 
                              возможно, лучшее, что было написано о плотской любви во второй половине XX века.},
                image_url: 'cover-volhv.jpg',
                price: 9.99)
