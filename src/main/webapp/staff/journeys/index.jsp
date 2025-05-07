<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LankaRails | Journey Management</title>
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

    <!-- Topbar -->
    <%@ include file="../partials/header.jsp" %>

    <!-- Main Area -->
    <main class="flex-1 p-6 space-y-6">

      <!-- Header & Actions -->
      <div class="flex flex-col md:flex-row md:justify-between md:items-center space-y-4 md:space-y-0">
        <a href="${pageContext.request.contextPath}/staff/journey?action=create"
           class="flex items-center gap-2 px-5 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg font-semibold transition">
          <i class="fas fa-route"></i> Add New Journey
        </a>

        <div class="relative w-full md:w-1/3">
          <input id="search" type="text" placeholder="Search journeys..."
                 class="w-full pl-10 pr-4 py-2 rounded-lg bg-slate-800 border border-slate-700 focus:ring-2 focus:ring-green-500 focus:outline-none text-white">
          <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
        </div>
      </div>

      <!-- Journey Table -->
      <div class="overflow-x-auto bg-slate-900 shadow-lg rounded-lg border border-slate-800">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-slate-800 text-slate-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Start Station</th>
              <th class="px-6 py-4">End Station</th>
              <th class="px-6 py-4">Ticket Price (Rs)</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody id="table" class="text-slate-300">
            <c:choose>
              <c:when test="${not empty journeys}">
                <c:forEach var="journey" items="${journeys}">
                  <tr class="border-b border-slate-800 hover:bg-slate-800/50">
                    <td class="px-6 py-4">${journey.journeyId}</td>
                    <td class="px-6 py-4">${journey.startStation}</td>
                    <td class="px-6 py-4">${journey.endStation}</td>
                    <td class="px-6 py-4">Rs. ${journey.ticketPrice}</td>
                    <td class="px-6 py-4 text-center space-x-3">
                      <a href="${pageContext.request.contextPath}/staff/journey?action=edit&id=${journey.journeyId}" class="text-green-400 hover:text-green-500">
                        <i class="fas fa-edit"></i>
                      </a>
                      <a href="${pageContext.request.contextPath}/staff/journey?action=delete&id=${journey.journeyId}" onclick="return confirmDelete(this.href);" class="text-red-400 hover:text-red-500">
                        <i class="fas fa-trash-alt"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="5" class="px-6 py-4 text-center text-gray-400">No journeys found.</td>
                </tr>
              </c:otherwise>
            </c:choose>
          </tbody>
        </table>
      </div>

    </main>
  </div>

  <!-- Script Include -->
  <%@ include file="../partials/script.jsp" %>

</body>
</html>