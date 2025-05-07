<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Contact Us | SwiftBus</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/client/assets/favicon.png" type="image/png">
	<script src="https://cdn.tailwindcss.com"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<!-- Navbar -->
	<c:choose>
		<c:when test="${isLoggedIn}">
			<%@ include file="partials/navbarsession.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="partials/navbar.jsp"%>
		</c:otherwise>
	</c:choose>

	<!-- Hero Section -->
	<section class="bg-gradient-to-r from-green-50 to-green-100 py-24 text-center">
		<div class="container mx-auto px-4">
			<h1 class="text-5xl font-bold text-green-900 mb-4">Need Help? Contact Us</h1>
			<p class="text-lg text-gray-600 max-w-2xl mx-auto">Whether it's a booking issue, feedback, or a route suggestion — our team is always ready to assist you.</p>
		</div>
	</section>

	<!-- Contact Options -->
	<section class="py-20 bg-white">
		<div class="container mx-auto px-4">
			<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 text-center">

				<!-- Office Address -->
				<div class="p-8 bg-green-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-green-100 rounded-full flex items-center justify-center text-green-600 text-2xl">
						<i class="fas fa-map-marker-alt"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-green-900">Visit Us</h3>
					<p class="text-gray-600">456 Bus Lane<br>Colombo 01, Sri Lanka</p>
				</div>

				<!-- Email -->
				<div class="p-8 bg-blue-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 text-2xl">
						<i class="fas fa-envelope"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-blue-900">Email</h3>
					<p><a href="mailto:help@swiftbus.lk" class="text-blue-600 hover:underline">help@swiftbus.lk</a></p>
				</div>

				<!-- Phone Numbers -->
				<div class="p-8 bg-green-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-green-100 rounded-full flex items-center justify-center text-green-600 text-2xl">
						<i class="fas fa-phone"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-green-900">Call Us</h3>
					<p class="text-gray-600">+94 770 123 456<br>+94 112 789 456</p>
				</div>

				<!-- Social Links -->
				<div class="p-8 bg-yellow-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-yellow-100 rounded-full flex items-center justify-center text-yellow-600 text-2xl">
						<i class="fas fa-share-alt"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-yellow-900">Follow Us</h3>
					<div class="flex justify-center gap-4 text-2xl text-yellow-600 mt-2">
						<a href="https://facebook.com/swiftbus" target="_blank"><i class="fab fa-facebook"></i></a>
						<a href="https://twitter.com/swiftbus" target="_blank"><i class="fab fa-twitter"></i></a>
						<a href="https://instagram.com/swiftbus" target="_blank"><i class="fab fa-instagram"></i></a>
						<a href="https://linkedin.com/company/swiftbus" target="_blank"><i class="fab fa-linkedin"></i></a>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- CTA -->
	<section class="py-16 bg-green-600 text-white text-center">
		<div class="container mx-auto px-4">
			<h2 class="text-3xl font-bold mb-4">Have a business inquiry?</h2>
			<p class="text-lg mb-6">We're open to partnerships with transport services, sponsors, or agencies. Reach out to our support team now.</p>
			<a href="mailto:help@swiftbus.lk" class="bg-white text-green-700 font-semibold px-6 py-3 rounded-lg hover:bg-green-100 transition">
				Email Our Team
			</a>
		</div>
	</section>

	<%@ include file="partials/footer.jsp"%>
</body>
</html>