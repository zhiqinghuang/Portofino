<%@ page import="org.slf4j.LoggerFactory" %>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <jsp:include page="/theme/head.jsp"/>
        <title>
            <stripes:layout-component name="pageTitle">
                <c:out value="${actionBean.pageInstance.description}"/>
            </stripes:layout-component>
        </title>
    </head>
    <body>
    <jsp:include page="/theme/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="span2">
                <stripes:layout-component name="sidebar">
                    <portofino:embedded-page-actions list="aboveNavigation" />
                    <div class="navigation">
                        <jsp:include page="/theme/navigation.jsp" />
                    </div>
                    <portofino:embedded-page-actions list="belowNavigation" />
                </stripes:layout-component>
            </div>
            <div class="content span10">
                <stripes:layout-component name="mainPageAction">
                    <stripes:layout-component name="contentHeader">
                        <stripes:layout-component name="beforeSessionMessages" />
                        <mde:sessionMessages />
                        <stripes:layout-component name="afterSessionMessages" />
                        <stripes:layout-component name="beforeBreadcrumbs" />
                        <jsp:include page="/theme/breadcrumbs.jsp" />
                        <stripes:layout-component name="afterBreadcrumbs" />
                        <stripes:layout-component name="pageHeader">
                            <div class="pageHeader" style="padding-bottom: 0;">
                                <stripes:form action="${actionBean.context.actualServletPath}" method="post">
                                    <h3>
                                        <span class="pull-right">
                                            <input type="hidden" name="cancelReturnUrl" value="<c:out value="${actionBean.cancelReturnUrl}"/>"/>
                                            <stripes:layout-component name="pageHeaderButtons">
                                                <span class="btn-group">
                                                    <portofino:buttons list="pageHeaderButtons" cssClass="btn-mini" />
                                                </span>
                                            </stripes:layout-component>
                                        </span>
                                        <stripes:layout-component name="pageTitle" />
                                    </h3>
                                </stripes:form>
                            </div>
                        </stripes:layout-component>
                    </stripes:layout-component>
                    <div class="row-fluid">
                        <div class="span8">
                            <% actionBean.initEmbeddedPageActions(); %>
                            <ul class="nav nav-tabs tabs-header">
                                <c:forEach var="embeddedPageAction" items="${ actionBean.embeddedPageActions['default'] }">
                                    <li>
                                        <a href="#embeddedPageActionWrapper_<c:out value='${embeddedPageAction.id}' />" data-toggle="tab"><c:out value='${embeddedPageAction.id}' /></a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="tab-content">
                                <c:forEach var="embeddedPageAction" items="${ actionBean.embeddedPageActions['default'] }">
                                    <div class="tab-pane" id="embeddedPageActionWrapper_<c:out value='${embeddedPageAction.id}' />">
                                        <% try {%>
                                        <jsp:include page="${embeddedPageAction.path}" flush="false" />
                                        <%} catch (Throwable t) {
                                            LoggerFactory.getLogger(actionBean.getClass()).error("Error in included page", t);
                                        %>
                                        <div class="alert alert-error">
                                            <button data-dismiss="alert" class="close" type="button">&times;</button>
                                            <ul class="errorMessages">
                                                <li>
                                                    <fmt:message key="pageaction.view.error">
                                                        <fmt:param value="${embeddedPageAction.path}" />
                                                    </fmt:message>
                                                </li>
                                            </ul>
                                        </div>
                                        <%}%>
                                    </div>
                                </c:forEach>
                            </div>
                            <script>
                                $('.tabs-header a:first').tab('show');
                            </script>
                        </div>
                        <div class="span4">
                            <stripes:layout-component name="mainPageActionBody">
                                <div class="well">
                                    <div>
                                        <div class="pageBody">
                                            <stripes:layout-component name="pageBody" />
                                        </div>
                                    </div>
                                </div>
                            </stripes:layout-component>
                        </div>
                    </div>
                    <stripes:layout-component name="contentFooter" />
                </stripes:layout-component>
            </div>
        </div>
    </div>
    <jsp:include page="/theme/footer.jsp"/>
    </body>
    </html>