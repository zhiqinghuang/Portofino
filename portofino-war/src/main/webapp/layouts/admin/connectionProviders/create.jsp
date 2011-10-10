<%@ page contentType="text/html;charset=ISO-8859-1" language="java"
         pageEncoding="ISO-8859-1"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"
%><%@taglib prefix="mde" uri="/manydesigns-elements"
%><stripes:layout-render name="/skins/default/admin-page.jsp">
    <jsp:useBean id="actionBean" scope="request" type="com.manydesigns.portofino.actions.admin.ConnectionProvidersAction"/>
    <stripes:layout-component name="pageTitle">
        Create connection provider
    </stripes:layout-component>
    <stripes:layout-component name="contentHeader">
        <stripes:submit name="save" value="Save" class="contentButton"/>
        <stripes:submit name="cancel" value="Cancel" class="contentButton"/>
    </stripes:layout-component>
    <stripes:layout-component name="portletTitle">
        Create connection provider
    </stripes:layout-component>
    <stripes:layout-component name="portletBody">
        <mde:write name="actionBean" property="form"/>
        <c:if test="${actionBean.detectedValuesForm != null}">
            <div class="horizontalSeparator"></div>
        </c:if>
        <stripes:hidden name="connectionType" />
    </stripes:layout-component>
    <stripes:layout-component name="contentFooter">
        <stripes:submit name="save" value="Save" class="contentButton"/>
        <stripes:submit name="cancel" value="Cancel" class="contentButton"/>
    </stripes:layout-component>
</stripes:layout-render>