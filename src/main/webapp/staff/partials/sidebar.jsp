<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="fixed top-0 left-0 w-64 hidden md:flex flex-col bg-slate-900 border-r border-slate-700 shadow-lg h-screen z-30">
    <!-- Logo -->
    <div class="p-6 text-center border-b border-slate-700">
        <h1 class="text-2xl font-bold text-green-400">LankaRails</h1>
        <p class="text-sm text-slate-400">Staff Panel</p>
    </div>

    <!-- Navigation -->
    <nav class="flex-1 px-4 py-6 space-y-2 overflow-y-auto">

        <a href="${pageContext.request.contextPath}/staff/train"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-train-subway mr-3"></i> Trains
        </a>

        <a href="${pageContext.request.contextPath}/staff/journey"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-route mr-3"></i> Journeys
        </a>

        <a href="${pageContext.request.contextPath}/staff/schedule"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-clock mr-3"></i> Schedules
        </a>

        <a href="${pageContext.request.contextPath}/staff/reservation"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-ticket-alt mr-3"></i> Reservations
        </a>

        <a href="${pageContext.request.contextPath}/staff/passenger"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-users mr-3"></i> Passengers
        </a>

        <a href="${pageContext.request.contextPath}/staff/manage"
            class="flex items-center p-3 rounded-lg text-slate-300 hover:bg-green-600/10 hover:text-white transition">
            <i class="fas fa-user-shield mr-3"></i> Staff
        </a>
    </nav>

    <!-- Logout -->
    <div class="p-4 border-t border-slate-700">
        <a href="${pageContext.request.contextPath}/staff/logout"
            class="w-full flex items-center justify-center text-red-400 hover:text-red-500 font-semibold transition">
            <i class="fas fa-sign-out-alt mr-2"></i> Logout
        </a>
    </div>
</aside>