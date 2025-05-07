<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Schedules | SwiftBus</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- Navbar -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <%@ include file="partials/navbarsession.jsp" %>
  </c:when>
  <c:otherwise>
    <%@ include file="partials/navbar.jsp" %>
  </c:otherwise>
</c:choose>

<section class="py-20 bg-gray-50">
  <div class="container mx-auto px-4">
    <div class="flex flex-col md:flex-row md:items-center md:justify-between mb-8 space-y-4 md:space-y-0">
      <h2 class="text-3xl font-bold text-gray-900">Schedules</h2>
      <input id="searchBar" type="text" placeholder="Search schedules..." 
             class="w-full md:w-1/3 px-4 py-2 border border-gray-300 rounded-lg focus:ring-green-500 focus:border-green-500 text-sm">
    </div>

    <!-- Feedback Messages -->
    <c:if test="${not empty success}">
      <div class="mb-6 bg-green-100 text-green-800 px-4 py-3 rounded text-center font-medium">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="mb-6 bg-red-100 text-red-800 px-4 py-3 rounded text-center font-medium">${error}</div>
    </c:if>

    <!-- Schedule Grid -->
    <div id="scheduleGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <c:forEach var="schedule" items="${schedules}">
        <div class="scheduleCard bg-white border border-gray-200 rounded-xl shadow-sm p-6 hover:shadow-lg transition-all duration-300">
          <h3 class="text-xl font-bold text-gray-900 mb-2">${schedule.startLocation} → ${schedule.endLocation}</h3>
          <p class="text-sm text-gray-600">Bus: ${schedule.busNumber}</p>
          <p class="text-sm">Departure: ${schedule.startTime}</p>
          <p class="text-sm mb-4">Arrival: ${schedule.arrivalTime}</p>
          <p class="text-sm font-semibold">Price: Rs. ${schedule.ticketPrice}</p>
          <button onclick="openBookingModal(${schedule.scheduleId})"
                  class="mt-4 w-full bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
            Book Now
          </button>
        </div>
      </c:forEach>
    </div>

    <!-- No Results Message -->
    <div id="noResultsMessage" class="hidden text-center text-gray-500 text-lg mt-10 py-16">
      No schedules found for your search.
    </div>
  </div>
</section>

<!-- Booking Modal -->
<div id="bookingModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
  <div class="bg-white rounded-lg shadow-xl p-6 w-full max-w-md relative">
    <h3 class="text-xl font-bold mb-4">Book Your Seat</h3>
    <form id="bookingForm" action="${pageContext.request.contextPath}/schedules" method="post">
      <input type="hidden" name="action" value="book">
      <input type="hidden" name="scheduleId" id="modalScheduleId">

      <div class="mb-4">
        <label for="travelDate" class="block text-sm font-medium text-gray-700">Travel Date</label>
        <input type="date" name="travelDate" id="travelDate" required
               class="mt-1 w-full px-4 py-2 border rounded">
      </div>
      <div class="mb-4">
        <label for="numberOfSeats" class="block text-sm font-medium text-gray-700">Number of Seats</label>
        <input type="number" name="numberOfSeats" id="numberOfSeats" min="1" required
               class="mt-1 w-full px-4 py-2 border rounded">
      </div>
      <div class="flex justify-end gap-2">
        <button type="button" onclick="closeBookingModal()" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">Cancel</button>
        <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700">Confirm</button>
      </div>
    </form>
  </div>
</div>

<script>
  function openBookingModal(scheduleId) {
    const isLoggedIn = ${sessionScope.user != null};
    if (!isLoggedIn) {
      window.location.href = '${pageContext.request.contextPath}/login';
      return;
    }
    document.getElementById('modalScheduleId').value = scheduleId;
    document.getElementById('bookingModal').classList.remove('hidden');
  }

  function closeBookingModal() {
    document.getElementById('bookingModal').classList.add('hidden');
  }

  document.addEventListener('click', function(event) {
    const modal = document.getElementById('bookingModal');
    if (event.target === modal) closeBookingModal();
  });

  document.getElementById('searchBar').addEventListener('input', function () {
    const keyword = this.value.toLowerCase();
    let matchCount = 0;

    document.querySelectorAll('.scheduleCard').forEach(function (card) {
      const text = card.textContent.toLowerCase();
      const match = text.includes(keyword);
      card.style.display = match ? '' : 'none';
      if (match) matchCount++;
    });

    document.getElementById('noResultsMessage').classList.toggle('hidden', matchCount > 0);
  });
</script>

<%@ include file="partials/footer.jsp" %>
</body>
</html>