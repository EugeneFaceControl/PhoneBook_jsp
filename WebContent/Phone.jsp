<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="app.Phone" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Добавление телефона</title>
</head>

<style type="text/css">
    body {
        background-color: #3e94ec;
        font-family: "Roboto", helvetica, arial, sans-serif;
        font-size: 16px;
        font-weight: 400;
        text-rendering: optimizeLegibility;
    }

    .table-fill{
        border-radius:3px;
        border-collapse: collapse;
        /*Побалуйся тут*/
        height: 400px;
        margin: auto;
        max-width: 900px;
        width: 100%;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    th{
        color: #D5DDE5;
        background: #1b1e24;
        border-bottom: 4px solid #9ea7af;
        border-right: 1px solid #343a45;
        /*Побалуйся тут*/
        font-size: 15px;
        font-weight: 100;
        padding: 11px;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        vertical-align: middle;
    }

    tr{
        border-top: 1px solid #C1C3D1;
        border-bottom: 1px solid #C1C3D1;
        color: #666B85;
        font-weight: normal;
        text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
    }

    tr:nth-child(odd) td {
        background:#EBEBEB;
    }

    tr:hover td{
        background: #717491;
        color: #FFFFFF;
        /*border-top: 1px solid #22262E;*/
        /*border-bottom: 1px solid #22262E;*/
    }

    tr:nth-child(odd):hover td {
        background:#7E81A3;
    }

    td{
        background: #FFFFFF;
        padding: 10px;
        vertical-align: middle;
        font-weight: 300;
        font-size: 16px;
    }

    a:link {
        text-decoration: none;
        color: #000000;
    }

    a:visited {
        color: #000000;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
        color: #FFFFFF;
    }
    a:active {
        text-decoration: underline;
    }

    /*Кнопки*/
    input[type=text], select {
        width: 100%;
        height: 30px;
        /*padding: 9px 0px;*/
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type=submit] {
        width: 100%;
        height: 30px;
        background-color: #4C75E9;
        color: #000000;
        padding: 6px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #4380C4;
        color: white;
    }
    .phones {
        width: 100%;
    }
</style>

<body>

<%
    HashMap<String, String> jsp_parameters = new HashMap<>();
    Phone phone = new Phone();
    String error_message = "";

    if (request.getAttribute("jsp_parameters") != null) {
        jsp_parameters = (HashMap<String, String>) request.getAttribute("jsp_parameters");
    }

    if (request.getAttribute("phone") != null) {
        phone = (Phone) request.getAttribute("phone");
    }

    error_message = jsp_parameters.get("error_message");
%>

<form action="<%=request.getContextPath()%>/" method="post">
    <table class="table-fill" align="center" border="1" width="70%">
        <%
        if ((error_message != null) && (!error_message.equals(""))) {
        %>
        <tr>
            <td colspan="2" align="center"><span style="color:red"><%=error_message%></span></td>
        </tr>
        <%
        }
        %>
        <tr>
            <td><input type="text" name="number" value="<%=phone.getNumber()%>"/></td>
        </tr>
        <tr>
        <td colspan="2" align="center">
        <input type="submit" name="<%=jsp_parameters.get("next_action")%>"
        value="<%=jsp_parameters.get("next_action_label")%>"/><br>
        <a href="../">Вернуться к списку</a>
        </td>
        </tr>
    </table>
    <tr>
            <input type="hidden" name="idPhone" value="<%=phone.getId()%>"/>
        </tr>
    <tr>
            <input type="hidden" name="owner" value="<%=phone.getOwner()%>"/>
        </tr>
</form>
</body>
</html>