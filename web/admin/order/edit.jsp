<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="./assets/admin/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="./assets/admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="./assets/admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="./assets/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="./assets/admin/css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <%@include file = "../inc/sidebar.jsp" %>
            <!-- Sidebar End -->
            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file = "../inc/navbar.jsp" %>
                <!-- Navbar End -->
                <!-- Table Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="bg-light rounded h-100 p-4">
                                <c:if test="${error != null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${error}
                                    </div>
                                    <c:remove var="error" scope="session"/>
                                </c:if>
                                <h6 class="mb-4">Edit Order</h6>
                                <form action="EditOrderServlet" method="post">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Code</label>
                                        <input name="code" type="text" value="${order.code}" class="form-control" id="exampleInputPassword1" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Status</label>
                                        <select name="status" class="form-control">
                                            <option <c:if test="${order.status == 'pending'}">selected</c:if>  value="pending">pending</option>
                                            <option <c:if test="${order.status == 'finished'}">selected</c:if>  value="finished">finished</option>
                                            <option <c:if test="${order.status == 'paid'}">selected</c:if>  value="paid">paid</option>
                                            </select>                                    
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label">User</label>
                                            <select name="user_id" class="form-control">
                                            <c:forEach items="${userList}" var="user">
                                                <option <c:if test="${user.id == order.userId}">selected</c:if>  value="${user.id}">${user.email}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <a href="IndexOrderServlet" class="btn btn-secondary">Cancel</a>
                                    <button type="submit" class="btn btn-primary">Edit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Table End -->


                <!-- Footer Start -->
                <%@include file = "../inc/footer.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./assets/admin/lib/chart/chart.min.js"></script>
        <script src="./assets/admin/lib/easing/easing.min.js"></script>
        <script src="./assets/admin/lib/waypoints/waypoints.min.js"></script>
        <script src="./assets/admin/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="./assets/admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>