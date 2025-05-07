<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LankaRails | Reservations</title>
  <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=${sessionScope.username}&background=1e293b&color=22c55e&rounded=true" type="image/x-icon">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>

<body class="bg-slate-950 text-white min-h-screen flex">

  <!-- Sidebar -->
  <%@ include file="../partials/sidebar.jsp" %>

  <!-- Main Content -->
  <div class="flex-1 flex flex-col md:ml-60">

    <!-- Header -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Main Area -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Actions -->
      <div class="flex flex-col md:flex-row md:justify-end md:items-center space-y-4 md:space-y-0">
        <div class="relative w-full md:w-1/3">
          <input id="search" type="text" placeholder="Search reservations..."
            class="w-full pl-10 pr-4 py-2 rounded-lg bg-slate-800 border border-slate-700 focus:ring-2 focus:ring-green-500 focus:outline-none text-white">
          <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
        </div>
      </div>

      <!-- Reservation Table -->
      <div class="overflow-x-auto bg-slate-900 shadow-lg rounded-lg border border-slate-800">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-slate-800 text-slate-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Passenger</th>
              <th class="px-6 py-4">Journey</th>
              <th class="px-6 py-4">Travel Date</th>
              <th class="px-6 py-4">Seats</th>
              <th class="px-6 py-4">Status</th>
            </tr>
          </thead>
          <tbody id="table" class="text-slate-300">
            <c:choose>
              <c:when test="${not empty reservations}">
                <c:forEach var="r" items="${reservations}">
                  <tr class="border-b border-slate-800 hover:bg-slate-800/50">
                    <td class="px-6 py-4">${r.reservationId}</td>
                    <td class="px-6 py-4">
                      ${r.passengerName}<br/>
                      <span class="text-xs text-gray-400">${r.passengerEmail}</span>
                    </td>
                    <td class="px-6 py-4">
                      ${r.trainNumber} | ${r.startStation} → ${r.endStation}<br/>
                      <span class="text-xs text-gray-400">Rs. ${r.ticketPrice}</span>
                    </td>
                    <td class="px-6 py-4">${r.travelDate}</td>
                    <td class="px-6 py-4">${r.numberOfSeats}</td>
                    
                    <!-- Inline Status Update -->
                    <td class="px-6 py-4">
                      <form action="${pageContext.request.contextPath}/staff/reservation" method="post" class="inline">
                        <input type="hidden" name="action" value="update" />
                        <input type="hidden" name="id" value="${r.reservationId}" />
                        <select name="status" onchange="this.form.submit()"
                          class="bg-slate-800 border border-slate-700 text-white text-sm rounded px-2 py-1 focus:ring-2 focus:ring-green-500">
                          <option value="Pending" ${r.status == 'Pending' ? 'selected' : ''}>Pending</option>
                          <option value="Confirmed" ${r.status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                          <option value="Cancelled" ${r.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                        </select>
                      </form>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-4 text-center text-gray-400">No reservations found.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <%@ include file="../partials/script.jsp" %>

</body>
</html>