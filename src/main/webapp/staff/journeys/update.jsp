<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LankaRails | Edit Journey</title>
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

      <!-- Journey Update Form -->
      <form action="${pageContext.request.contextPath}/staff/journey" method="POST" class="bg-slate-900 shadow-lg rounded-lg p-8 w-full">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${journey.journeyId}">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

          <!-- Start Station -->
          <div>
            <label for="start_station" class="block text-sm font-medium mb-1">Start Station</label>
            <input type="text" id="start_station" name="start_station" required
              value="${journey.startStation}"
              class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none">
          </div>

          <!-- End Station -->
          <div>
            <label for="end_station" class="block text-sm font-medium mb-1">End Station</label>
            <input type="text" id="end_station" name="end_station" required
              value="${journey.endStation}"
              class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none">
          </div>

          <!-- Ticket Price -->
          <div class="md:col-span-2">
            <label for="ticket_price" class="block text-sm font-medium mb-1">Ticket Price (Rs)</label>
            <input type="number" step="0.01" id="ticket_price" name="ticket_price" required
              value="${journey.ticketPrice}"
              class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none">
          </div>
        </div>

        <!-- Submit Button -->
        <div class="mt-8 flex justify-end">
          <button type="submit" class="flex items-center gap-2 px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg font-semibold transition">
            <i class="fas fa-save"></i> Update Journey
          </button>
        </div>
      </form>

    </main>
  </div>

  <%@ include file="../partials/script.jsp" %>

</body>
</html>