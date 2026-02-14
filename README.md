# docker-mysql-nicegui

- MySQLと、PythonのWebフレームワーク `NiceGUI` を合わせたコンテナひな形

<br>

### 趣旨

- NiceGUIにDB機能がなく、DBライブラリで読み込んだデータをどんな風に使えるか確認

  - `ui.table` に普通にロードするなら、データボディは辞書の配列にする。下記のように

    ```Python
    [
      { '列名1': データ, '列名2': データ},
      { '列名1': データ, '列名2': データ},
      { '列名1': データ, '列名2': データ},
      ...
    ]
    ```

    → 公式ドキュメント https://nicegui.io/documentation/table

  - NiceGUIのディスカッションでも質問されていたが結論は曖昧 → [リンク](https://github.com/zauberzeug/nicegui/discussions/1868)

  - Pandasのデータフレーム形式を経由する方法もあり、その時は列毎の配列にする。下記のように

    ```Python
    df = pd.DataFrame(
      data={ '列名1': [ データ, データ, ... ], '列名2': [ データ, データ, ... ] }
    )
    ui.table.from_pandas(df)
    ```

     → 公式ドキュメント https://nicegui.io/documentation/table#table_from_pandas_dataframe

- NiceGUI公式のDockerコンテナ `zauberzeug/nicegui:latest` に後付けで `mysql-connector-python` を入れても使えず（2026年2月）、Pythonコンテナから再構築しDocker Composeで簡単な使い方にした

<br>

### 動作確認環境（2026年2月）

- macos Tahoe 26.3

- GNU bash, version 5.3.3(1)-release (x86_64-apple-darwin23.6.0)

- Docker version 29.0.0, build 3d4129b9ea

- Docker Compose version 2.40.3

- GNU Make 3.81

<br>

### 利用例（リポジトリトップでのコマンド）

`make dev` MySQLコンテナを起動し、ヘルスチェックが通ったらNiceGUIコンテナも起動

- http://localhost:8888 で下記のように表示される

  <img width=256 height=256 src="後で" />

- `nicegui/main.py` を編集すると `NiceGUI` がホットリロードする（開発で便利）

`make down` コンテナ終了（MySQLのボリュームを削除しDBデータを消す）

`make clean` コンテナを終了し、コンテナとイメージ全て消去

<br>

### TODO

  - 公式ドキュメントにある各種形式のテーブルを作る

    → https://nicegui.io/documentation/table

  - `Tortoise ORM` + `SQLite` の例が公式リポジトリにあり、MySQLでも試す

    → https://github.com/zauberzeug/nicegui/blob/main/examples/sqlite_database/main.py

  - Webコンテンツが増えたら適当なサイトにデプロイ

<br>

---
