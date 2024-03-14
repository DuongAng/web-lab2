<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="entries" class="duongang.weblab2.beans.EntriesBean" scope="session" />

<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа №2</title>
</head>

<body>

<header class="main-header topper clearfix">
    <span class="main-header__info">
      Лабораторная работа #2<br>
      #17119
    </span>
    <span class="main-header__authors">
      Duong Ang (P3207)
    </span>
</header>

<main class="main-container">
    <h1 class="visually-hidden">Лабораторная работа #2</h1>

    <div class="main-container__item main-container__item_left-column">
        <section class="main-container__item_left-column__item content-section content-section_graph">
            <h2 class="content-section__header content-section__header_graph topper">
              <span class="content-section__header__text">
                График
              </span>
            </h2>
            <div class="content-container result-graph_container">
                <object class="result-graph" type="image/svg+xml" data="img/result-graph.svg">
                    <img src="img/result-graph.png" width="220" height="220" alt="График">
                </object>
                <canvas class="graph-canvas" width="220" height="220">Интерактивная область графика</canvas>
            </div>
        </section>

        <section class="main-container__item_left-column__item content-section content-section_values">
            <h2 class="content-section__header content-section__header_values topper">
              <span class="content-section__header__text">
                Данные
              </span>
            </h2>
            <form class="input-form" action="/web-lab2" method="POST">
                <p class="input-form__info">Enter point coordinates</p>

                <div class="input-form__container input-form__container_select">
                    <label class="input-form__label input-form__label_x" id="x-select">X</label>
                    <label>
                        <input type="radio" name="xval" value="-4"> -4
                    </label>
                    <label>
                        <input type="radio" name="xval" value="-3"> -3
                    </label>
                    <label>
                        <input type="radio" name="xval" value="-2"> -2
                    </label>
                    <label>
                        <input type="radio" name="xval" value="-1"> -1
                    </label>
                    <label>
                        <input type="radio" name="xval" value="0" checked> 0
                    </label>
                    <label>
                        <input type="radio" name="xval" value="1"> 1
                    </label>
                    <label>
                        <input type="radio" name="xval" value="2"> 2
                    </label>
                    <label>
                        <input type="radio" name="xval" value="3"> 3
                    </label>
                    <label>
                        <input type="radio" name="xval" value="4"> 4
                    </label>

                </div>

                <div class="input-form__container input-form__container_text">
                    <label class="input-form__label input-form__label_y" for="y-text">Y</label>
                    <input class="input-form__control input-form__text input-form__text_y" id="y-text" type="text" name="yval"
                           maxlength="10" autocomplete="off" placeholder="Number from -5 to 5...">
                </div>

                <div class="input-form__container input-form__container_buttons">
                    <label class="input-form__label input-form__label_r">R</label>
                    <ul class="input-form__control input-form__button-list_r">
                        <li class="input-form__button-list_r__item">
                            <button class="input-form__button input-form__button_r" id="r-button1" type="button" name="rval1" value="1">1</button>
                        </li>
                        <li class="input-form__button-list_r__item">
                            <button class="input-form__button input-form__button_r" id="r-button2" type="button" name="rval2" value="1.5">1.5</button>
                        </li>
                        <li class="input-form__button-list_r__item">
                            <button class="input-form__button input-form__button_r" id="r-button3" type="button" name="rval3" value="2">2</button>
                        </li>
                        <li class="input-form__button-list_r__item">
                            <button class="input-form__button input-form__button_r" id="r-button4" type="button" name="rval4" value="2.5">2.5</button>
                        </li>
                        <li class="input-form__button-list_r__item">
                            <button class="input-form__button input-form__button_r" id="r-button5" type="button" name="rval5" value="3">3</button>
                        </li>
                    </ul>
                </div>

                <input class="input-form__hidden_r" type="hidden" name="rval" value="">
                <input class="input-form__hidden_timezone" type="hidden" name="timezone" value="">
                <input class="input-form__hidden_clear" type="hidden" name="clear" value="">

                <div class="input-form__control-buttons__container">
                    <button class="input-form__control-buttons__button input-form__control-buttons__button_submit"
                            type="submit">Submit</button>
                    <button class="input-form__control-buttons__button input-form__control-buttons__button_reset"
                            type="submit">CLear</button>
                </div>

            </form>
        </section>
    </div>

    <section class="main-container__item main-container__item_table content-section content-section_table">
        <h2 class="content-section__header content-section__header_table topper">
            <span class="content-section__header__text">
              Таблица
            </span>
        </h2>
        <div class="result-table_container">
            <table class="result-table">
                <tr class="result-table__header">
                    <th class="result-table__coords-column">X</th>
                    <th class="result-table__coords-column">Y</th>
                    <th class="result-table__coords-column">R</th>
                    <th class="result-table__time-column">Время запроса</th>
                    <th class="result-table__time-column">Время выполнения (нс)</th>
                    <th class="result-table__hitres-column">Результат работы</th>
                </tr>
                <c:forEach var="entry" items="${entries.entries}">
                    <tr>
                        <td>${entry.xValue}</td>
                        <td>${entry.yValue}</td>
                        <td>${entry.rValue}</td>
                        <td>${entry.currentTime}</td>
                        <td>${entry.executionTime}</td>
                        <td>${entry.hitResult}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </section>

</main>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>
