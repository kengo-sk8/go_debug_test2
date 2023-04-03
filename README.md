# 概要
go言語を使用して、VScodeを使用したデバッグできる環境を作成する

# 使用技術
| 使用技術 |  説明  |
| :---: | :---: |
|  言語  |  go  |
|  フレームワーク  |  echo  |
|  ミドルウェア  |  docker、docker compose |
|  ライブラリ | [air](https://github.com/cosmtrek/air) 、[delve](https://github.com/go-delve/delve)  |

# TODO
現状、airのホットリロード不具合により、正常に動作はしない。ただ、`go build main.go`、`go run main.go` を行う事で、デバッグはできる環境となっている。

# 環境構築で必要なコマンド
`go.mod`の作成(最初に直接コマンドを叩く)
```sh
docker exec [コンテナー名] go mod init [import-path]
# or
go mod init github.com/ユーザー名/プロジェクト名
```
`air init`の作成
```sh
docker compose exec [コンテナー名] air init
```

go.modとgo.sumを更新する
```sh
docker exec [コンテナー名] go mod tidy
```

# launch.jsonの設定(goの場合)

| ラベル |  設定項目 | 説明 |
| :---: | :---: | --- |
| name | 任意 | デバッグに表示する名前 |
| type | 任意 | 言語名を設定 |
| mode | remote or local | ローカルorリモート環境(コンテナの環境を示す)のどちらかでデバッグを行う (リモートを設定した場合、Remote Development拡張機能が必要)|
| request | attach or launch  | attach:既に起動しているプロセスへデバッガーが接続する <br> launch:デバッグ開始時に、`program`で指定したパスを実行し、その起動したプロセスに対してデバッグを行う |
| port | 任意の番号を設定 | 解放するportを指定する |
| cwd | 任意のパスまたはディレクトリーを設定 | `request`が`attach`の時に有効 |
| program | 任意のパスまたはディレクトリーを設定 | `request`が`launch `の時に有 |
| args | 任意の引数を設置 | デバッグ実行時に渡される引数 |

# launch.jsonの参考資料
- [【VSCode】起動済みのプロセスにアタッチしてデバッグを行う（attachデバッグ構成）](https://daeudaeu.com/vscode-attach/)
- [【VS CODE】Visual Studio Codeのlaunch.jsonの設定方法を学ぶ【Python】](https://mychma.com/vs-code-launch-json/801/)

# 環境構築、goについての参考資料
- [go mod完全に理解した](https://zenn.dev/optimisuke/articles/105feac3f8e726830f8c)
- [Golang v1.12 から dep ではなく Go Modules を使う](http://psychedelicnekopunch.com/archives/1805)
- [【Go】パッケージ/モジュールやgo modコマンドについてまとめ](https://blog.framinal.life/entry/2021/04/11/013819#Package%E3%81%A8%E3%81%AF)
- [go mod init [module-path]のmodule-pathには具体的に何を書けばいいのか](https://qiita.com/bSRATulen2N90kL/items/f9b44394781296626184)
- [[Go言語]Go Modulesのimportで手こずった話をしたいと思います](https://selfnote.work/20220520/programming/golang-go-modules/)
- [【コマンドまとめ】go install,go get,go mod download,go mod tidy](https://zenn.dev/yuki0920/articles/36a8f2957b0028)
- [【Golang】go path / go get / go install / go mod tidyについて](https://qiita.com/lamp7800/items/9a154e8e789261f87466)

# ホットリロード、デバッグ設定の参考資料
- [dockerコンテナで起動しているGoアプリケーションをvscodeでリモートデバッグする](https://hodalog.com/remote-debug-a-containerized-go-application-using-docker-compose/)
- [DockerコンテナでgolangをホットリロードするAirを導入](https://zenn.dev/ajapa/articles/bc399c7e4c0def)
- [GoでDockerを使った開発環境を作成する](https://su-kun1899.hatenablog.com/entry/2023/01/06/090000)
- [[VScode] Docker+Go+air+delveでリモートデバッグ](https://qiita.com/masataka715/items/f87afa3e7f2c4e640ba7)
- [Visual Studio CodeでGo言語のデバッグ環境を整える](https://qiita.com/momotaro98/items/7fbcad57a9d8488fe999)
