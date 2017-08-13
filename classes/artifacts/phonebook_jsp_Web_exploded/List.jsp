<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="app.Phonebook" %>
<%@ page import="app.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="app.Phone" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core"
      xmlns:h="http://java.sun.com/jsf/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Список людей</title>
</head>

<style type="text/css">
    body {
        background-color: #3e94ec;
        font-family: "Roboto", helvetica, arial, sans-serif;
        font-size: 16px;
        font-weight: 400;
        text-rendering: optimizeLegibility;
    }

    .table-fill {
        background: white;
        border-radius: 3px;
        border-collapse: collapse;
        /*Побалуйся тут*/
        height: 500px;
        margin: auto;
        max-width: 900px;
        padding: 5px;
        width: 100%;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    th {
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

    tr {
        border-top: 1px solid #C1C3D1;
        border-bottom: 1px solid #C1C3D1;
        color: #666B85;
        font-weight: normal;
        text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
    }

    tr:nth-child(odd) td {
        background: #EBEBEB;
    }

    tr:hover td {
        background: #717491;
        color: #FFFFFF;
        border-top: 1px solid #22262E;
        border-bottom: 1px solid #22262E;
    }

    tr:nth-child(odd):hover td {
        background: #4E5066;
    }

    td {
        height: 50px;
        max-height: 50px;
        background: #FFFFFF;
        padding: 10px;
        vertical-align: middle;
        font-weight: 300;()
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
</style>

<body>

<%
    Phonebook phonebook = Phonebook.getInstance();
    String user_message = "";
    HashMap<String, String> jsp_parameters = new HashMap<String, String>();
//	Phonebook phonebook = (Phonebook)request.getAttribute("phonebook");

    if (request.getAttribute("jsp_parameters") != null) {
        jsp_parameters = (HashMap<String, String>) request.getAttribute("jsp_parameters");
    }

    user_message = jsp_parameters.get("current_action_result_label");
%>

<table class="table-fill" align="center" border="1" width="90%">
    <thread>
        <%
            if ((user_message != null) && (!user_message.equals(""))) {
        %>
        <tr>
            <td colspan="6" align="center"><%=user_message%>
            </td>
        </tr>
        <%
            }
        %>

        <tr>
            <td colspan="6" align="center"><a href="<%=request.getContextPath()%>/?action=add">Добавить запись</a></td>
        </tr>
        <tr>
            <td align="center"><b>Фамилия</b></td>
            <td align="center"><b>Имя</b></td>
            <td align="center"><b>Отчество</b></td>
            <td align="center"><b>Телефон(ы)</b></td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
        </tr>
    </thread>
    <tbody>
    <%
        for (Person person : phonebook.getContents().values()) {

    %>
    <tr>
        <td><%=person.getSurname()%>
        </td>
        <td><%=person.getName()%>
        </td>
        <td><%=person.getMiddlename()%>
        </td>
        <td>
            <%
                for (Phone phone : phonebook.getPhoneContents().values()) {
                    if (phone.getOwner().equals(person.getId())) {
            %>
            <%=phone.getNumber()%><br/>
            <%
                    }
                }
            %>
        </td>
        <td><a href="<%=request.getContextPath()%>/?action=edit&id=<%=person.getId()%>">Редактировать</a></td>
        <td><a href="<%=request.getContextPath()%>/?action=delete&id=<%=person.getId()%>">Удалить</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>