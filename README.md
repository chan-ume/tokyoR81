# tokyoR81

* 資料(shinyapp.io で公開しているので同時アクセスきついかも)
  * https://randpy-testserver.shinyapps.io/Slide/
  * https://randpy-testserver.shinyapps.io/Slide2
  * https://randpy-testserver.shinyapps.io/Slide3
  * https://randpy-testserver.shinyapps.io/Slide4

サンプルアプリ
* https://randpy-testserver.shinyapps.io/latest_version/


## サンプルアプリの実行方法1

Rコンソールで以下みたいに実行
```R
runGitHub("tokyoR81", "chan-ume", subdir= "1-navbar/")
```

## サンプルアプリの実行方法2
Git Clonしてきて、Rコンソールで以下みたいに実行

```R
> runApp('~/shiny/1-navbar/', display.mode = "showcase")
```

