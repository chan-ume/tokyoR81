library(shiny)
library(shinythemes)

shinyUI(
  tagList(shinythemes::themeSelector(),
  navbarPage("Shinyサンプルアプリケーション",
             tabPanel("Home",
                      h1("TokyoR81で作成中"),
                      h2("アプリケーション概要"),
                      p("オープンソースデータを用いて可視化と分析を行えるShinyアプリです。"),
                      helpText("サンプルなので、うまく動かない可能性もあるのでご注意ください。")),
             tabPanel("可視化", sidebarLayout(
               sidebarPanel(
                 selectInput("selected_data_for_plot", label = h3("データセットを選択してください。"),
                             choices = c("アヤメのデータ" = "iris",
                                         "ボストン近郊の不動産価格データ" = "Boston",
                                         "スパムと正常メールのデータ" = "spam",
                                         "ニューヨークの大気状態データ" = "airquality",
                                         "タイタニックの乗客データ" = "titanic"),
                             selected = "iris"),
                 h3("ヒストグラムの設定"),
                 selectInput("select_input_data_for_hist",
                           "ヒストグラムを表示する列番号",
                           choices = colnames(iris)),
                 sliderInput("slider_input_data",
                           "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30)
               ),
               mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("Table", 
                                      DT::dataTableOutput("table_for_plot")),
                             tabPanel("ヒストグラム", plotOutput("histgram")),
                             tabPanel("散布図"),
                             tabPanel("みたいに他にも図を表示する")
                 )
               )
             )),
             
             tabPanel("回帰", sidebarLayout(
               sidebarPanel(),
               mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("回帰結果"),
                             tabPanel("プロットで結果を確認")
                 )
               )
             )),
             navbarMenu("その他",
                        tabPanel("About",
                                 h2("私の名前は@Np_Ur_です。")))
  )
)
)