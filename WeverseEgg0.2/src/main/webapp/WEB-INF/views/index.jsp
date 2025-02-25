<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전자시계</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="/js/Clock.js" defer></script>
</head>
<body class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
    <div class="text-center">
        <h1 class="text-3xl font-bold mb-4">디지털 시계</h1>
        <div id="clock" class="text-5xl font-mono bg-white p-4 rounded-lg shadow-md">--:--:--</div>
    </div>
    
    <div class="mt-8 text-center">
        <h2 class="text-2xl font-bold mb-2">타이머</h2>
        <input id="timerInput" type="number" placeholder="초 입력" class="border p-2 rounded-md">
        <button id="startTimer" class="ml-2 bg-blue-500 text-white px-4 py-2 rounded-md">시작</button>
        <div id="timer" class="text-4xl font-mono bg-white p-4 mt-4 rounded-lg shadow-md">00:00</div>
    </div>
</body>
</html>