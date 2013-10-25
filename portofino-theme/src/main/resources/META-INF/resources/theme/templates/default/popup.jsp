<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes-dynattr.tld"
%><%@ taglib prefix="mde" uri="/manydesigns-elements"
%><stripes:layout-definition><%--
--%><!DOCTYPE html>
    <html lang="en">
    <head>
        <jsp:include page="/theme/head.jsp"/>
        <style type="text/css">
            body {
                padding-top: 0;
            }
        </style>
        <jsp:useBean id="actionBean" scope="request" type="com.manydesigns.portofino.dispatcher.PageAction" />
        <title>
            <stripes:layout-component name="pageTitle">
                <c:out value="${actionBean.pageInstance.description}"/>
            </stripes:layout-component>
        </title>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="content span12">
                <stripes:layout-component name="mainPageAction">
                    <stripes:layout-component name="contentHeader">
                        <stripes:layout-component name="beforeSessionMessages" />
                        <mde:sessionMessages />
                        <stripes:layout-component name="afterSessionMessages" />
                    </stripes:layout-component>
                    <stripes:layout-component name="mainPageActionBody">
                        <div>
                            <stripes:layout-component name="pageHeader">
                                <div class="pageHeader" style="padding-bottom: 0;">
                                    <h3>
                                        <stripes:layout-component name="pageTitle" />
                                    </h3>
                                </div>
                            </stripes:layout-component>
                            <div class="pageBody">
                                <stripes:layout-component name="pageBody" />
                            </div>
                        </div>
                    </stripes:layout-component>
                    <stripes:layout-component name="contentFooter" />
                </stripes:layout-component>
            </div>
        </div>
    </div>
    </body>
    </html>
</stripes:layout-definition>