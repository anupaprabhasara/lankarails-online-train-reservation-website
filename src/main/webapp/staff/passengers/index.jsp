<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LankaRails | Passengers</title>
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

      <!-- Header & Search -->
      <div class="flex flex-col md:flex-row md:justify-end space-y-4 md:space-y-0">
        <div class="relative w-full md:w-1/3">
          <input type="text" id="search" placeholder="Search passengers..."
            class="w-full pl-10 pr-4 py-2 rounded-lg bg-slate-800 border border-slate-700 focus:ring-2 focus:ring-green-500 focus:outline-none text-white">
          <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
        </div>
      </div>

      <!-- Passenger Table -->
      <div class="overflow-x-auto bg-slate-900 shadow-lg rounded-lg border border-slate-800">
        <table class="w-full text-sm text-left">
          <thead class="text-xs uppercase bg-slate-800 text-slate-300">
            <tr>
              <th class="px-6 py-4">ID</th>
              <th class="px-6 py-4">Name</th>
              <th class="px-6 py-4">Email</th>
              <th class="px-6 py-4">Phone</th>
              <th class="px-6 py-4">Created At</th>
              <th class="px-6 py-4 text-center">Actions</th>
            </tr>
          </thead>
          <tbody id="table" class="text-slate-300">
            <c:choose>
              <c:when test="${not empty passengers}">
                <c:forEach var="p" items="${passengers}">
                  <tr class="border-b border-slate-800 hover:bg-slate-800/50">
                    <td class="px-6 py-4">${p.passengerId}</td>
                    <td class="px-6 py-4">${p.name}</td>
                    <td class="px-6 py-4">${p.email}</td>
                    <td class="px-6 py-4">${p.phone}</td>
                    <td class="px-6 py-4">${p.createdAt}</td>
                    <td class="px-6 py-4 text-center">
                      <a href="${pageContext.request.contextPath}/staff/passenger?action=delete&id=${p.passengerId}" onclick="return confirm('Are you sure you want to delete this passenger?')" class="text-red-400 hover:text-red-500">
                        <i class="fas fa-trash-alt"></i> Delete
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-4 text-center text-gray-400">No passengers found.</td>
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