<%@ page import="com.manydesigns.portofino.modules.ModuleRegistry"
%><%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes-dynattr.tld"
%><%@ taglib prefix="mde" uri="/manydesigns-elements"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"
%><%@ taglib tagdir="/WEB-INF/tags" prefix="portofino"
%><stripes:layout-definition><%--
--%><!doctype html>
    <html lang="en">
    <jsp:include page="/theme/head.jsp">
        <jsp:param name="pageTitle" value="${(empty pageTitle) ? actionBean.pageInstance.description : pageTitle}" />
    </jsp:include>
    <body class="dialog">
        <div class="dialog-container">
            <stripes:layout-component name="mainPageAction">
                <mde:sessionMessages />
                <stripes:layout-component name="mainPageActionBody">
                    <div>
                        <stripes:layout-component name="pageHeader">
                            <h2>
                                <stripes:layout-component name="pageTitle" />
                            </h2>
                        </stripes:layout-component>
                        <div class="dialogBody spacingTop">
                            <stripes:layout-component name="pageBody" />
                        </div>
                    </div>
                </stripes:layout-component>
                <div class="dialogFooter">
                    <stripes:layout-component name="contentFooter">
                        <hr />
                        <jsp:useBean id="portofinoConfiguration" scope="application"
                                     type="org.apache.commons.configuration.Configuration"/>
                        Powered by <a href="http://www.manydesigns.com/">Portofino</a>
                        <c:out value="<%= ModuleRegistry.getPortofinoVersion() %>"/>
                    </stripes:layout-component>
                </div>
            </stripes:layout-component>
        </div>
    </body>
</html>
</stripes:layout-definition>