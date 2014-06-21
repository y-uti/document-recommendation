document-recommendation
=======================

社内勉強会「プログラマのための文書推薦入門」での説明を補足するスクリプト群です。

勉強会で使ったスライドは下記にあります。
+ http://www.slideshare.net/y-uti/document-recommendation

実行方法
--------

スクリプト一式を展開して data ディレクトリを作成します。

    $ unzip document-recommendation-master.zip
    $ cd document-recommendation-master
    $ mkdir data

data ディレクトリ内に Wikipedia のデータを取得します (スライド 30 ページ)。

    $ cd data
    $ wget http://dumps.wikimedia.org/jawiki/latest/jawiki-latest-abstract.xml

これ以降はスライドの説明にしたがいます。
スライドの内容は data/ をカレントディレクトリとして説明しています。
