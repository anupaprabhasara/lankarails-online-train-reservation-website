<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Reservations | LankaRails</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100">
<%@ include file="partials/navbarsession.jsp" %>

<div class="max-w-5xl mx-auto my-12 bg-white p-6 rounded-lg shadow">
  <h2 class="text-2xl font-bold mb-6 text-blue-700">My Reservations</h2>

  <c:if test="${empty reservations}">
    <p class="text-gray-600 text-center">You have not made any reservations yet.</p>
  </c:if>

  <c:if test="${not empty reservations}">
    <div class="space-y-6">
      <c:forEach var="r" items="${reservations}">
        <div class="border border-gray-200 rounded-lg p-4 bg-gray-50">
          <div class="flex justify-between items-center">
            <div>
              <h3 class="text-lg font-semibold text-gray-800">${r.startStation} → ${r.endStation}</h3>
              <p class="text-sm text-gray-600">Train: ${r.trainNumber}</p>
              <p class="text-sm text-gray-600">Travel Date: ${r.travelDate}</p>
              <p class="text-sm text-gray-600">Seats: ${r.numberOfSeats}</p>
              <p class="text-sm text-gray-600">Status: ${r.status}</p>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/reservations"
                  onsubmit="return confirm('Are you sure you want to cancel this reservation?');">
              <input type="hidden" name="reservationId" value="${r.reservationId}">
              <button type="submit"
                      class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">
                Cancel
              </button>
            </form>
          </div>
        </div>
      </c:forEach>
    </div>
  </c:if>
</div>

<%@ include file="partials/footer.jsp" %>
</body>
</html>