library(shiny)

shinyUI(
  navbarPage("Shinyサンプルアプリケーション",
             tabPanel("Home",
                      h1("TokyoR81で作成中"),
                      h2("アプリケーション概要"),
                      p("オープンソースデータを用いて可視化と分析を行えるShinyアプリです。"),
                      helpText("サンプルなので、うまく動かない可能性もあるのでご注意ください。")),
             tabPanel("可視化"),
             tabPanel("回帰"),
             navbarMenu("その他",
                        tabPanel("About",
                                 h2("私の名前は@Np_Ur_です。")))
  )
)