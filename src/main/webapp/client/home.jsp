<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home | SwiftBus</title>
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

  <!-- Hero Section with Background Image -->
  <section class="relative bg-gray-900 text-white h-[32rem] flex items-center justify-center">
    <!-- Background Image -->
    <div class="absolute inset-0 bg-cover bg-bottom bg-no-repeat" style="background-image: url('${pageContext.request.contextPath}/client/assets/banner.jpg');"></div>

    <!-- Overlay -->
    <div class="absolute inset-0 bg-black bg-opacity-50"></div>

    <!-- Content -->
    <div class="relative z-10 text-center px-4">
      <h1 class="text-4xl md:text-5xl font-bold mb-4">Book Your Journey with Ease</h1>
      <p class="text-lg md:text-xl text-gray-200 max-w-2xl mx-auto mb-6">SwiftBus connects you to destinations all over the country. Fast, safe, and easy bookings anytime.</p>
      <div class="flex flex-col md:flex-row justify-center gap-4">
        <a href="${pageContext.request.contextPath}/routes"
           class="bg-green-600 text-white px-8 py-3 rounded-lg hover:bg-green-700 transition transform hover:-translate-y-1 shadow">
          <i class="fas fa-road mr-2"></i> View Routes
        </a>
        <a href="${pageContext.request.contextPath}/schedules"
           class="border-2 border-gray-100 text-gray-100 px-8 py-3 rounded-lg transition transform hover:-translate-y-1 shadow">
          <i class="fas fa-clock mr-2"></i> Check Schedules
        </a>
      </div>
    </div>
  </section>

  <!-- Popular Routes Section -->
  <section class="py-20 bg-gray-50">
    <div class="container mx-auto px-4">
      <div class="flex justify-between items-center mb-8">
        <h2 class="text-3xl font-bold text-gray-900">Popular Routes</h2>
        <a href="${pageContext.request.contextPath}/routes"
           class="text-green-600 hover:text-green-800 flex items-center font-medium">
          View All Routes <i class="fas fa-arrow-right ml-2"></i>
        </a>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <c:forEach var="route" items="${routes}">
          <div class="bg-white border border-gray-200 rounded-xl shadow-sm hover:shadow-lg transition-all duration-300">
            <div class="px-6 py-5">
              <h3 class="text-xl font-bold text-gray-900 mb-1">${route.startLocation} → ${route.endLocation}</h3>
              <p class="text-sm text-gray-600 mb-4">Ticket Price: <strong>Rs. ${route.ticketPrice}</strong></p>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </section>

  <!-- How It Works -->
  <section class="py-16">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl font-bold text-center mb-12">How It Works</h2>
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8 text-center">
        <div>
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-road text-2xl text-green-600"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Choose Route</h3>
          <p class="text-gray-600">Pick your preferred destination</p>
        </div>
        <div>
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-clock text-2xl text-green-600"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Select Time</h3>
          <p class="text-gray-600">Choose from available schedules</p>
        </div>
        <div>
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-ticket-alt text-2xl text-green-600"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Reserve Seat</h3>
          <p class="text-gray-600">Book your seat online in seconds</p>
        </div>
        <div>
          <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <i class="fas fa-bus-alt text-2xl text-green-600"></i>
          </div>
          <h3 class="text-xl font-semibold mb-2">Enjoy Trip</h3>
          <p class="text-gray-600">Travel comfortably and safely</p>
        </div>
      </div>
    </div>
  </section>

  <%@ include file="partials/footer.jsp" %>

</body>
</html>