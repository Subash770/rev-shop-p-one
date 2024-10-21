<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
</head>
<body>
<h2>Register</h2>
<form id="register-form" action="${pageContext.request.contextPath}/registers" method="POST">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required/><br/>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required/><br/>

    <label for="dateOfBirth">Date of Birth:</label>
    <input type="date" id="dateOfBirth" name="dateOfBirth" required/><br/>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required/>
    <button type="button" id="verifyEmailBtn">Verify</button> <!-- Verify button -->
    <br/>

    <!-- OTP input field, hidden initially -->
    <div id="otp-section" style="display:none;">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="otp" maxlength="6" required/><br/>
        <input type="button" id="submitOtpBtn" value="Submit OTP" /> <!-- Submit button for OTP verification -->
    </div>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required/><br/>

    <label for="confirmPassword">Confirm Password:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required/><br/>

    <label for="userType">User Type:</label>
    <select id="userType" name="userType" required>
        <option value="">Select...</option>
        <option value="seller">Seller</option>
        <option value="buyer">Buyer</option>
        <option value="admin">Admin</option>
    </select><br/>

    <input type="submit" value="Register" id="registerSubmitBtn" disabled/> <!-- Disabled until OTP is verified -->
</form>

<p>Already registered? <a href="${pageContext.request.contextPath}/login">Login here</a>.</p>

<!-- Display error messages if present -->
<c:if test="${not empty errorMessage}">
    <p class="error">${errorMessage}</p>
</c:if>
<c:if test="${not empty successMessage}">
    <p class="success">${successMessage}</p>
</c:if>

<script>
    document.getElementById("verifyEmailBtn").addEventListener("click", function() {
        const email = document.getElementById("email").value;

        // Send request to trigger OTP email
        fetch('/send-otp', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email: email }) // Send email as JSON
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("OTP sent successfully to " + email);
                document.getElementById("otp-section").style.display = "block"; // Show OTP input field
            } else {
                alert("Failed to send OTP. Please try again.");
            }
        })
        .catch(error => console.error('Error:', error));
    });

    document.getElementById("submitOtpBtn").addEventListener("click", function() {
        const otp = document.getElementById("otp").value;
        const email = document.getElementById("email").value;

        // Verify the OTP before enabling form submission
        fetch(`/verify-otp?email=${email}&otp=${otp}`, {
            method: "POST"
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("OTP verified successfully!");
                document.getElementById("registerSubmitBtn").disabled = false; // Enable the main register button
                document.getElementById("otp-section").style.display = "none"; // Optionally hide the OTP section after verification
            } else {
                alert("Invalid OTP. Please try again.");
            }
        })
        .catch(error => console.error('Error:', error));
    });
</script>

</body>
</html>
