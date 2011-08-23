<%
    // Avoid caching of dynamic pages
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
%>
<%@ page contentType="text/html;charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="mde" uri="/manydesigns-elements"%>
<stripes:layout-definition><%--
--%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <jsp:include page="head.jsp"/>
        <stripes:layout-component name="customScripts"/>
        <jsp:useBean id="dispatch" scope="request"
                     type="com.manydesigns.portofino.dispatcher.Dispatch"/>
        <title><c:out value="${dispatch.lastPageInstance.page.description}"/></title>
    </head>
    <body>
    <div id="doc3" class="yui-t2">
        <div id="hd">
            <jsp:include page="header.jsp"/>
        </div>
        <div id="bd">
            <div id="yui-main">
                <div id="content" class="yui-b">
                    <div class="contentHeader">
                        <stripes:layout-component name="contentHeader">
                            Content header
                        </stripes:layout-component>
                    </div>
                    <div class="contentBody">
                        <stripes:layout-component name="contentBody">
                            Content body
                        </stripes:layout-component>
                    </div>
                    <div class="contentFooter">
                        <stripes:layout-component name="contentFooter">
                            Content footer
                        </stripes:layout-component>
                    </div>
                </div>
            </div>
            <div id="sidebar" class="yui-b">
                <mde:write name="navigation"/>
            </div>
            <script type="text/javascript">
                fixSideBar();
            </script>
        </div>
        <div id="ft">
            <jsp:include page="footer.jsp"/>
        </div>
    </div>
    </body>
    </html>
</stripes:layout-definition>