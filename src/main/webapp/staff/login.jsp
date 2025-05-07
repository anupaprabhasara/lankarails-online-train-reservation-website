<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LankaRails | Staff Login</title>
    <link rel="shortcut icon" href="https://ui-avatars.com/api/?name=LankaRails&background=1e293b&color=22c55e&rounded=true" type="image/x-icon">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>

<body class="bg-slate-950 text-white flex items-center justify-center min-h-screen px-4">
    <div class="w-full max-w-md bg-slate-900 p-8 rounded-2xl shadow-lg ring-1 ring-slate-700">

        <!-- Title -->
        <h2 class="text-3xl font-extrabold text-center text-green-400">Staff Portal</h2>
        <p class="text-center text-gray-400 text-sm mb-6">Log in to manage LankaRails operations.</p>

        <!-- Error Alert -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="mb-4 px-4 py-2 bg-red-600/20 text-red-300 border border-red-500 rounded-md text-sm text-center">
            <i class="fa-solid fa-triangle-exclamation mr-2"></i><%= error %>
        </div>
        <%
            }
        %>

        <!-- Login Form -->
        <form action="${pageContext.request.contextPath}/staff/login" method="POST" class="space-y-5">

            <!-- Username or Email -->
            <div>
                <label for="username" class="block mb-1 text-sm font-medium text-gray-300">Username or Email</label>
                <div class="relative">
                    <input type="text" name="username" id="username" required placeholder="Enter your username/email"
                        class="w-full pl-10 pr-4 py-2 rounded-md bg-slate-800 text-white border border-slate-600 focus:ring-2 focus:ring-green-500 focus:outline-none" />
                    <i class="fa fa-user absolute left-3 top-2.5 text-gray-400"></i>
                </div>
            </div>

            <!-- Password -->
            <div>
                <label for="password" class="block mb-1 text-sm font-medium text-gray-300">Password</label>
                <div class="relative">
                    <input type="password" name="password" id="password" required placeholder="Enter your password"
                        class="w-full pl-10 pr-10 py-2 rounded-md bg-slate-800 text-white border border-slate-600 focus:ring-2 focus:ring-green-500 focus:outline-none" />
                    <i class="fa fa-lock absolute left-3 top-2.5 text-gray-400"></i>
                    <button type="button" onclick="togglePassword()" class="absolute right-3 top-2.5 text-gray-400">
                        <i id="eyeIcon" class="fa fa-eye"></i>
                    </button>
                </div>
            </div>

            <!-- Submit Button -->
            <div>
                <button type="submit"
                    class="w-full py-2 bg-green-600 hover:bg-green-700 text-white font-semibold rounded-md transition">
                    Login
                </button>
            </div>
        </form>

        <!-- Footer -->
        <p class="text-center text-sm text-gray-500 mt-6">LankaRails Staff System © 2025</p>
    </div>

    <!-- Password Toggle Script -->
    <script>
        function togglePassword() {
            const input = document.getElementById("password");
            const icon = document.getElementById("eyeIcon");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</body>
</html>