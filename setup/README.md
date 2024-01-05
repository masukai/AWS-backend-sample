# setup.sh が行なっていること

1. AWS CLI で tfstate を保存する S3 を作成
2. 競合が起きないように DynamoDB で管理

## AWS にまだ作成されていない場合

ターミナルもしくはコマンドプロンプトが起動し、作成が実行、レスポンスが返ってきます。

## AWS で既に作成されている場合

ターミナルもしくはコマンドプロンプトが起動し、「既にある」というエラーが返ってきます。
その他のエラーの場合はご留意ください。

# 細かな設定

> [!Warning]
> setup のために[setup.command](./setup.command)・[setup.sh](./setup.sh) を実行できない。

- ファイルの権限について、ターミナルで setup.command・setup.sh 配下に移動し、以下のコマンドで変更します。

```bash
chmod 744 setup.command
```

```bash
chmod 744 setup.sh
```

- 実行はできても「fogefoge」がないとエラーが出る。

> [!Note]
> AWS CLI v2 のインストールおよび開発環境の AWS コンソールで CLI の利用ができる IAM ロールの発行が必要です。

上記準備後、以下のコマンドで適切な設定をしていきます。

```bash
aws configure --profile fogefoge
```
