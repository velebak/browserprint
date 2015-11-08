<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%-- These comments are to prevent excess whitespace in the output.
--%><%@page session="false"%><%--
--%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--
--%><jsp:useBean id="historyListBean" class="beans.HistoryListBean" scope="request" /><%--
--%><jsp:useBean id="chrsBean1" class="beans.CharacteristicsBean" scope="request" /><%--
--%><jsp:useBean id="uniquenessBean1" class="beans.UniquenessBean" scope="request" /><%--
--%><%@taglib prefix="common" tagdir="/WEB-INF/tags"%><%--
--%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Browserprint</title>
	<meta name="robots" content="noindex, nofollow" >
	<link type="text/css" href="style.css" rel="stylesheet">
	<script type="text/javascript" src="scripts/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="scripts/jquery-dateFormat.min.js"></script>
	<script type="text/javascript" src="scripts/view.js"></script>
</head>
<body>
<%@include file="header.html" %>
	<p>
		<a href="view">Back</a>
	</p>
	<div id="compareDiv">
		<form action="view" method="get">
			<div style="float:left;">			
				<table class="viewOptionsTable">
					<tr>
						<td>
							<c:choose><%--
								--%><c:when test="${ requestScope.source1 == "history" }"><%--
									--%><input type="radio" name="source1" value="history" checked><%--
								--%></c:when><%--
								--%><c:otherwise><%--
									--%><input type="radio" name="source1" value="history"><%--
								--%></c:otherwise><%--
							--%></c:choose>
						</td>
						<td class="viewOptionsTd">
							History
							<br/>
							<select name="UUID1history" id="historySelector1" class="historySelect">
								<c:choose><%--
									--%><c:when test="${ requestScope.source1 == "history" }"><%--
										--%><common:historyOptions historyListBean="${ historyListBean }" sampleUUID="${ requestScope.sampleUUID1 }" /><%--
									--%></c:when><%--
									--%><c:otherwise><%--
										--%><common:historyOptions historyListBean="${ historyListBean }" /><%--
									--%></c:otherwise><%--
								--%></c:choose>
							</select>
							<script type="text/javascript">
								fixDates("historySelector1");
							</script>
						</td>
					</tr>
					<tr>
						<td>
							<c:choose><%--
								--%><c:when test="${ requestScope.source1 == "UUID" }"><%--
									--%><input type="radio" name="source1" value="UUID" checked><%--
								--%></c:when><%--
								--%><c:otherwise><%--
									--%><input type="radio" name="source1" value="UUID"><%--
								--%></c:otherwise><%--
							--%></c:choose>
						</td>
						<td class="viewOptionsTd">
							UUID
							<br/>
							<input type="text" name="UUID1UUID" maxlength="36" style="display: inline-block;" value="<c:out value="${ requestScope.sampleUUID1 }"/>"></input>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="viewOptionsButtonTd"><input type="submit" name="action" value="View" id="sampleViewButton"/></td>
					</tr>
				</table>
			</div>
			<div style="float:right;">
				<div class="sampleBox">
					History
					<br/>
					<select name="sampleUUID2" id="historySelector2" class="historySelect"><%--
						--%><common:historyOptions historyListBean="${ historyListBean }" />
					</select>
					<script type="text/javascript">
						fixDates("historySelector2");
					</script>
				</div>
			</div>
			<div style="clear:both;">
				<input type="submit" name="action" value="Compare" id="sampleCompareButton"/>
			</div>
		</form>
	</div>
<common:displayFingerprint uniquenessBean="${ uniquenessBean1 }" chrsBean="${ chrsBean1 }"/>
<%@include file="footer.jsp" %>
</body>
</html>