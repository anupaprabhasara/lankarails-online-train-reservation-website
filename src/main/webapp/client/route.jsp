<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Routes | SwiftBus</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

  <!-- Dynamic Navbar -->
  <c:choose>
    <c:when test="${isLoggedIn}">
      <%@ include file="partials/navbarsession.jsp" %>
    </c:when>
    <c:otherwise>
      <%@ include file="partials/navbar.jsp" %>
    </c:otherwise>
  </c:choose>

  <!-- Main Content -->
  <section class="py-20 bg-gray-50">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-3xl font-bold text-gray-900">All Bus Routes</h2>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="route" items="${routes}">
          <div class="bg-white border border-gray-200 rounded-xl shadow-sm hover:shadow-lg transition-all duration-300">
            <div class="px-6 py-5">
              <h3 class="text-xl font-bold text-gray-900 mb-2">${route.startLocation} → ${route.endLocation}</h3>
              <p class="text-sm text-gray-700 mb-3">Ticket Price: <strong>Rs. ${route.ticketPrice}</strong></p>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>

  <%@ include file="partials/footer.jsp" %>
</body>
</html>