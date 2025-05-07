<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Contact Us | LankaRails</title>
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
	<section class="bg-gradient-to-r from-indigo-50 to-indigo-100 py-24 text-center">
		<div class="container mx-auto px-4">
			<h1 class="text-5xl font-bold text-indigo-900 mb-4">Need Help? Contact LankaRails</h1>
			<p class="text-lg text-gray-600 max-w-2xl mx-auto">Questions about train schedules, reservations, or feedback? Our team is here to assist you.</p>
		</div>
	</section>

	<!-- Contact Options -->
	<section class="py-20 bg-white">
		<div class="container mx-auto px-4">
			<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 text-center">

				<!-- Office Address -->
				<div class="p-8 bg-indigo-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-indigo-100 rounded-full flex items-center justify-center text-indigo-600 text-2xl">
						<i class="fas fa-map-marker-alt"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-indigo-900">Visit Us</h3>
					<p class="text-gray-600">Railway HQ<br>Colombo 10, Sri Lanka</p>
				</div>

				<!-- Email -->
				<div class="p-8 bg-blue-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-blue-100 rounded-full flex items-center justify-center text-blue-600 text-2xl">
						<i class="fas fa-envelope"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-blue-900">Email</h3>
					<p><a href="mailto:support@lankarails.lk" class="text-blue-600 hover:underline">support@lankarails.lk</a></p>
				</div>

				<!-- Phone Numbers -->
				<div class="p-8 bg-indigo-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-indigo-100 rounded-full flex items-center justify-center text-indigo-600 text-2xl">
						<i class="fas fa-phone"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-indigo-900">Call Us</h3>
					<p class="text-gray-600">+94 112 222 333<br>+94 777 654 321</p>
				</div>

				<!-- Social Links -->
				<div class="p-8 bg-yellow-50 rounded-2xl shadow hover:shadow-lg transition transform hover:-translate-y-1">
					<div class="w-16 h-16 mx-auto mb-4 bg-yellow-100 rounded-full flex items-center justify-center text-yellow-600 text-2xl">
						<i class="fas fa-share-alt"></i>
					</div>
					<h3 class="text-xl font-bold mb-2 text-yellow-900">Follow Us</h3>
					<div class="flex justify-center gap-4 text-2xl text-yellow-600 mt-2">
						<a href="https://facebook.com/lankarails" target="_blank"><i class="fab fa-facebook"></i></a>
						<a href="https://twitter.com/lankarails" target="_blank"><i class="fab fa-twitter"></i></a>
						<a href="https://instagram.com/lankarails" target="_blank"><i class="fab fa-instagram"></i></a>
						<a href="https://linkedin.com/company/lankarails" target="_blank"><i class="fab fa-linkedin"></i></a>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- CTA Section -->
	<section class="py-16 bg-indigo-600 text-white text-center">
		<div class="container mx-auto px-4">
			<h2 class="text-3xl font-bold mb-4">Have a partnership idea?</h2>
			<p class="text-lg mb-6">Collaborate with LankaRails for transport solutions, railway advertising, or data integrations. Let’s connect.</p>
			<a href="mailto:support@lankarails.lk" class="bg-white text-indigo-700 font-semibold px-6 py-3 rounded-lg hover:bg-indigo-100 transition">
				Email Our Team
			</a>
		</div>
	</section>

	<%@ include file="partials/footer.jsp"%>
</body>
</html>