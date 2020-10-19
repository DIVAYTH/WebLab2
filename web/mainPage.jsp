<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>WebLab1</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3" valign="top">
            <header class="header">
                <span>Вариант 2731</span>
                <span class="trapper">Попов Даниил Павлович, P3231</span>
            </header>
        </td>
    </tr>
    <tr>
        <td valign="top" width="25%">
            <svg class="graph" width="400" height="400" xmlns="http://www.w3.org/2000/svg">
                <line x1="0" x2="400" y1="200" y2="200" stroke="black"></line>
                <text x="385" y="185">X</text>
                <polygon points="400,200 385,206 385,194" stroke="black"></polygon>
                <line x1="270" x2="270" y1="207" y2="193" stroke="black"></line>
                <text x="260" y="185">R/2</text>
                <line x1="340" x2="340" y1="207" y2="193" stroke="black"></line>
                <text x="335" y="185">R</text>
                <line x1="130" x2="130" y1="207" y2="193" stroke="black"></line>
                <text x="120" y="185">R/2</text>
                <line x1="60" x2="60" y1="207" y2="193" stroke="black"></line>
                <text x="55" y="185">R</text>
                <line x1="200" x2="200" y1="0" y2="400" stroke="black"></line>
                <text x="215" y="15">Y</text>
                <polygon points="200,0 194,15 206,15" stroke="black"></polygon>
                <line x1="207" x2="193" y1="270" y2="270" stroke="black"></line>
                <text x="215" y="275">R/2</text>
                <line x1="207" x2="193" y1="340" y2="340" stroke="black"></line>
                <text x="215" y="345">R</text>
                <line x1="207" x2="193" y1="130" y2="130" stroke="black"></line>
                <text x="215" y="135">R/2</text>
                <line x1="207" x2="193" y1="60" y2="60" stroke="black"></line>
                <text x="215" y="65">R</text>
                <rect class="figure" x="60" y="200" height="140" width="140" fill="red" fill-opacity="0.3"
                      stroke="red"></rect>
                <polygon class="figure" points="200,130 340,200 200,200" fill="green" fill-opacity="0.3"
                         stroke="green"></polygon>
                <path class="figure" d="M200 200 L 270 200 C 270 280 210 270 200 270" fill-opacity="0.3"
                      stroke="yellow" fill="yellow"></path>
                <c:forEach items="${points}" var="result">
                    <circle r="3" cx="${result[1] * 140 / result[2] + 200}"
                            cy="${result[0]* -140 / result[2] + 200}" fill="red" stroke="firebrick">
                    </circle>
                </c:forEach>
            </svg>
        </td>
        <td valign="top" width="18%">
            <form class="form" method="get" action="control">
                <table width="100%">
                    <tr>
                        <td class="yInput" width="70%">
                            <label>Y:</label>
                            <input type="text" name="Y">
                        </td>
                        <td rowspan="2" class="rInput" width="30%">
                            <label>R:</label>
                            <div class="group">
                                <input type="checkbox" name="R" value="1">1<br>
                                <input type="checkbox" name="R" value="2">2<br>
                                <input type="checkbox" name="R" value="3">3<br>
                                <input type="checkbox" name="R" value="4">4<br>
                                <input type="checkbox" name="R" value="5">5<br>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="xInput">
                            <label>X:</label><br>
                            <div>
                                <input type="radio" name="X" value="2">2
                                <input type="radio" name="X" value="1.5">1.5
                                <input type="radio" name="X" value="1">1<br>
                                <input type="radio" name="X" value="0.5">0.5
                                <input type="radio" name="X" value="0">0
                                <input type="radio" name="X" value="-0.5">-0.5<br>
                                <input type="radio" name="X" value="-1">-1
                                <input type="radio" name="X" value="-1.5">-1.5
                                <input type="radio" name="X" value="-2">-2<br>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="sar" colspan="3">
                            <div class="error"></div>
                            <br>
                            <input type="reset" value="Сброс" class="resetBtn">
                            <input type="submit" value="Отправить" class="submitBtn">
                        </td>
                    </tr>
                </table>
            </form>
        </td>
        <td valign="top" width="57%">
            <div class="scroll">
                <table class="result" cellspacing="0">
                    <tr class="resultHeader">
                        <th>Y</th>
                        <th>X</th>
                        <th>R</th>
                        <th>RESULT</th>
                        <th>TIME</th>
                        <th>BENCHMARK</th>
                    </tr>
                    <c:forEach items="${table}" var="result">
                        <tr class="resultFromServlet">
                            <th>${result[0]}</th>
                            <th>${result[1]}</th>
                            <th>${result[2]}</th>
                            <th>${result[3]}</th>
                            <th>${result[4]}</th>
                            <th>${result[5]}микрсек</th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="3" valign="bottom">
            <footer class="footer">
                <span id="gitName">DIVAYTH</span><br>
                <a href="https://github.com/DIVAYTH"><img id="gitImg" src="github.png" height="40px"></a>
            </footer>
        </td>
    </tr>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="script.js"></script>
</body>
</html>