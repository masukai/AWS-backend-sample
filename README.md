# AWS-backend-sample

> [!Note]
> AWS 内で tfstate を管理するための方法までを記しています。以降は各 terraform のコードで実行されたし。

## 実行前の確認

- AWS CLI がインストールされている。`~/.aws/credentials`が作成されており、AWS アカウントが登録されている。作成されているフォルダは大抵以下。

```
/Users/~/.aws/credentials
```

config は以下のように記述（あくまで一例）。

```
[default]
region = ap-northeast-1

[fogefoge]
region = ap-northeast-1

```

credentials は以下のように記述（あくまで一例）。

```
[default]
aws_access_key_id = AKIA~~
aws_secret_access_key = ~~

[fogefoge]
aws_access_key_id = AKIA~~
aws_secret_access_key = ~~

```

## Step for Deploy AWS

このアプリケーションを AWS にデプロイする方法です。

### setup から AWS S3 に tfstate を保存し、DynamoDB で実行管理をする

setup フォルダの`setup.command`(Mac)をダブルクリック実行することで、tfstate の管理環境を作成します。
また Mac の場合、以下のコマンドから sh ファイルを実行して管理環境を作成できます。

```bash
cd setup
./setup.sh
```

詳細は[setup README](./setup/README.md)をご覧ください。

こちらを実行後、以下のコマンドから Terraform を利用してください。

```bash
cd terraform
terraform workspace new fogefoge
terraform workspace select fogefoge
terraform workspace list
terraform workspace show
terraform init
```

### Terraform から AWS にデプロイ

Terraform から AWS にリソースを作成します。
`fogefoge` という AWS プロファイルから認証情報を読み取っています。
適宜変更してください。

```bash
cd terraform
terraform apply
```

> [!Warning]
> AWS から消す・仕舞う・片付けることがしたい場合は`terraform workspace select`コマンドで対応する AWS アカウントに移動し、以下のコマンドを利用。
> `terraform destroy`
