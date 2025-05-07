<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- Navigation Bar (Non-Logged-In User) -->
<nav class="bg-blue-800 text-white sticky top-0 z-50 shadow-lg">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between items-center h-16">

      <!-- Brand -->
      <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold">
        <i class="fas fa-train"></i> <span>LankaRails</span>
      </a>

      <!-- Navigation Links -->
      <div class="hidden md:flex space-x-6">
        <a href="${pageContext.request.contextPath}/" class="hover:text-blue-200 transition">Home</a>
        <a href="${pageContext.request.contextPath}/journeys" class="hover:text-blue-200 transition">Journeys</a>
        <a href="${pageContext.request.contextPath}/schedules" class="hover:text-blue-200 transition">Schedules</a>
        <a href="${pageContext.request.contextPath}/contact" class="hover:text-blue-200 transition">Contact</a>
      </div>

      <!-- Right Section for Non-Logged-In Users -->
      <div class="flex items-center space-x-4">
        <!-- Auth Buttons -->
        <div class="flex space-x-2">
          <a href="${pageContext.request.contextPath}/login"
            class="px-4 py-2 text-sm font-medium text-white hover:text-blue-200 transition">Login</a>
          <a href="${pageContext.request.contextPath}/signup"
            class="px-4 py-2 bg-white text-blue-800 rounded-md text-sm font-semibold hover:bg-blue-100 transition">
            Sign Up
          </a>
        </div>
      </div>

    </div>
  </div>
</nav>