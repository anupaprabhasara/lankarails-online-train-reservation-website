<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Passenger Profile | LankaRails</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-blue-50 text-gray-800">

    <%@ include file="partials/navbarsession.jsp" %>

    <div class="max-w-3xl mx-auto my-12 bg-white p-8 rounded-lg shadow-md">
        <div class="flex items-center space-x-6">
            <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=2599ef&color=fff&rounded=true"
                alt="${sessionScope.name}" class="w-20 h-20 rounded-full shadow">
            <div>
                <h2 class="text-2xl font-bold">${passenger.name}</h2>
                <p class="text-gray-600">${passenger.email}</p>
            </div>
        </div>

        <div class="mt-8">
            <h3 class="text-lg font-semibold mb-4">Passenger Details</h3>
            <ul class="space-y-3 text-gray-700 text-sm">
                <li><strong>Full Name:</strong> ${passenger.name}</li>
                <li><strong>Email Address:</strong> ${passenger.email}</li>
                <li><strong>Phone Number:</strong> ${passenger.phone}</li>
                <li><strong>Joined On:</strong> ${passenger.createdAt}</li>
            </ul>
        </div>
    </div>

    <%@ include file="partials/footer.jsp" %>
</body>
</html>