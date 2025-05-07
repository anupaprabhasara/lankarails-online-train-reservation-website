<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LankaRails | Edit Staff</title>
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

      <!-- Staff Update Form -->
      <form action="${pageContext.request.contextPath}/staff/manage" method="POST" class="bg-slate-900 shadow-lg rounded-lg p-8 w-full">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${staff.staffId}">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

          <!-- Left Column -->
          <div class="space-y-4">
            <div>
              <label for="username" class="block text-sm font-medium mb-1">Username</label>
              <input type="text" id="username" name="username" required
                value="${staff.username}"
                class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none">
            </div>

            <div>
              <label for="email" class="block text-sm font-medium mb-1">Email</label>
              <input type="email" id="email" name="email" required
                value="${staff.email}"
                class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none">
            </div>
          </div>

          <!-- Right Column -->
          <div class="space-y-4">
            <div>
              <label for="password" class="block text-sm font-medium mb-1">Password</label>
              <input type="password" id="password" name="password"
                value="${staff.password}"
                class="w-full px-4 py-2 rounded-lg border border-slate-700 bg-slate-800 text-white focus:ring-2 focus:ring-green-500 focus:outline-none"
                oninput="validatePassword()">

              <div class="text-sm space-y-1 mt-2 hidden" id="passwordCriteria">
                <p id="length" class="text-red-500">At least 8 characters</p>
                <p id="uppercase" class="text-red-500">At least 1 uppercase letter</p>
                <p id="number" class="text-red-500">At least 1 number</p>
                <p id="special" class="text-red-500">At least 1 special character</p>
              </div>
            </div>
          </div>

        </div>

        <!-- Submit Button -->
        <div class="mt-8 flex justify-end">
          <button id="submitButton" type="submit" class="flex items-center gap-2 px-6 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg font-semibold transition">
            <i class="fas fa-save"></i> Update Staff
          </button>
        </div>
      </form>

    </main>
  </div>

  <!-- Footer Scripts -->
  <%@ include file="../partials/script.jsp" %>

  <script>
    function validatePassword() {
      const passwordInput = document.getElementById('password');
      const password = passwordInput.value;
      const length = document.getElementById('length');
      const uppercase = document.getElementById('uppercase');
      const number = document.getElementById('number');
      const special = document.getElementById('special');
      const passwordCriteria = document.getElementById('passwordCriteria');
      const submitButton = document.getElementById('submitButton');

      if (password.length > 0) {
        passwordCriteria.classList.remove('hidden');

        const isLengthValid = password.length >= 8;
        const isUppercaseValid = /[A-Z]/.test(password);
        const isNumberValid = /[0-9]/.test(password);
        const isSpecialValid = /[!@#$%^&*]/.test(password);

        length.className = isLengthValid ? "text-green-400" : "text-red-500";
        uppercase.className = isUppercaseValid ? "text-green-400" : "text-red-500";
        number.className = isNumberValid ? "text-green-400" : "text-red-500";
        special.className = isSpecialValid ? "text-green-400" : "text-red-500";

        submitButton.disabled = !(isLengthValid && isUppercaseValid && isNumberValid && isSpecialValid);
      } else {
        passwordCriteria.classList.add('hidden');
        submitButton.disabled = false;
      }
    }

    window.onload = validatePassword;
  </script>

</body>
</html>