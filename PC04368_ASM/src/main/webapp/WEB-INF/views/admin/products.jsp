
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title></title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="/forAdmin/assets/css/tailwind.output.css" />
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="/forAdmin/assets/js/init-alpine.js"></script>
<link rel="stylesheet" href="/forAdmin/assets/css/styles.css">
</head>

<body>
	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen}">
		<!-- Desktop sidebar -->
		<aside
			class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="#"> Windmill </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/index"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">Dashboard</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/accounts"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">Accounts</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/categories"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">Categories</span>
					</a></li>

					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/charts"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                  <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg> <span class="ml-4">Charts</span>
					</a></li>
					<li class="relative px-6 py-3"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="/admin/products"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path>
                </svg> <span class="ml-4">Products</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/reports"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg> <span class="ml-4">Reports</span>
					</a></li>

					
				</ul>
			</div>
		</aside>
		<!-- Mobile sidebar -->
		<!-- Backdrop -->
		<div x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0"
			class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
		<aside
			class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
			x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0 transform -translate-x-20"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0 transform -translate-x-20"
			@click.away="closeSideMenu" @keydown.escape="closeSideMenu">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="#"> Windmill </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/index"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">Dashboard</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/accounts"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">Accounts</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/categories"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">Categories</span>
					</a></li>

					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/charts"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                  <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg> <span class="ml-4">Charts</span>
					</a></li>
					<li class="relative px-6 py-3"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="/admin/products"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path>
                </svg> <span class="ml-4">Products</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="/admin/reports"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg> <span class="ml-4">Reports</span>
					</a></li>

					
				</ul>
			</div>
		</aside>
		<div class="flex flex-col flex-1">
			<header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
				<div
					class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
					<!-- Mobile hamburger -->
					<button
						class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
						@click="toggleSideMenu" aria-label="Menu">
						<svg class="w-6 h-6" aria-hidden="true" fill="currentColor"
							viewBox="0 0 20 20">
                <path fill-rule="evenodd"
								d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
								clip-rule="evenodd"></path>
              </svg>
					</button>
					<!-- Search input -->
					<div class="flex justify-center flex-1 lg:mr-32">
						<div
							class="relative w-full max-w-xl mr-6 focus-within:text-purple-500">
							<div class="absolute inset-y-0 flex items-center pl-2">
								<svg class="w-4 h-4" aria-hidden="true" fill="currentColor"
									viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
										d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
										clip-rule="evenodd"></path>
                  </svg>
							</div>

							<c:set var="savedKeyword" value="${sessionScope.keywords}" />

							<form action="/admin/products" method="get">
								<input
									class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
									type="text" name="name" placeholder="Search for projects"
									aria-label="Search" />

							</form>



						</div>
					</div>
					<ul class="flex items-center flex-shrink-0 space-x-6">
						<!-- Theme toggler -->
						<li class="flex">
							<button
								class="rounded-md focus:outline-none focus:shadow-outline-purple"
								@click="toggleTheme" aria-label="Toggle color mode">
								<template x-if="!dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                      <path
											d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                    </svg>
								</template>
								<template x-if="dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                      <path fill-rule="evenodd"
											d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
											clip-rule="evenodd"></path>
                    </svg>
								</template>
							</button>
						</li>
						<!-- Notifications menu -->
						<li class="relative">
							<button
								class="relative align-middle rounded-md focus:outline-none focus:shadow-outline-purple"
								@click="toggleNotificationsMenu"
								@keydown.escape="closeNotificationsMenu"
								aria-label="Notifications" aria-haspopup="true">
								<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
									viewBox="0 0 20 20">
                    <path
										d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
                  </svg>
								<!-- Notification badge -->
								<span aria-hidden="true"
									class="absolute top-0 right-0 inline-block w-3 h-3 transform translate-x-1 -translate-y-1 bg-red-600 border-2 border-white rounded-full dark:border-gray-800"></span>
							</button>
							<template x-if="isNotificationsMenuOpen">
								<ul x-transition:leave="transition ease-in duration-150"
									x-transition:leave-start="opacity-100"
									x-transition:leave-end="opacity-0"
									@click.away="closeNotificationsMenu"
									@keydown.escape="closeNotificationsMenu"
									class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:text-gray-300 dark:border-gray-700 dark:bg-gray-700"
									aria-label="submenu">
									<li class="flex"><a
										class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <span>Messages</span> <span
											class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600">
												13 </span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <span>Sales</span> <span
											class="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600">
												2 </span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center justify-between w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <span>Alerts</span>
									</a></li>
								</ul>
							</template>
						</li>
						<!-- Profile menu -->
						<li class="relative">
							<button
								class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
								@click="toggleProfileMenu" @keydown.escape="closeProfileMenu"
								aria-label="Account" aria-haspopup="true">
								<img class="object-cover w-8 h-8 rounded-full"
									src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
									alt="" aria-hidden="true" />
							</button>
							<template x-if="isProfileMenuOpen">
								<ul x-transition:leave="transition ease-in duration-150"
									x-transition:leave-start="opacity-100"
									x-transition:leave-end="opacity-0"
									@click.away="closeProfileMenu"
									@keydown.escape="closeProfileMenu"
									class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
									aria-label="submenu">
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <svg class="w-4 h-4 mr-3" aria-hidden="true"
												fill="none" stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                          <path
													d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg> <span>Profile</span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <svg class="w-4 h-4 mr-3" aria-hidden="true"
												fill="none" stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                          <path
													d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                          <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg> <span>Settings</span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="/logout"> <svg class="w-4 h-4 mr-3" aria-hidden="true"
												fill="none" stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                          <path
													d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                        </svg> <span>Log out</span>
									</a></li>
								</ul>
							</template>
						</li>
					</ul>
				</div>
			</header>
			<main class="h-full pb-16 overflow-y-auto">
				<div class="container px-6 mx-auto grid">
					<h2
						class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
						Forms</h2>

					<c:if test="${not empty message}">
						<div class="error-message">${message}</div>
					</c:if>



					<form:form action="/product/index" modelAttribute="product"
						method="post" enctype="multipart/form-data">
						<div
							class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">

							<form:label path="id" class=" mt-4 block text-sm"
								style="display: none;">
								<span class="text-gray-700 dark:text-gray-400">ID</span>
								<form:input path="id" name="id"
									class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
									type="text" placeholder="Jane Doe" />
							</form:label>

							<form:label path="name" class=" mt-4 block text-sm">
								<span class="text-gray-700 dark:text-gray-400">Name</span>
								<form:input path="name" name="name"
									class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
									type="text" placeholder="Jane Doe" />
							</form:label>

							<div class="mt-4 text-sm">
								<label for="photo">Image</label> <input
									style="padding-bottom: 20px" type="file" name="file"
									id="fileInput" onchange="updateFileName(this)" /><br /> <img
									width="100px" alt="" src="/images/${currentImage}"> <span
									id="fileName">${currentImage}</span>
							</div>


							<form:label path="price" class=" mt-4 block text-sm">
								<span class="text-gray-700 dark:text-gray-400">Price</span>
								<form:input path="price"
									class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
									type="number" placeholder="Jane Doe" />
							</form:label>


							<div class="mt-4 text-sm">
								<span class="text-gray-700 dark:text-gray-400"> Available
								</span>
								<div class="mt-2">
									<div class="form-group">
										<div class="radio">
											<!--value = 1 => Nam| 0 =>Nu -->
											<label class="checkbox-inline"> <form:checkbox
													path="available" />Active
											</label>
										</div>
									</div>
								</div>
							</div>





							<label class="block mt-4 text-sm"> <span
								class="text-gray-700 dark:text-gray-400"> Categories </span> <select
								name="category"
								class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
									<c:forEach var="category" items="${categories}">
										<option value="${category.id}"
											${category.id == product.category.id ? 'selected' : ''}>${category.name}</option>
									</c:forEach>
							</select>
							</label>



							<!-- HTML !-->
							<button formaction="/product/create" formmethod="post"
								class="buttonAdd">Create</button>
							<button formaction="/product/update" formmethod="post"
								class="buttonUpdate">Update</button>
							<a class="btn btn-info mr-3 mt-2 mb-2" href="/admin/products"><i
								class="fas fa-times-circle mr-2"></i>RESET</a>

						</div>
					</form:form>
					<h4
						class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
						List Products</h4>
					<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
						<div class="w-full overflow-x-auto">
							<table class="w-full whitespace-no-wrap">
								<thead>
									<tr
										class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
										<th class="px-4 py-3">Id</th>
										<th class="px-4 py-3">Name</th>
										<th class="px-4 py-3">Image</th>
										<th class="px-4 py-3">Price</th>
										<th class="px-4 py-3">CreateDate</th>
										<th class="px-4 py-3">Available</th>
										<th class="px-4 py-3">CategoryId</th>
										<th></th>
										<th></th>
									</tr>
								</thead>

								<c:forEach var="product" items="${page.content}">
									<tbody
										class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
										<tr class="text-gray-700 dark:text-gray-400">
											<td class="px-4 py-3">
												<div class="flex items-center text-sm">
													<!-- Avatar with inset shadow -->
													<div
														class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
														<img class="object-cover w-full h-full rounded-full"
															src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
															alt="" loading="lazy" />
														<div class="absolute inset-0 rounded-full shadow-inner"
															aria-hidden="true"></div>
													</div>
													<div>
														<p class="font-semibold">${product.id}</p>
													</div>
												</div>
											</td>
											<td class="px-4 py-3 text-sm">${product.name}</td>
											<td class="px-4 py-3 text-xs">${product.image}</td>
											<td class="px-4 py-3 text-sm">${product.price}</td>
											<td class="px-4 py-3 text-sm">${product.createDate}</td>
											<td class="px-4 py-3 text-sm">${product.available}</td>
											<td class="px-4 py-3 text-sm">${product.category.id}</td>
											<td class="px-4 py-3 text-sm"><a
												class="btn btn-primary mr-2"
												href="/product/edit/${product.id}" role="button">Edit</a></td>
											<td class="px-4 py-3 text-sm"><a
												class="btn btn-danger mr-2"
												href="/product/delete/${product.id}" role="button">Delete<i
													class="fas fa-times-circle"></i></a></td>
										</tr>
									</tbody>
								</c:forEach>

							</table>

						</div>
						<div
							class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
							<span class="flex items-center col-span-3"> Showing
								${page.numberOfElements} of ${page.totalElements} </span> <span
								class="col-span-2"></span>
							<!-- Pagination -->
							<span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
								<nav aria-label="Table navigation">
									<ul class="inline-flex items-center">
										<li>
											<button
												class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
												aria-label="Previous">
												<a class="btn btn-primary"
													href="/admin/products?p=0&name=${savedKeyword}"
													role="button">First</a>
											</button>
										</li>
										<li>
											<button
												class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
												<a class="btn btn-primary"
													href="/admin/products?p=${page.number-1}&name=${savedKeyword}"
													role="button">Previous</a>
											</button>
										</li>
										<li>
											<button
												class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
												<a class="btn btn-primary"
													href="/admin/products?p=${page.number+1}&name=${savedKeyword}"
													role="button">Next</a>
											</button>
										</li>
										<li>
											<button
												class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
												<a class="btn btn-primary"
													href="/admin/products?p=${page.totalPages-1}&name=${savedKeyword}"
													role="button">Last</a>
											</button>
										</li>

									</ul>
								</nav>
							</span>
						</div>
					</div>
				</div>
		</div>
	</div>


	</main>

</body>
<script>
    function updateFileName(input) {
        var fileName = input.value.split('\\').pop();
        var fileNameElement = document.getElementById('fileName');
        fileNameElement.textContent = fileName;
    }
</script>
</html>