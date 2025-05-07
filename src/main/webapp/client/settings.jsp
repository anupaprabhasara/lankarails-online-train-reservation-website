<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Settings | LankaRails</title>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-slate-100 text-slate-800">

<%@ include file="partials/navbarsession.jsp" %>

<div class="max-w-2xl mx-auto my-12 bg-white p-8 rounded-lg shadow">
  <h2 class="text-2xl font-bold text-slate-800 mb-6">Update Your Profile</h2>

  <form method="post" action="${pageContext.request.contextPath}/settings">
    <div class="space-y-4">
      <div>
        <label class="block text-slate-700 font-medium">Full Name</label>
        <input type="text" name="name" value="${passenger.name}" required class="w-full px-4 py-2 border rounded-md">
      </div>
      <div>
        <label class="block text-slate-700 font-medium">Email</label>
        <input type="email" name="email" value="${passenger.email}" required class="w-full px-4 py-2 border rounded-md">
      </div>
      <div>
        <label class="block text-slate-700 font-medium">Phone Number</label>
        <input type="text" name="phone" value="${passenger.phone}" required class="w-full px-4 py-2 border rounded-md">
      </div>
      <div>
        <label class="block text-slate-700 font-medium">New Password</label>
        <input id="password" type="password" name="new_password" placeholder="Leave blank to keep current password"
               class="w-full px-4 py-2 border rounded-md">
        <div id="password-hints" class="text-sm text-slate-600 space-y-1 mt-2">
          <p id="lengthHint" class="text-red-600">At least 8 characters</p>
          <p id="uppercaseHint" class="text-red-600">At least one uppercase letter</p>
          <p id="lowercaseHint" class="text-red-600">At least one lowercase letter</p>
          <p id="digitHint" class="text-red-600">At least one number</p>
        </div>
      </div>
      <div>
        <label class="block text-slate-700 font-medium">Current Password <span class="text-red-600">*</span></label>
        <input type="password" name="current_password" required class="w-full px-4 py-2 border rounded-md">
      </div>
    </div>

    <div class="mt-6">
      <button type="submit" class="bg-green-600 text-white px-6 py-2 rounded-md hover:bg-green-700">
        Save Changes
      </button>
    </div>
  </form>

  <c:if test="${not empty error}">
    <div class="mt-4 text-red-600 font-medium">${error}</div>
  </c:if>
  <c:if test="${not empty success}">
    <div class="mt-4 text-green-600 font-medium">${success}</div>
  </c:if>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const passwordInput = document.getElementById("password");

    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");

    if (passwordInput) {
      passwordInput.addEventListener("input", function () {
        const val = passwordInput.value;

        lengthHint.className = val.length >= 8 ? "text-green-600" : "text-red-600";
        uppercaseHint.className = /[A-Z]/.test(val) ? "text-green-600" : "text-red-600";
        lowercaseHint.className = /[a-z]/.test(val) ? "text-green-600" : "text-red-600";
        digitHint.className = /\d/.test(val) ? "text-green-600" : "text-red-600";
      });
    }
  });
</script>

<%@ include file="partials/footer.jsp" %>
</body>
</html>