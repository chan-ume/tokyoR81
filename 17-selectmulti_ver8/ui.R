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
                           value = 30),
                 actionButton("trigger_histogram", "ヒストグラムを出力"),
                 
                 h3("散布図の設定"),
                 selectInput("input_data_for_scatter_plotX",
                             "x軸",
                             choices = colnames(iris), selected = colnames(iris)[1]),
                 selectInput("input_data_for_scatter_plotY",
                             "y軸",
                             choices = colnames(iris), selected = colnames(iris)[1]),
                 actionButton("trigger_scatter_plot", "散布図を出力")
               ),
               mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("Table", 
                                      DT::dataTableOutput("table_for_plot")),
                             tabPanel("ヒストグラム", plotOutput("histgram")),
                             tabPanel("散布図", plotOutput("scatter_plot", brush = brushOpts(id="plot_brush")),
                                      DT::dataTableOutput("plot_brushedPoints")),
                             tabPanel("みたいに他にも図を表示する")
                 )
               )
             )),
             
             tabPanel("回帰", sidebarLayout(
               sidebarPanel(
                 selectInput("data_for_regression", label = h3("データセットを選択してください。"),
                             choices = c("アヤメのデータ" = "iris",
                                         "ボストン近郊の不動産価格データ" = "Boston",
                                         "スパムと正常メールのデータ" = "spam",
                                         "ニューヨークの大気状態データ" = "airquality",
                                         "タイタニックの乗客データ" = "titanic"),
                             selected = "iris"),
                 h3("回帰を出力"),
                 selectInput("data_for_regressionY",
                             "目的変数を選択",
                             choices = colnames(iris), selected = colnames(iris)[1]),
                 h3("選択された説明変数はこちら"),
                 verbatimTextOutput("rows_selected"),
                 selectInput("regression_type",
                             "回帰の手法を選択",
                             choices = c("重回帰分析" = "lm",
                                         "ランダムフォレスト" = "rf",
                                         "3層ニューラルネット" = "nnet")),
                 actionButton("regression_button", "回帰")
               ),
               mainPanel(
                 tabsetPanel(type = "tabs",
                             tabPanel("Table", h3("説明変数を選択してください。"), 
                                      DT::dataTableOutput("data_table_for_regression")),
                             tabPanel("回帰結果", verbatimTextOutput("summary_regression")),
                             tabPanel("プロットで結果を確認", plotOutput("plot_regression"))
                 )
               )
             )),
             navbarMenu("その他",
                        tabPanel("About",
                                 h2("私の名前は@Np_Ur_です。")))
  )
)
)