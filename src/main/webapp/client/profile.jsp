<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile | SwiftBus</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-100 text-gray-800">

    <%@ include file="partials/navbarsession.jsp" %>

    <div class="max-w-3xl mx-auto my-12 bg-white p-8 rounded-lg shadow-md">
        <div class="flex items-center space-x-6">
            <img src="https://ui-avatars.com/api/?name=${sessionScope.name}&background=22c55e&color=fff"
                alt="${sessionScope.name}" class="w-20 h-20 rounded-full shadow">
            <div>
                <h2 class="text-2xl font-bold">${user.name}</h2>
                <p class="text-gray-600">${user.email}</p>
            </div>
        </div>

        <div class="mt-8">
            <h3 class="text-lg font-semibold mb-4">Profile Details</h3>
            <ul class="space-y-3 text-gray-700 text-sm">
                <li><strong>Name:</strong> ${user.name}</li>
                <li><strong>Email:</strong> ${user.email}</li>
                <li><strong>Phone:</strong> ${user.phone}</li>
                <li><strong>Joined:</strong> ${user.createdAt}</li>
            </ul>
        </div>
    </div>

    <%@ include file="partials/footer.jsp" %>
</body>
</html>