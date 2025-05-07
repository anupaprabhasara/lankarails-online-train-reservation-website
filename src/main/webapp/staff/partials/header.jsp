<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String uri = request.getRequestURI();
    String pageTitle = "Staff Dashboard";

    if (uri.contains("/staff/staff")) {
        pageTitle = "Staff Management";
    } else if (uri.contains("/staff/train")) {
        pageTitle = "Train Management";
    } else if (uri.contains("/staff/schedule")) {
        pageTitle = "Schedule Management";
    } else if (uri.contains("/staff/journey")) {
        pageTitle = "Journeys Management";
    } else if (uri.contains("/staff/reservation")) {
        pageTitle = "Reservations";
    }
    request.setAttribute("pageTitle", pageTitle);
%>

<header class="bg-slate-900 shadow-md border-b border-slate-700 px-6 py-4 flex items-center justify-between">
    <!-- Left: Page Title -->
    <h2 class="text-2xl font-semibold text-green-400 tracking-wide">
        ${pageTitle}
    </h2>

    <!-- Right: User Info -->
    <div class="flex items-center gap-4">
        <!-- Text Info -->
        <div class="text-sm text-right">
            <p class="text-white font-medium">${sessionScope.username}</p>
            <p class="text-slate-400 text-xs">${sessionScope.email}</p>
        </div>

        <!-- Profile Avatar -->
        <img
            src="https://ui-avatars.com/api/?name=${sessionScope.username}&background=1e293b&color=22c55e"
            alt="Profile"
            class="w-10 h-10 rounded-full ring-2 ring-green-500 shadow-md transition hover:scale-105"
        />
    </div>
</header>