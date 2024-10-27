<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Add Product</title>
    <!-- Bootstrap CSS and FontAwesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Your existing CSS styles */
    </style>
</head>
<body>
    <div class="overlay"></div>
    <section>
        <div class="container p-5 mt-3">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            Add Product
                        </div>
                        <div class="card-body">
                            <!-- Success/Error Messages -->
                            <c:if test="${not empty sessionScope.succMsg}">
                                <p class="text-success fw-bold" id="success-alert">${sessionScope.succMsg}</p>
                                <%
                                    session.removeAttribute("succMsg");
                                %>
                            </c:if>
                            <c:if test="${not empty sessionScope.errorMsg}">
                                <p class="text-danger fw-bold" id="error-alert">${sessionScope.errorMsg}</p>
                                <%
                                    session.removeAttribute("errorMsg");
                                %>
                            </c:if>

                            <!-- Form -->
                            <form action="${pageContext.request.contextPath}/admin/saveProduct" method="post" enctype="multipart/form-data">
                                <!-- Title and Description -->
                                <div class="mb-3">
                                    <label class="form-label">Enter Title</label>
                                    <input type="text" name="title" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Enter Description</label>
                                    <textarea rows="3" class="form-control" name="description" required></textarea>
                                </div>

                                <!-- Category -->
                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" name="category" required>
                                        <option value="">-- Select --</option>
                                        <c:forEach var="c" items="${categories}">
                                            <option value="${c.name}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- New Fields: Type, SubCategory, Size -->
                                <div class="mb-3">
                                    <label class="form-label">Type</label>
                                    <select class="form-select" name="type" required>
                                        <option value="">-- Select --</option>
                                        <option value="Men">Men</option>
                                        <option value="Women">Women</option>
                                        <option value="Kids">Kids</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">SubCategory</label>
                                    <input type="text" name="subCategory" class="form-control" placeholder="E.g., Kurti, Shirts, etc." required>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Size</label>
                                    <input type="text" name="size" class="form-control" placeholder="Specify size options" required>
                                </div>

                                <!-- Price, Stock, and Image -->
                                <div class="mb-3">
                                    <label class="form-label">Enter Price</label>
                                    <input type="number" name="price" class="form-control" required>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Enter Stock</label>
                                        <input type="number" name="stock" class="form-control" required>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label class="form-label">Upload Image</label>
                                        <input type="file" name="file" class="form-control">
                                    </div>
                                </div>

                                <!-- Status -->
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" value="true" name="isActive" id="active" checked>
                                        <label class="form-check-label" for="active">Active</label>
                                    </div>
                                    <div class="form-check form-check-inline" style="margin-left: 20px;">
                                        <input class="form-check-input" type="radio" name="isActive" value="false" id="inactive">
                                        <label class="form-check-label" for="inactive">Inactive</label>
                                    </div>
                                </div>

                                <button class="btn btn-primary col-md-12" type="submit">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    // Fade out and hide the alert messages after 2 seconds
    setTimeout(function() {
        const successAlert = document.getElementById("success-alert");
        if (successAlert) {
            successAlert.style.transition = "opacity 0.5s ease-out";
            successAlert.style.opacity = "0";
            setTimeout(() => successAlert.style.display = "none", 500);
        }

        const errorAlert = document.getElementById("error-alert");
        if (errorAlert) {
            errorAlert.style.transition = "opacity 0.5s ease-out";
            errorAlert.style.opacity = "0";
            setTimeout(() => errorAlert.style.display = "none", 500);
        }
    }, 2000);  // 2000ms = 2 seconds
</script>
</body>
</html>
